<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheewt" href="./CSS/Stylescss.css">
<title>Professor</title>
</head>
<body>
	<div>
		<jsp:include page="Menu.jsp" />
	</div>
	<br>
	<div align="center" class="container">
		<form action="professor" method="post">
			<p class="title">
				<b>Professor</b>
			</p>
			<table>
				<tr>
					<td colspan="3"><input class="imput_data_id" type="number"
						min="0" step="1" id="codigo" name="codigo" placeholder="Codigo"
						value='<c:out value="${professor.codigo}"></c:out>'></td>
					<td><input type="submit" id="botao" name="botao"
						value="Buscar"></td>
				</tr>
				<tr>
					<td colspan="4"><input class="imput_data" type="text"
						id="name" name="nome" placeholder="Nome"
						value='<c:out value="${professor.nome}"></c:out>'></td>
				</tr>
				<tr>
					<td colspan="4"><input class="imput_data" type="text"
						id="titulacao" name="titulacao" placeholder="Titulação"
						value='<c:out value="${professor.titulacao}"></c:out>'></td>
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
		<c:if test="${not empty professores }">
			<table class="table_round">
				<thead>
					<tr>
						<th>Codigo</th>
						<th>Nome</th>
						<th>Titulação</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${professores}">
						<tr>
							<td><c:out value="${p.codigo}"></c:out></td>
							<td><c:out value="${p.nome}"></c:out></td>
							<td><c:out value="${p.titulacao}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</body>
</html>