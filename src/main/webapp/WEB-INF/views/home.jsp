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
	<title>Pinar Hotel - Responsive Hotel Template</title><!-- Website's title ( it will be shown in browser's tab ), Change the website's title based on your Hotel information -->
	<meta name="description" content="Pinar is Hotel and Resort HTML template."><!-- Add your Hotel short description -->
	<meta name="keywords" content="Responsive,HTML5,CSS3,XML,JavaScript"><!-- Add some Keywords based on your Hotel and your business and separate them by comma -->
	<meta name="author" content="Joseph a, ravistheme@gmail.com">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, user-scalable=no">
	<link href='https://fonts.googleapis.com/css?family=Lobster%7cRaleway:400,300,100,600,700,800' rel='stylesheet' type='text/css'><!-- Attach Google fonts -->
	<link rel="stylesheet" type="text/css" href="assets/css/styles.css"><!-- Attach the main stylesheet file -->
</head>
<body class="homepage trans-header sticky white-datepicker">
	
	

	<!-- Main Header -->
	<c:import url="header.jsp"></c:import>
	<!-- End of Main Header -->

	<!-- Top Slider and Booking form -->
	<div id="home-top-section">
		
		<!-- Main Slider -->
		<div id="main-slider">
			<div class="items">
	            <a href="http://google.com">
	            	<img src="assets/img/slider/1.jpg" alt="3"/><!-- Change the URL section based on your image\'s name -->
	            </a>
	        </div>
	        <div class="items">
	            <a href="http://google.com">
	            	<img src="assets/img/slider/3.jpg" alt="3"/>
	            </a>
	        </div>
	        <div class="items">
	            <a href="http://google.com">
	            	<img src="assets/img/slider/4.jpg" alt="4"/>
	            </a>
	        </div>
	        <div class="items">
	            <a href="http://google.com">
	            	<img src="assets/img/slider/2.jpg" alt="2"/>
	            </a>
	        </div>
	    </div>

		<!-- Booking Form -->
		<div class="booking-form-container container">
			<div class="booking-form-inner-container">
				<div id="main-booking-form" class="style-2">
					<h2><small>Cherchez une</small><span> Chambre</span></h2>
					<form class="booking-form clearfix" action="rechercheOffres#luxury-rooms" method="post"><!-- Do Not remove the classes -->
						<div class="booking-fields col-xs-6 col-md-12">
							<input type="text" name="dest" placeholder="votre destination ?">
						</div>
						<div class="input-daterange clearfix">
				            <div class="booking-fields col-xs-6 col-md-12">
				                <input placeholder="Date début séjour" class="datepicker-fields check-in" type="text" name="date_debut" /><!-- Date Picker field ( Do Not remove the "datepicker-fields" class ) -->
				                <i class="fa fa-calendar"></i><!-- Date Picker Icon -->
				            </div>
				            <div class="booking-fields col-xs-6 col-md-12">
				                <input placeholder="Date fin séjour" class="datepicker-fields check-out" type="text" name="date_fin" />
				                <i class="fa fa-calendar"></i>
				            </div>
				        </div>
				        <div class="booking-fields col-xs-6 col-md-12">
				        	<input type="text" name="nbChambre" placeholder="nombre de chambres ?">
				        </div>
			            <!-- <div class="booking-fields col-xs-6 col-md-12">
			                <select name="room-type">
			                    <option value="">How Many Adult?</option>
			                    <option value="2">1</option>
			                    <option value="3">2</option>
			                    <option value="4">3</option>
			                    <option value="5">4</option>
			                    <option value="6">5</option>
			                </select>
			                
			            </div>
			            <div class="booking-fields col-xs-6 col-md-12">
			                <select name="guest">
			                    <option value="">How Many Children ?</option>
			                    <option value="1">1</option>
			                    <option value="2">2</option>
			                    <option value="3">3</option>
			                    <option value="4">4</option>
			                    <option value="5">5</option>
			                </select>
			            </div>	-->
			            <div class="booking-button-container">
			                <input class="btn btn-default" value="Voir les disponibilités" type="submit"/><!-- Submit button -->
			            </div>
			        </form>
				</div>
			</div>
		</div>
	</div>
	<!-- End of Top Slider and Booking form -->

	<!-- Luxury Rooms -->
	<div id="luxury-rooms">
		<!-- Heading box -->
		<div class="heading-box">
			<h2><span>Hôtels</span> disponibles</h2><!-- Title -->
			<div class="subtitle">Hôtels avec meilleurs services</div><!-- Subtitle -->
		</div>

		<!-- Room Box Container -->
		<div class="room-container container">
		
			
			<c:forEach items="${ offres}" var="offre" varStatus="status">
				
					<!-- Room box -->
					<c:choose>
						<c:when test="${status.index%2==0}">
							<div class="room-boxes">
						</c:when>
						<c:otherwise>
							<div class="room-boxes right">
						</c:otherwise>
					</c:choose>
					
						<img src="assets/img/rooms/1.jpg" alt="King Suit" class="room-img"><!-- Room Image -->
						<div class="room-details col-xs-6 col-md-4">
							<div class="title">Hôtel ${offre.chambre.hotel.nom_hotel}</div><!-- Room title -->
							<div class="description"><!-- Room Description -->
								${offre.chambre.hotel.description_hotel}
							</div>
							<form action="/hebergements" method="POST">
								<input type="hidden" name="id_hotel" value="<c:out value="${ offre.chambre.hotel.idHotel}"></c:out>">
								<input class="btn btn-default" type="submit" value="voir hébergements">
							</form>
						</div>
						<div class="price-container col-xs-6 col-md-8">
							<div class="price">
								<span>${offre.prix} MAD</span>
								- Par Nuit
							</div>
						</div>
		
					</div>
		
			</c:forEach>
			
			
			
		
	</div>
	<!-- End of Luxury Rooms -->

	

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
	<script type="text/javascript" src="assets/js/jquery.js"></script>
	<script type="text/javascript" src="assets/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="assets/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="assets/js/imagesloaded.pkgd.min.js"></script>
	<script type="text/javascript" src="assets/js/helper.js"></script>
	<script type="text/javascript" src="assets/js/template.js"></script>
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
