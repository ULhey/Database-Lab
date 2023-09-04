<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<title>Cliente</title>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
		<li class="nav-item"><a class="nav-link active"
			href="${pageContext.request.contextPath}/cliente">Cliente</a></li>
	</ul>
	<div align="center" class="container">
		<br>
		<p class="fs-1">
			<b>Cliente CPF</b>
		</p>
		<form action="cliente" method="post">
			<table>
				<tr>
					<td colspan="3"><input class="form-control" type="number"
						id="cpf" name="cpf" placeholder="CPF"
						value='<c:out value="${cliente.cpf}"></c:out>'></td>
					<td><input class="btn btn-dark" type="submit" id="botao"
						name="botao" value="Buscar"></td>
				</tr>
				<tr>
					<td colspan="4"><input class="form-control" type="text"
						id="name" name="nome" placeholder="Nome"
						value='<c:out value="${cliente.nome}"></c:out>'></td>
				</tr>
				<tr>
					<td colspan="4"><input class="form-control" type="text"
						id="email" name="email" placeholder="Email"
						value='<c:out value="${cliente.email}"></c:out>'></td>
				</tr>
				<tr>
					<td colspan="4"><input class="form-control" type="text"
						id="limiteCred" name="limiteCred" placeholder="limite de Crédito"
						value='<c:out value="${cliente.limiteCred}"></c:out>'></td>
				</tr>
				<tr>
					<td colspan="4"><input class="form-control" type="date"
						id="dataNasc" name="dataNasc" placeholder="Data de Nascimento"
						value='<c:out value="${cliente.dataNasc}"></c:out>'></td>
				</tr>
				<tr>
					<td><input class="btn btn-dark" type="submit" id="botao"
						name="botao" value="Cadastrar"></td>
					<td><input class="btn btn-dark" type="submit" id="botao"
						name="botao" value="Alterar"></td>
					<td><input class="btn btn-dark" type="submit" id="botao"
						name="botao" value="Excluir"></td>
					<td><input class="btn btn-dark" type="submit" id="botao"
						name="botao" value="Listar"></td>
				</tr>
			</table>
		</form>
	</div>
	<br>
	<c:if test="${not empty clientes }">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th><b>CPF</b></th>
				<th><b>Nome</b></th>
				<th><b>Email</b></th>
				<th><b>Limite de Crédito</b></th>
				<th><b>Data de Nascimento</b></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${clientes}">
				<tr>
					<td><c:out value="${c.cpf}"></c:out></td>
					<td><c:out value="${c.nome}"></c:out></td>
					<td><c:out value="${c.email}"></c:out></td>
					<td><c:out value="${c.limiteCred}"></c:out></td>
					<td><c:out value="${c.dataNasc}"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</c:if>
</body>
</html>