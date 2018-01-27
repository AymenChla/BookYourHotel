<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Hotel</title>
</head>
<body>
	${status }
	<form action="/updateHotel" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="idHotel" value="${ hotel.idHotel }" />
		nom <input type="text" name="nom_hotel" value="${ hotel.nom_hotel }" required/><br/>
		nb etoiles <input type="text" name="nbEtoiles" value="${ hotel.nbEtoiles }" required/><br/>
		numCarteBancaire <input type="text" name="numCarteBancaire" value="${ hotel.numCarteBancaire }" required/><br/>
		adresse <textarea type="text" name="adresse_hotel" required>${ hotel.adresse_hotel }</textarea><br/>
		Description <textarea type="text" name="description" required>${ hotel.description }</textarea><br/>
		Taille du picscine <input type="text" name="piscine" value="${ hotel.piscine }" required/><br/>
		<input type="checkbox" id="r" name="restaurant" /> Restauration<br/>
		<input type="checkbox" id="p" name="parking" /> Parking<br/>
		<input type="checkbox" id="w" name="wifi" /> Wi-fi<br/>
		<input type="file" name="photo" /><br/>
		
		<input type="submit" />
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
	</form>
	<script type="text/javascript">
	if (${hotel.parking} === true){ 
		document.getElementById('p').checked = true;
	} else { 
		document.getElementById('p').checked = false; 
	}
	if (${hotel.restaurant} === true){ 
		document.getElementById('r').checked = true;
	} else { 
		document.getElementById('r').checked = false; 
	}
	if (${hotel.wifi} === true){ 
		document.getElementById('w').checked = true;
	} else { 
		document.getElementById('w').checked = false; 
	}
	</script>
</body>
</html>