<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	${status }
	<form action="/createhotel" method="POST">
		nom <input type="text" name="nom_hotel" required/>
		nb etoiles <input type="text" name="nbEtoiles" required/>
		numCarteBancaire <input type="text" name="numCarteBancaire" required/><br/>
		
		email <input type="text" name="email"/>
		password <input type="password" name="password" required/>
		nom <input type="text" name="nom" required/>
		prenom <input type="text" name="prenom" required/>
		<!-- dateNaissance <input type="date" name="dateNaissance" required/> -->
		sexe <input type="text" name="sexe" required/>
		tel <input type="text" name="tel" required/>
		adresse <textarea type="text" name="adresse" required></textarea>
		<!-- confirm password <input type="password" name="confirm_mdp" required/> -->
		<input type="submit" />
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
	</form>
</body>
</html>