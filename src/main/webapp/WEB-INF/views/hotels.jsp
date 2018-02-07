<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to Spring Web MVC project</title>
</head>

<body>

    <h1>Hotels</h1>
    
	<c:if test="${not empty hotels}">
	
	    <form action="/deleteHotels" method="POST">
		    <table border="2">
		    	<tr>
		    		<th>Nom</th>
		    		<th>Nb etoiles</th>
		    		<th>Adresse</th>
		    		<th>Supprimer</th>
		    	</tr>
		    	<c:forEach items="${hotels}" var="hotel">
			    	<tr>
						<td>${hotel.nom_hotel}</td>
				    	<td>${hotel.nbEtoiles}</td>
				   		<td>${hotel.description_hotel}</td>
				   		<td><input type="checkbox" name="hotels" value="${hotel.idHotel}" />Delete</a></td>
			    	</tr>
				</c:forEach>
				
		    </table>
		    <input type="submit" value="Supprimer">
			<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		</form>

	</c:if>

</body>
</html>