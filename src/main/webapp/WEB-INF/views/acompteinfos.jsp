<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="/compteinfos" method="post">
		<input type="text" name="userName" value="${client.userName}"><br>
		<input type "text" name="email" value="${client.email }"><br>
		<input type "text" name="tel" value="${client.tel }"><br>
		<input type "text" name="nom" value="${client.nom }"><br>
		<input type "text" name="prenom" value="${client.prenom }"><br>
		<input type "text" name="cin" value="${client.cin }"><br>
		<select name="sexe">
			<c:choose>
				<c:when test='${client.sexe eq "homme"}'>
					<option value="homme" selected>homme</option>
					<option value="femme" >femme</option>
				</c:when>
				<c:otherwise>
					<option value="homme" >homme</option>
					<option value="femme" selected>femme</option>
				</c:otherwise>
			</c:choose>
		</select><br>
		<input type="date" name="dateNaissance" value="${dateNaissance}"><br>
		<input type="submit" value="modifier">
		<a href="/comptepass">changer mot de passe</a>
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
	</form>
</body>
</html>