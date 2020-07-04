<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Listado de Usuarios</title>
</head>
<body>

<h1>Listado de Usuarios</h1>

<c:if test="${cumensaje != null}">
	<c:out value="${cumensaje}" />
</c:if>

<table>
	<tr>
		<th>ID</th>
		<th>Nombre</th>
		<th>Apellido</th>
		<th>Correo electrónico</th>
		<th>Teléfono</th>
		<th>Acciones</th>
	</tr>

<c:forEach items="${listadousuarios}" var="user">
	<tr>
		<td>${user.getId()} </td>
		<td>${user.getNombre()}</td>
		<td>${user.getApellido()}</td>
		<td>${user.getCorreo()}</td>
		<td>${user.getTelefono()}</td>
		<td>
			<a href="${pageContext.request.contextPath}/EliminarUsuario?id=${user.getId()}">Eliminar</a>
			&nbsp;
			<a href="${pageContext.request.contextPath}/EditarUsuario?id=${user.getId()}">Editar</a>
		</td>
	</tr>
</c:forEach>	
	
</table>

<a href="${pageContext.request.contextPath}/CrearUsuario">Creación de usuarios</a>


</body>
</html>