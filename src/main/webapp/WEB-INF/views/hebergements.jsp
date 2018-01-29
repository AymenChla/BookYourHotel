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
	<title>Rooms - List - Pinar Hotel</title><!-- Website's title ( it will be shown in browser's tab ), Change the website's title based on your Hotel information -->
	<meta name="description" content="Pinar is Hotel and Resort HTML template."><!-- Add your Hotel short description -->
	<meta name="keywords" content="Responsive,HTML5,CSS3,XML,JavaScript"><!-- Add some Keywords based on your Hotel and your business and separate them by comma -->
	<meta name="author" content="Joseph a, ravistheme@gmail.com">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, user-scalable=no">
	<link href='https://fonts.googleapis.com/css?family=Lobster%7cRaleway:400,300,100,600,700,800' rel='stylesheet' type='text/css'><!-- Attach Google fonts -->
	<link rel="stylesheet" type="text/css" href="../assets/css/styles.css"><!-- Attach the main stylesheet file -->
</head>
<body class="internal-pages trans-header sticky">
	

	<!-- Main Header -->
	<c:import url="header.jsp"></c:import>
	<!-- End of Main Header -->

	<!-- Internal Page Header -->
	<div class="internal-page-title about-page" data-parallax="scroll" data-image-src="assets/img/internal-header.jpg">
		<h1><span>Hôtel ${offres.get(0).chambre.hotel.nom_hotel}</span> - Chambres</h1>
		<ol class="breadcrumb"><!-- Internal Page Breadcrumb -->
            <li><a href="../index.html">Accueil</a></li>
            <li>Hôtel ${offres.get(0).chambre.hotel.nom_hotel}</li>
            <li class="active">Liste de chambres</li>
        </ol>
	</div>
	<!-- End of Internal Page Header -->
	
	<!-- Rooms Container -->
	<div class="room-container container room-list">
		
		
		<c:forEach items="${ offres}" var="offre">
		<form action="/reservation" method="get">
	
					<!-- Room Boxes -->
					<div class="room-box clearfix">
						<div class="img-container col-xs-6">
							<img src="assets/img/rooms/grid/1.jpg" alt="1">
							<a href="#" class="btn btn-default" onclick="$(this).closest('form').submit()">Réservez</a>
						</div>
						<div class="details col-xs-6">
							<div class="title"><a href="#"><span>Chambre </span> ${offre.chambre.categorie}</a></div>
							<div class="desc">
									${offre.chambre.description}
								<ul class="facilities list-inline">
									<c:if test="${offre.chambre.hotel.restaurant}">
									<li><i class="fa fa-check"></i>Petit déjeuner inclus</li>
									</c:if>
									<c:if test="${offre.chambre.hotel.wifi}">
										<li><i class="fa fa-check"></i>Wifi Gratuit</li>
									</c:if>
									<li><i class="fa fa-check"></i>Taille  : ${offre.chambre.taille} m²</li>
								</ul>
								<label>nombre de chambres</label>
								<div class="field-container col-xs-6 col-md-4">
						                <select name="nbChambre" placeholder="Nombre de chambres ?">
						                   <c:forEach begin="1" end="${ nbChambres.get(offre.chambre.type) }" var="i">
												<option><c:out value="${i}"></c:out></option>
											</c:forEach>
						                </select>
						                
			            		</div>    
			           	
							</div>
							<div class="price">
								<span>${offre.prix}</span>
								- Par Nuit
							</div>
						</div>
					</div>
					<input type="hidden" name="type" value="${offre.chambre.type}">
				<input type="hidden" name="nbChambre" value="${nbChambres.get(offre.chambre.description)}">
				<input type="hidden" name="id_offre"  value="${offre.idPrix}">
			</form>
		</c:forEach>
		
		
	</div>
	<!-- End of Rooms Container -->

	<!-- Pagination -->
	<div class="pagination-box">
        <ul class="list-inline">
            <li class="active"><a href="#"><span>1</span></a></li>
            <li><a href="#"><span>2</span></a></li>
            <li><a href="#"><span>3</span></a></li>
            <li><a href="#"><span>4</span></a></li>
            <li><a href="#"><span>5</span></a></li>
            <li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>
        </ul>
    </div>
	<!-- End of Pagination -->
	
	

	<!-- Top Footer -->
	<div id="top-footer">
		<div id="go-up-box"><i class="fa fa-chevron-up"></i></div>
		<div class="inner-container container">
			<div class="widget col-xs-6 col-md-4">
				<h4>Text Widget</h4>
				<div class="widget-content">
					Text widget can be used for putting text, images and some other elements in the widget areas. As an example you can add your short description about your hotel and add your logo in this area. Also you can add some useful information like notification in this area.
				</div>
			</div>
			<div class="widget col-xs-6 col-md-4">
				<h4>Newsletter</h4>
				<div class="widget-content">
					<div class="desc">
						Some description of how your newsletter works will be located in this section.
					</div>
					<form class="news-letter-form">
						<input type="text" class="email" placeholder="Email">
						<input type="submit" class="btn btn-default" value="Sign up Now">
					</form>
				</div>
			</div>
			<div class="widget col-md-4 get-in-touch">
				<h4>Get in Touch</h4>
				<div class="widget-content">
					<ul>
						<li><i class="fa fa-map-marker "></i>133 Elizabethstreet, Sydney 4000, Australia</li>
						<li><i class="fa fa-phone"></i>0185 26 37 48 59</li>
						<li><i class="fa fa-envelope-o"></i>info@pinar.com</li>
					</ul>
					<ul class="list-inline social-icons">
						<li><a href="#"><i class="fa fa-facebook "></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						<li><a href="#"><i class="fa fa-skype"></i></a></li>
						<li><a href="#"><i class="fa fa-youtube"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End of Top Footer -->

	<!-- Footer -->
	<footer id="footer">
		<nav>
			<ul class="list-inline">
				<li><a href="#">Home</a></li>
				<li><a href="#">About</a></li>
				<li><a href="#">Gallery</a></li>
				<li><a href="#">Events</a></li>
				<li><a href="#">Rooms</a></li>
			</ul>
		</nav>
		<div class="copy-right">
			&copy; 2014 Pinar. All Rights Reserved.
		</div>
	</footer>
	<!-- End of Footer -->

	<!-- Include the js files  -->
	<script type="text/javascript" src="../assets/js/jquery.js"></script>
	<script type="text/javascript" src="../assets/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="../assets/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="../assets/js/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="../assets/js/imagesloaded.pkgd.min.js"></script>
	<script type="text/javascript" src="../assets/js/helper.js"></script>
	<script type="text/javascript" src="../assets/js/template.js"></script>

	<!-- End of js files and codes -->
</body>
</html>