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
	<c:forEach items="${ reservations}" var="reservation">
		<c:out value="${ reservation.prix_reservation}"></c:out><br> 
		<c:out value="${ reservation.dateDebutSejour}"></c:out><br>
		<c:out value="${ reservation.dateFinSejour}"></c:out><br>
		<c:out value="${ reservation.chambre.hotel.nom_hotel }"></c:out><br>
		<c:choose>
			<c:when test="${reservation.payer eq false}">
				<a href="/reglerpaiement">regler paiement</a><br>
			</c:when>
		</c:choose>
		<a href="/annulerreservation">Annuler reservation</a><br>
		<br>
		<hr>
	</c:forEach>
</body>
</html>