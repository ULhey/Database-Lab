package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Disciplina;
import Model.Professor;
import Persistence.DisciplinaDao;
import Persistence.GenericDao;
import Persistence.ProfessorDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/disciplina")
public class DisciplinaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DisciplinaServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String erro = "";
		List<Professor> professores = new ArrayList<>();

		GenericDao gDao = new GenericDao();
		ProfessorDao pDao = new ProfessorDao(gDao);

		try {
			professores = pDao.listar();
		} catch (ClassNotFoundException | SQLException e) {
			erro = e.getMessage();
		} finally {
			request.setAttribute("erro", erro);
			request.setAttribute("professores", professores);

			RequestDispatcher rd = request.getRequestDispatcher("Disciplina.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Entrada
		String cmd = request.getParameter("botao");
		String codigo = request.getParameter("codigo");
		String nome = request.getParameter("nome");
		String professor = request.getParameter("professor");

		// Retorno
		String saida = "";
		String erro = "";
		Disciplina d = new Disciplina();
		List<Disciplina> disciplinas = new ArrayList<>();
		List<Professor> professores = new ArrayList<>();

		if (!cmd.contains("Listar")) {
			d.setCodigo(Integer.parseInt(codigo));
		}
		try {
			professores = listarProfessores();
			if (cmd.contains("Cadastrar") || cmd.contains("Alterar")) {
				d.setNome(nome);
				Professor p = new Professor();
				p.setCodigo(Integer.parseInt(professor));
				p = buscarProfessor(p);
				d.setProfessor(p);
			}
			if (cmd.contains("Cadastrar")) {
				cadastrarDisciplina(d);
				saida = "Disciplina cadastrado com sucesso!";
				d = null;
			}
			if (cmd.contains("Alterar")) {
				alterarDisciplina(d);
				saida = "Disciplina alterado com sucesso!";
				d = null;
			}
			if (cmd.contains("Excluir")) {
				excluirDisciplina(d);
				saida = "Disciplina excluido com sucesso!";
				d = null;
			}
			if (cmd.contains("Buscar")) {
				d = buscarDisciplina(d);
			}
			if (cmd.contains("Listar")) {
				disciplinas = listarDisciplinas();
			}
		} catch (SQLException | ClassNotFoundException e) {
			erro = e.getMessage();
		}finally {
			request.setAttribute("saida", saida);
			request.setAttribute("erro", erro);
			request.setAttribute("disciplina", d);
			request.setAttribute("disciplinas", disciplinas);
			request.setAttribute("professores", professores);

			RequestDispatcher rd = request.getRequestDispatcher("Disciplina.jsp");
			rd.forward(request, response);
		}
	}

	private void cadastrarDisciplina(Disciplina d) throws SQLException, ClassNotFoundException{
		GenericDao gDao = new GenericDao();
		DisciplinaDao dDao = new DisciplinaDao(gDao);
		dDao.inserir(d);
	}

	private void alterarDisciplina(Disciplina d) throws SQLException, ClassNotFoundException{
		GenericDao gDao = new GenericDao();
		DisciplinaDao dDao = new DisciplinaDao(gDao);
		dDao.atualizar(d);
	}

	private void excluirDisciplina(Disciplina d) throws SQLException, ClassNotFoundException{
		GenericDao gDao = new GenericDao();
		DisciplinaDao dDao = new DisciplinaDao(gDao);
		dDao.excluir(d);
	}

	private Disciplina buscarDisciplina(Disciplina d) throws SQLException, ClassNotFoundException{
		GenericDao gDao = new GenericDao();
		DisciplinaDao dDao = new DisciplinaDao(gDao);
		d = dDao.consultar(d);
		return d;
	}

	private List<Disciplina> listarDisciplinas() throws SQLException, ClassNotFoundException{
		GenericDao gDao = new GenericDao();
		DisciplinaDao dDao = new DisciplinaDao(gDao);
		List<Disciplina> disciplinas = dDao.listar();
		return disciplinas;
	}

	private Professor buscarProfessor(Professor p) throws SQLException, ClassNotFoundException {
		GenericDao gDao = new GenericDao();
		ProfessorDao pDao = new ProfessorDao(gDao);
		p = pDao.consultar(p);
		return p;
	}

	private List<Professor> listarProfessores() throws ClassNotFoundException, SQLException {
		GenericDao gDao = new GenericDao();
		ProfessorDao pDao = new ProfessorDao(gDao);
		List<Professor> professores = pDao.listar();

		return professores;
	}
}
