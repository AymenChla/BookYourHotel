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
	<c:forEach items="${ offres}" var="offre">
		<c:out value="${ offre.prix}"></c:out> : 
		<c:out value="${ offre.chambre.description}"></c:out>
		<c:out value="${ offre.chambre.hotel.nom_hotel }"></c:out>
		<form action="/reservation" method="git">
			<select name="nbChambres">
				<c:forEach begin="1" end="${ nbChambres.get(offre.chambre.description) }" var="i">
					<option><c:out value="${i}"></c:out></option>
				</c:forEach>
			</select>
			
			<input type="hidden" name="categorie" value="${offre.chambre.description}">
			<input type="hidden" name="nbChambre" value="${nbChambres.get(offre.chambre.description)}">
			<input type="hidden" name="id_offre"  value="${offre.idPrix}">
			 
			<input type="submit" value="reserver">
			<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		</form>
		
		<br>
	</c:forEach>
</body>
</html>