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
	<title>Mes réservations - Pinar Hotel</title><!-- Website's title ( it will be shown in browser's tab ), Change the website's title based on your Hotel information -->
	<meta name="description" content="Pinar is Hotel and Resort HTML template."><!-- Add your Hotel short description -->
	<meta name="keywords" content="Responsive,HTML5,CSS3,XML,JavaScript"><!-- Add some Keywords based on your Hotel and your business and separate them by comma -->
	<meta name="author" content="Joseph a, ravistheme@gmail.com">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, user-scalable=no">
	<link href='https://fonts.googleapis.com/css?family=Lobster%7cRaleway:400,300,100,600,700,800' rel='stylesheet' type='text/css'><!-- Attach Google fonts -->
	<link rel="stylesheet" type="text/css" href="../assets/css/styles.css"><!-- Attach the main stylesheet file -->
</head>
<body class="internal-pages trans-header sticky special-packages">
	
	

	<!-- Main Header -->
	<c:import url="header.jsp"></c:import>
	<!-- End of Main Header -->

	<!-- Internal Page Header -->
	<div class="internal-page-title about-page" data-parallax="scroll" data-image-src="../assets/img/packages/header.jpg">
		<h1>Mes <span>Réservations</span></h1>
		<ol class="breadcrumb"><!-- Internal Page Breadcrumb -->
            <li><a href="/l">Home</a></li>
            <li class="active">Mes réservations</li>
        </ol>
	</div>
	<!-- End of Internal Page Header -->

	<!-- Welcome -->
	<div id="welcome" class="container">
		<!-- Heading box -->
		<div class="heading-box">
			<h2>Mes <span>Réservations</span></h2><!-- Title -->
			<div class="subtitle">Gérez vos réservations</div><!-- Subtitle -->
		</div>
	
	</div>
	<!-- End of Welcome -->
	
	<!-- Special Packages -->
	<div id="special-packages-type-2" class="container">

		<!-- Room Box Container -->
		<div class="package-container">

		<c:forEach items="${ reservations}" var="reservation" varStatus="status">
				
					<!-- Room box -->
					<c:choose>
						<c:when test="${status.index%2==0}">
								<!-- package box -->
							<div class="package-boxes wow fade fadeInUp">
						</c:when>
						<c:otherwise>
								<!-- package box -->
							<div class="package-boxes wow fade fadeInUp right">
						</c:otherwise>
					</c:choose>

			
					<img src="../assets/img/packages/1.jpg" alt="King Suit" class="package-img"><!-- package Image -->
					<div class="package-details col-md-6 col-lg-4">
						<div class="title">Hôtel ${reservation.chambre.hotel.nom_hotel}</div><!-- package title -->
						<h4 class="title"><small>Chambre ${reservation.chambre.categorie}</small></h4>
						<div class="description"><!-- package Description -->

							<ul class="list-inline">
								<c:if test="${reservation.chambre.hotel.restaurant}">
									<li>Petit déjeuner inclus</li>
									</c:if>
								<c:if test="${reservation.chambre.hotel.wifi}">
										<li>Wifi Gratuit</li>
								</c:if>
								<li>Taille  : ${reservation.chambre.taille} m<sup>²</sup></li>
							</ul>
						</div>
						<div class="button-price clearfix">
							<c:choose>
								<c:when test="${reservation.payer eq false}">
									<a class="btn btn-default" href="/paiement?id=${reservation.idReservation }">régler paiement</a>
								</c:when>
							</c:choose>
							<a class="btn btn-default" href="/annulation?id_reservation=${ reservation.idReservation}">Annuler réservation</a><br>
							<div class="price"><span>${reservation.prix_reservation} MAD</span>par nuit</div>
						</div>
					</div>
				</div>
		</c:forEach>

		
		</div>
	</div>
	<!-- End of Special Packages -->




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
	<script type="text/javascript">
	jQuery(document).ready(function($) {
		"use strict";
		// Init the Wow plugin
    	new WOW({mobile: false}).init();
	});
	</script>
	<!-- End of js files and codes -->
</body>
</html>