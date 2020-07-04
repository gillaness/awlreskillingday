<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crear usuario</title>
</head>
<body>

<h1>Crear usuario</h1>

<c:if test="${cumensaje != null}">
	<c:out value="${cumensaje}" />
</c:if>

<form action="CrearUsuario" method="post">
	Nombre: <input type="text" name="txtnombre" /><br/>
	Apellido: <input type="text" name="txtapellido" /> <br/>
	Telefono: <input type="text" name="txttelefono" /> <br/>
	Correo electrónico: <input type="email" name="txtcorreo" /> <br/>
	<input type="submit" value="Agregar usuario" />
</form>

<a href="${pageContext.request.contextPath}/ListarUsuarios">Volver al listado de usuarios</a>

</body>
</html>