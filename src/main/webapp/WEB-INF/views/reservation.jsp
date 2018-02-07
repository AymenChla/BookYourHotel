<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Booking - Pinar Hotel</title><!-- Website's title ( it will be shown in browser's tab ), Change the website's title based on your Hotel information -->
	<meta name="description" content="Pinar is Hotel and Resort HTML template."><!-- Add your Hotel short description -->
	<meta name="keywords" content="Responsive,HTML5,CSS3,XML,JavaScript"><!-- Add some Keywords based on your Hotel and your business and separate them by comma -->
	<meta name="author" content="Joseph a, ravistheme@gmail.com">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, user-scalable=no">
	<link href='https://fonts.googleapis.com/css?family=Lobster%7cRaleway:400,300,100,600,700,800' rel='stylesheet' type='text/css'><!-- Attach Google fonts -->
	<link rel="stylesheet" type="text/css" href="assets/css/styles.css"><!-- Attach the main stylesheet file -->
</head>
<body class="internal-pages trans-header sticky booking-page">
	
	<!-- Main Header -->
	<c:import url="header.jsp"></c:import>
	<!-- End of Main Header -->

	<!-- Internal Page Header -->
	<div class="internal-page-title about-page" data-parallax="scroll" data-image-src="../assets/img/booking-header.jpg">
		<h1>Réservation de <span>Chambre</span></h1>
		<ol class="breadcrumb"><!-- Internal Page Breadcrumb -->
            <li><a href="/">Accueil</a></li>
             <li>${offre.chambre.hotel.nom_hotel}</li>
            <li class="active">Chambre ${offre.chambre.categorie}</li>
        </ol>
	</div>
	<!-- End of Internal Page Header -->

	<!-- Booking Page Container -->
	<div id="booking-page-content">
		<div class="booking-container container">
			
			<div class="heading-box">
				<h2>Réservez <span>Maintenant</span></h2>
			</div>
			<div class="main-booking-description">
				Veuillez remplir les informations du résident pour chaque chambre
			</div>


            <!-- The tabular structure uses the Bootstrap tab structure! -->
            <ul class="nav nav-tabs nav-justified" id="booking-tabs"><!-- Booking Tabs -->
                <li class="active"><!-- Add Active class for the active tab -->
                    <a href="#booking-reservation" >
                    	<span class="number">1</span>
                        <span class="title">Détails résident <b>${ (sessionScope.nb-sessionScope.nbChambre)+1}
                        	<c:choose>
                        		<c:when test="${(sessionScope.nb-sessionScope.nbChambre) == 0}">
                        			<sup>ère</sup> 
                        		</c:when>
                        	
                        	<c:otherwise>
                        			<sup>ème</sup>
                        	</c:otherwise>
                        	</c:choose>
                        chambre</b></span><!-- Tab title -->
                    </a>
                </li>
            </ul>

            <!-- Tab main content container -->
            <div id="booking-tab-contents">
               
                <!-- Tab Contents ( Do Not Change / Remove the ID) -->
                <div class="tab-pane fadeInUp clearfix" id="booking-reservation">

					<div class="reservation-summary col-md-4">
						<h4>Résumer <b>réservation</b></h4>
						<div class="info-boxes">
							<div class="title"><span>Infos <b>Réservation</b></span></div>
							<ul>
								<li>
									<div class="info">Début séjour :</div>
									<div class="value">${sessionScope.date_d}</div>
								</li>
								<li>
									<div class="info">Fin séjour :</div>
									<div class="value">${sessionScope.date_f}</div>
								</li>
								<li>
									<div class="info">Nombre de chambres :</div>
									<div class="value">${sessionScope.nb}</div>
								</li>
							</ul>
							<div class="title"><span>Info <b>Chambre</b></span></div>
							<ul>
								<li>
									<div class="info">Chambre ${offre.chambre.categorie}</div>
									<div class="value">${offre.prix} MAD</div>
								</li>
							</ul>
							<div class="total-cost">
								<div class="info">Coût Total:</div>
								<div class="value">${sessionScope.total} MAD</div>
							</div>
						</div>
					</div>
					<form action="/n_reservation" method="post">
					<div class="reservation-info col-md-8">
						<h4>Infos <b>Résident</b></h4>
						<div class="col-md-6">
							<div class="field-container">
	                            <select id="type_resident" name="type_resident">
	                            	<option value="me">Je suis le client principal</option>
	                            	<option value="other" selected>Je réserve pour un autre client</option>
	                            </select>
	                        </div>
	                        
	                        <div id="resident">
		                        <div class="field-container">
		                            <input type="text" name="prenom" placeholder="Prénom *"><!-- First Name Field -->
		                        </div>
		                        
		                        <div class="field-container">
		                            <input type="text" name="nom" placeholder="Nom *"><!-- Last Name Field -->
		                        </div>
		                        
		                        <div class="field-container">
		                            <input type="text" name="tel" placeholder="Téléphone *"><!-- Phone Field -->
		                        </div>
		                        <div class="field-container">
		                            <input type="text" name="cin" placeholder="CIN"><!-- Address Field -->
		                        </div>
		                        <div class="field-container">
		                        	<input type="date" name="dateNaissance" >
		                        </div>
	                        </div>
						
						</div>
						
						<div class="col-md-6">
							<div class="field-container message-field">
		                        <textarea id="message-field" placeholder="
Besoins spéciaux"></textarea><!-- Special Requirements Field -->
		                    </div>
							<div class="field-container btn-field">
							<c:choose>
								<c:when test="${sessionScope.nbChambre>1}">
									<input type="submit" class="btn btn-default" value="Continuer">
								</c:when>
								<c:otherwise>
									<input type="submit" class="btn btn-default" value="Paiement">
								</c:otherwise>
							</c:choose>
		                    	
		                    </div>
						</div>
						
					</div>
                  </form>
                    <!-- End of Guest Info form -->
                </div>
                
                <!-- Tab Contents ( Do Not Change / Remove the ID) -->
             </div>
             </div>
	</div>
	<!-- End of Booking Page Container -->


	<!-- Top Footer -->
	<c:import url="footer.jsp"></c:import>
	<!-- End of Top Footer -->
	
	<!-- Include the js files  -->
	<script type="text/javascript" src="assets/js/jquery.js"></script>

	<!-- Include bootstrap tab scrip -->
    <script type="text/javascript" src="assets/js/bootstrap/tab.js"></script>
	<script type="text/javascript" src="assets/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="assets/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="assets/js/imagesloaded.pkgd.min.js"></script>
	<script type="text/javascript" src="assets/js/helper.js"></script>
	<script type="text/javascript" src="assets/js/template.js"></script>
	
	
	</script>
	
	<script type="text/javascript">
	
		$("#type_resident").bind("change click",function(event){
			var selectedValue = $("option:selected", "#type_resident" ).val();
			if(selectedValue == "me")
			{
				$("#resident").hide();
			}
			else{
				$('#resident').show();
			}
		});
	</script>
	<!-- End of js files and codes -->
</body>
</html>