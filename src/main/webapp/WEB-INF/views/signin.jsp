<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Coming Soon - Pinar Hotel</title><!-- Website's title ( it will be shown in browser's tab ), Change the website's title based on your Hotel information -->
	<meta name="description" content="Pinar is Hotel and Resort HTML template."><!-- Add your Hotel short description -->
	<meta name="keywords" content="Responsive,HTML5,CSS3,XML,JavaScript"><!-- Add some Keywords based on your Hotel and your business and separate them by comma -->
	<meta name="author" content="Joseph a, ravistheme@gmail.com">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, user-scalable=no">
	<link href='https://fonts.googleapis.com/css?family=Lobster%7cRaleway:400,300,100,600,700,800' rel='stylesheet' type='text/css'><!-- Attach Google fonts -->
	<link rel="stylesheet" type="text/css" href="assets/css/styles.css"><!-- Attach the main stylesheet file -->
	<link rel="stylesheet" type="text/css" href="/bootstrap/dist/css/bootstrap.min.css">
</head>
<body class="internal-pages coming-soon">
	<div class="coming-soon-inner-box ">
		<h1>Book Hotel</h1>
			<h1 class="desc">Se connectez</h1>
			<div class="col-md-2"></div>

			<div class="search-box">
				<form class="col-md-8 search-form" role="form" action="/login" method="POST">
					<c:if test="${param.error ne null}">
							<div class="text-danger">Login ou mots de passe incorrect.</div>
						</c:if>
						<c:if test="${param.logout ne null}">
							<div class="text-info">Vous vous êtes déconnectez.</div>
						</c:if>
					<fieldset>
						<div class="form-group">
							<input class="form-control" placeholder="Username *" name="username" type="text" autofocus="" required>
						</div>
						<div class="form-group">
							<input class="form-control" placeholder="Password *" name="password" type="password" required="">
						</div>
						<div class=" pull-left">
							<table>
								<tr>
									<td><input id="check" name="remember" type="checkbox" value="Remember Me"> </td>
									<td><label for="check"> Se souvenir de moi</label></td>
								</tr>
							</table>
						</div>
						<input type="submit" class="btn btn-primary col-md-12" value="Se connectez">
						
					</fieldset>
					
					<br><br><br>
					<a class="text-warning" href="/signup"><h3>Vous n'avez pas un compte ?</h3></a>
				</form>


			</div>


	</div>

<!-- Include the js files  -->
</body>

</html>