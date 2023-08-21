<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheewt" href="./CSS/Stylescss.css">
<title>Disciplina</title>
</head>
<body>
	<div>
		<jsp:include page="Menu.jsp" />
	</div>
	<br>
	<div align="center" class="container">
		<form action="disciplina" method="post">
			<p class="title">
				<b>Disciplina</b>
			</p>
			<table>
				<tr>
					<td colspan="3"><input class="imput_data_id" type="number"
						min="0" step="1" id="codigo" name="codigo" placeholder="Codigo"
						value='<c:out value="${disciplina.codigo}"></c:out>'></td>
					<td><input type="submit" id="botao" name="botao"
						value="Buscar"></td>
				</tr>
				<tr>
					<td colspan="4"><input class="imput_data" type="text"
						id="name" name="nome" placeholder="Nome"
						value='<c:out value="${disciplina.nome}"></c:out>'></td>
				</tr>
				<tr>
					<td colspan="4"><select class="imput_data" id="professor"
						name="professor">
							<option value="0">Escolha um professor</option>
							<c:forEach var="p" items="${professores}">
								<c:if
									test="${(empty disciplina) || (p.codigo ne disciplina.professor.codigo) }">
									<option value="${p.codigo}">
										<c:out value="${p}"></c:out>
									</option>
								</c:if>
								<c:if test="${p.codigo eq disiciplina.professor.codigo }">
									<option value="${p.codigo}" selected="selected">
										<c:out value="${p}" />
									</option>
								</c:if>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td><input type="submit" id="botao" name="botao"
						value="Cadastrar"></td>

					<td><input type="submit" id="botao" name="botao"
						value="Alterar"></td>

					<td><input type="submit" id="botao" name="botao"
						value="Excluir"></td>
					<td><input type="submit" id="botao" name="botao"
						value="Listar"></td>
				</tr>
			</table>
		</form>
	</div>
	<div align="center">
		<c:if test="${not empty erro}">
			<h2>
				<b><c:out value="${erro}" /></b>
			</h2>
		</c:if>
	</div>
	<div align="center">
		<c:if test="${not empty saida}">
			<h3>
				<b><c:out value="${saida}" /></b>
			</h3>
		</c:if>
	</div>
	<br>
	<br>
	<div align="center">
		<c:if test="${not empty disciplinas}">
			<table class="table_round">
				<thead>
					<tr>
						<th>Codigo</th>
						<th>Nome</th>
						<th>Professor</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="d" items="${disciplinas}">
						<tr>
							<td><c:out value="${d.codigo}"></c:out></td>
							<td><c:out value="${d.nome}"></c:out></td>
							<td><c:out value="${d.professor}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</body>
</html>