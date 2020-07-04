<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:if test="${lmensaje != null}">
	<h3></h3>
</c:if>
	<h1>Bienvenido al sitio</h1>
	<form method="post" action="ValidarUsuario">
	Nombre: <input type="text" name="txtlogin" /><br/>
	Clave: <input type="password" name="txtclave" /><br/>
	<input type="submit" value="Ingresar" />
	</form>
	
</body>
</html>