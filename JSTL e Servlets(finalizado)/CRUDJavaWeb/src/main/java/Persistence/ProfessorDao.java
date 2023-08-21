package Persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Professor;

public class ProfessorDao implements ICrud<Professor> {

	private GenericDao gDao;

	public ProfessorDao(GenericDao gDao) {
		this.gDao = gDao;
	}

	@Override
	public void inserir(Professor p) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		String sql = "INSERT INTO professor VALUES (?,?,?)";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(1, p.getCodigo());
		ps.setString(2, p.getNome());
		ps.setString(3, p.getTitulacao());
		ps.execute();
		ps.close();
		c.close();
	}

	@Override
	public void atualizar(Professor p) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		String sql = "UPDATE professor SET nome=?, titulacao=? WHERE codigo=?";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setString(1, p.getNome());
		ps.setString(2, p.getTitulacao());
		ps.setInt(3, p.getCodigo());
		ps.execute();
		ps.close();
		c.close();
	}

	@Override
	public void excluir(Professor p) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		String sql = "DELETE professor WHERE codigo=?";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(1, p.getCodigo());
		ps.execute();
		ps.close();
		c.close();
	}

	@Override
	public Professor consultar(Professor p) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		String sql = "SELECT nome, titulacao FROM professor WHERE codigo=?";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(1, p.getCodigo());
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			p.setCodigo(rs.getInt("codigo"));
			p.setNome(rs.getString("nome"));
			p.setTitulacao(rs.getString("titulacao"));
		}
		rs.close();
		ps.close();
		c.close();
		return p;
	}

	@Override
	public List<Professor> listar() throws SQLException, ClassNotFoundException {
		List<Professor> professores = new ArrayList<>();
		Connection c = gDao.getConnection();
		String sql = "SELECT codigo, nome, titulacao FROM professor";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Professor p = new Professor();
			p.setCodigo(rs.getInt("codigo"));
			p.setNome(rs.getString("nome"));
			p.setTitulacao(rs.getString("titulacao"));
			professores.add(p);
		}
		rs.close();
		ps.close();
		c.close();
		return professores;
	}
}