package Persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Disciplina;
import Model.Professor;

public class DisciplinaDao implements ICrud<Disciplina> {
	private GenericDao gDao;

	public DisciplinaDao(GenericDao gDao) {
		this.gDao = gDao;
	}

	@Override
	public void inserir(Disciplina d) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		String sql = "INSERT INTO disciplina VALUES (?,?,?)";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(1, d.getCodigo());
		ps.setString(2, d.getNome());
		ps.setInt(3, d.getProfessor().getCodigo());
		ps.execute();
		ps.close();
		c.close();
	}

	@Override
	public void atualizar(Disciplina d) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		String sql = "UPDATE disciplina SET nome=?, codigoProfessor=? WHERE codigo=?";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setString(1, d.getNome());
		ps.setInt(2, d.getProfessor().getCodigo());
		ps.setInt(3, d.getCodigo());
		ps.execute();
		ps.close();
		c.close();
	}

	@Override
	public void excluir(Disciplina d) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		String sql = "DELETE disciplina WHERE codigo=?";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(1, d.getCodigo());
		ps.execute();
		ps.close();
		c.close();
	}

	@Override
	public Disciplina consultar(Disciplina d) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT d.codigo AS CodDisciplina, d.nome AS NomeDisciplina, ");
		sql.append("p.codigo AS CodProfessores, p.nome As NomeProfessores, p.titulacao As TitProfessores ");
		sql.append("FROM professor p, disciplina d ");
		sql.append("WHERE p.codigo = d.codigoProfessor ");
		sql.append("AND d.codigo=?");
		
		PreparedStatement ps = c.prepareStatement(sql.toString());
		ps.setInt(1, d.getCodigo());
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			Professor p = new Professor();
			p.setCodigo(rs.getInt("codProf"));
			p.setNome(rs.getString("nomeProf"));
			p.setTitulacao(rs.getString("titProf"));
			
			d.setCodigo(rs.getInt("codDisc"));
			d.setNome(rs.getString("nomeDisc"));
			d.setProfessor(p);
		}
		rs.close();
		ps.close();
		c.close();
		return d;
	}

	@Override
	public List<Disciplina> listar() throws SQLException, ClassNotFoundException {
		List<Disciplina> disciplinas = new ArrayList<>();
		Connection c = gDao.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT d.codigo AS CodDisciplina, d.nome AS NomeDisciplina, ");
		sql.append("p.codigo AS CodProfessores, p.nome As NomeProfessores, p.titulacao As TitProfessores ");
		sql.append("FROM professor p, disciplina d ");
		sql.append("WHERE p.codigo = d.codigoProfessor ");
		
		PreparedStatement ps = c.prepareStatement(sql.toString());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Professor p = new Professor();
			p.setCodigo(rs.getInt("codProf"));
			p.setNome(rs.getString("nomeProf"));
			p.setTitulacao(rs.getString("titProf"));
			
			Disciplina d = new Disciplina();
			d.setCodigo(rs.getInt("codDisc"));
			d.setNome(rs.getString("nomeDisc"));
			d.setProfessor(p);
			
			disciplinas.add(d);
		}
		rs.close();
		ps.close();
		c.close();
		return disciplinas;
	}
}