<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	${status}
	<form action="/createClient" method="post">
		nom <input type="text" name="nom"><br>
		prenom <input type="text" name="prenom"><br>
		cin <input type="text" name="prenom"><br>
		date naissance <input type="date" name="dateNaissance"><br>
		username <input type="text" name="userName"><br>
		email <input type="email" name="email"><br>
		password <input type="password" name="password"><br>
		select 	<select name="sexe">
					<option value="homme">Homme</option>
					<option value="femme">Femme</option>
				</select>
				
		tel <input type="text" name="tel"><br>
		Adresse <input type="text" name="adresse"><br>	 
    	num carte bancaire <input type="text" name="numCarteBancaire"><br>
    	<input type="submit" value="creer compte">
    	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
	</form>
</body>
</html>