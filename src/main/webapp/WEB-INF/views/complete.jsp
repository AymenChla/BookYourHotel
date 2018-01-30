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
		<h1><span>Confirmation</span> - Réservation</h1>
		<ol class="breadcrumb"><!-- Internal Page Breadcrumb -->
            <li><a href="../index.html">Accueil</a></li>
            <li>Hôtel ${offre.chambre.hotel.nom_hotel}</li>
            <li class="active">Confirmation</li>
        </ol>
	</div>
	<!-- End of Internal Page Header -->

	<!-- Booking Page Container -->
	<div id="booking-page-content">
		<div class="booking-container container">
			<br>

           <!-- Tab main content container -->
            <div id="booking-confirmation">
               
               
                
                <!-- Tab Contents ( Do Not Change / Remove the ID) -->
                <div class="tab-pane fadeInUp clearfix" id="booking-confirmation">
                    <h3>Réservation Confirmée!</h3>
                    <div class="description">
                    	Merci pour la réservation.
                    </div>
					
					<div class="col-md-5"></div>
					<div class="field-container">
						<a class="col-md-2 btn btn-default" href="/mesreservations">Mes réservations</a>
					</div>
					<br><br><br><br>		
					
					
					</div>
				</div>



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