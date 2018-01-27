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

	<c:out value="${offre.chambre.hotel.nom_hotel}"></c:out> :
	<c:out value="${offre.chambre.description}"></c:out> :
	<c:out value="${offre.prix}"></c:out>
	<br>
	<form action="/n_reservation" method="post">
		<input type="radio" name="type_resident" value="me"> me <br>
		<input type="radio" name="type_resident" value="other"> other <br>
		nom resident<input type="text" name="nom"><br>
		prenom resident<input type="text" name="prenom"><br>
		cin resident<input type="text" name="cin"><br>
		tel resident<input type="text" name="tel"><br>
		
		<c:choose>
			<c:when test="${sessionScope.nbChambre>1}">
				<input type="submit" value="next reservation">
			</c:when>
			<c:otherwise>
				<input type="submit" value="terminer">
			</c:otherwise>
		</c:choose>
		
			
			
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		
	</form>
</body>
</html>