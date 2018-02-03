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
	<form action="/chambres" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="idChambre" value="${ chambre.idChambre }" />
		<input type="hidden" name="photo" value="${ chambre.photo }" />
		Numéro <input type="text" name="numero" value="${ chambre.numero }" /><br/>
		Taille <input type="text" name="taille" value="${ chambre.taille }" readonly="readonly" /><br/>
		Type <input type="text" name="type" value="${ chambre.type }" readonly="readonly" /><br/>
		Description <textarea type="text" name="description" required>${ chambre.description }</textarea><br/>
		<input type="checkbox" id="c" name="climatisation" /> Climatisée<br/>
		<br/>
		<input type="file" name="newphoto" /><br/>
		
		<input type="submit" />
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
	</form>
	<script type="text/javascript">
	if (${chambre.climatisation} === true){ 
		document.getElementById('c').checked = true;
	} else { 
		document.getElementById('c').checked = false; 
	}
	</script>
</body>
</html>