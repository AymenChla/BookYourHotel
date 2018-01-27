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
	<form action="/createGerant" method="POST">
		email <input type="text" name="email"/><br/>
		password <input type="password" name="password" required/><br/>
		nom <input type="text" name="nom" required/><br/>
		prenom <input type="text" name="prenom" required/><br/>
		dateNaissance <input type="date" name="dateNaissance" required/><br/>
		sexe <input type="text" name="sexe" required/><br/>
		tel <input type="text" name="tel" required/><br/>
		adresse <textarea type="text" name="adresse" required></textarea><br/>
		<!-- confirm password <input type="password" name="confirm_mdp" required/> -->
		<input type="submit" /><br/>
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
	</form>
</body>
</html>