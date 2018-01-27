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

	rechercher offres
	<form action="rechercheOffres" method="post">
		destination <input type="text" name="dest"><br>
		date debut <input type="date" name="date_debut"><br>
		date fin <input type="date" name="date_fin"><br>
		nb chambre <input type="number" name="nbChambre"><br>
		<input type="submit" value="search">
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
	</form>
</body>
</html>