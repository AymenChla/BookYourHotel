<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gestion chambres</title>
</head>
<body>
	${status }
	<form action="addChambres" method="POST" enctype="multipart/form-data">
		<select name="type">
			<option value="1" >Simple</option>
			<option value="2" >Double</option>
			<option value="3" >Triple</option>
			<option value="4" >Familiale</option>
		</select><br/>
		<input type="checkbox" id="simple" name="climatisation" />Climatisée<br/>
		Taille <input type="text" name="taille" /><br/>
		Description <textarea type="text" name="description" required></textarea><br/>
		Nombre de chambres <input type="text" name="nombre" /><br/>
		<br/>
		
		<input type="submit" />
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
	</form>
	
</body>
</html>