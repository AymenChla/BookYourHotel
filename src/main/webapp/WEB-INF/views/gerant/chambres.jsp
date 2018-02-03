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

    <h2>Chambres</h2>
    
	<c:if test="${not empty chambres}">
	
	    <form action="/deleteChambres" method="POST">
		    <table border="2">
		    	<tr>
		    		<th>Numéro</th>
		    		<th>Type</th>
		    		<th>Taille</th>
		    		<th>Description</th>
		    		<th>Climatisé</th>
		    		<th>Supprimer</th>
		    	</tr>
		    	<c:forEach items="${chambres}" var="chambre">
			    	<tr>
						<td><a href="/updateChambre?id=${chambre.idChambre}">${chambre.numero}</a></td>
				    	<td>
				    		<c:choose>
				    			<c:when test="${ chambre.type==1 }">Simple</c:when>
				    			<c:when test="${ chambre.type==2 }">Double</c:when>
				    			<c:when test="${ chambre.type==3 }">Triple</c:when>
				    			<c:when test="${ chambre.type==4 }">Familiale</c:when>
				    		</c:choose>
				    	</td>
				   		<td>${chambre.taille}</td>
				   		<td>${chambre.description}</td>
				   		<td>
				   			<c:choose>
				   				<c:when test="${ chambre.climatisation==true }">Oui</c:when>
				   				<c:otherwise>Non</c:otherwise>
				   			</c:choose>
				   		</td>
				   		<td><input type="checkbox" name="chambres" value="${chambre.idChambre}" />Delete</a></td>
			    	</tr>
				</c:forEach>
				
		    </table>
		    <input type="submit" value="Supprimer">
			<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		</form>

	</c:if>

</body>
</html>