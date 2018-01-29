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
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/paiement.css"><!-- Attach the main stylesheet 
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
             <li>Hôtel ${offre.chambre.hotel.nom_hotel}</li>
             <li>Chambre ${offre.chambre.categorie}</li>
             <li class="active">Paiement</li>
        </ol>
	</div>
	<!-- End of Internal Page Header -->

	<!-- Booking Page Container -->
	<div id="booking-page-content">
		<div class="booking-container container">
			
			<div class="heading-box">
				<h2>Confirmer <span>la réservation</span></h2>
			</div>


            <!-- The tabular structure uses the Bootstrap tab structure! -->
            <ul class="nav nav-tabs nav-justified" id="booking-tabs"><!-- Booking Tabs -->
                <li class="active">
                    <a href="#booking-confirmation" >
                        <span class="number">2</span><!-- Tab number -->
                        <span class="title">Paiement</span><!-- Tab title -->
                    </a>
                </li>
            </ul>

           <!-- Tab main content container -->
            <div id="booking-confirmation">
               
               
                
                <!-- Tab Contents ( Do Not Change / Remove the ID) -->
                <div class="tab-pane fadeInUp clearfix" id="booking-confirmation">
                   <br><br>
					
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
					<div class="reservation-info col-md-4">
						<h4>Infos <b>Résident</b></h4>
						<div class="">
							<ul>
								<li>
									<div class="info">Prénom :</div>
									<div class="value">${ client.prenom }</div>
								</li>
								<li>
									<div class="info">Nom :</div>
									<div class="value">${ client.nom }e</div>
								</li>
								<li>
									<div class="info">Email :</div>
									<div class="value">${ client.email }</div>
								</li>
								<li>
									<div class="info">Téléphone :</div>
									<div class="value">${ client.tel }</div>
								</li>
								<li>
									<div class="info">Adresse :</div>
									<div class="value">${ client.adresse }</div>
								</li>
							</ul>
						</div>
						
						
					
					</div>
					<div class="reservation-info col-md-4">
				
												
												<!-- You can make it whatever width you want. I'm making it full width
												            on <= small devices and 4/12 page width on >= medium devices -->
												       <div class="col-xs-12">
												       
												       
												           <!-- CREDIT CARD FORM STARTS HERE -->
												           <div class="panel panel-default credit-card-box">
												               <div class="panel-heading display-table" >
												                   <div class="row display-tr" >
												                       <h5 class="panel-title display-td" >Détails paiement</h5>
												                       <div class="display-td" >                            
												                           <img class="img-responsive pull-right" src="http://i76.imgup.net/accepted_c22e0.png">
												                       </div>
												                   </div>                    
												               </div>
												               <div class="panel-body">
												                   <form role="form" id="payment-form" method="POST" action="/reglerpaiement">
												                       <div class="row">
												                           <div class="col-xs-12">
												                               <div class="form-group">
												                                   <label for="cardNumber">Numéro Carte</label>
												                                   <div class="input-group">
												                                       <input 
												                                           type="tel"
												                                           class="form-control"
												                                           name="cardNumber"
												                                           placeholder="Valid Card Number"
												                                           autocomplete="cc-number"
												                                           required autofocus 
												                                       />
												                                       <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
												                                   </div>
												                               </div>                            
												                           </div>
												                       </div>
												                       <div class="row">
												                           <div class="col-xs-7 col-md-7">
												                               <div class="form-group">
												                                   <label for="cardExpiry"><span class="hidden-xs">EXPIRATION</span><span class="visible-xs-inline">EXP</span> DATE</label>
												                                   <input 
												                                       type="tel" 
												                                       class="form-control" 
												                                       name="cardExpiry"
												                                       placeholder="MM / YY"
												                                       autocomplete="cc-exp"
												                                       required 
												                                   />
												                               </div>
												                           </div>
												                           <div class="col-xs-5 col-md-5 pull-right">
												                               <div class="form-group">
												                                   <label for="cardCVC">CV CODE</label>
												                                   <input 
												                                       type="tel" 
												                                       class="form-control"
												                                       name="cardCVC"
												                                       placeholder="CVC"
												                                       autocomplete="cc-csc"
												                                       required
												                                   />
												                               </div>
												                           </div>
												                       </div>
												                       <div class="row">
												                           <div class="col-xs-12">
												                               <button type="submit" class="btn btn-success btn-lg btn-block" type="button">Validation paiement</button>
												                           </div>
												                       </div>
												                       <div class="row" style="display:none;">
												                           <div class="col-xs-12">
												                               <p class="payment-errors"></p>
												                           </div>
												                       </div>
												                   </form>
												               </div>
												           </div>            
												           <!-- CREDIT CARD FORM ENDS HERE -->
												           
												           
												       </div> 
						
												
												     <c:if test="${paiement eq false}">
												
														<div class="field-container">
															<a class="btn btn-default" href="/mesreservations">Payer plus tard</a>
														</div>
													</c:if>
												
											
						                  
					
					</div>
				</div>



                </div>
            </div>
           
	</div>
	<!-- End of Booking Page Container -->


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

	<!-- Include bootstrap tab scrip -->
    <script type="text/javascript" src="assets/js/bootstrap/tab.js"></script>
	<script type="text/javascript" src="assets/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="assets/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="assets/js/imagesloaded.pkgd.min.js"></script>
	<script type="text/javascript" src="assets/js/helper.js"></script>
	<script type="text/javascript" src="assets/js/template.js"></script>
	
	<!-- Vendor libraries -->

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.payment/1.2.3/jquery.payment.min.js"></script>
<script type="text/javascript" src="assets/js/paiement.js"></script>
	
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