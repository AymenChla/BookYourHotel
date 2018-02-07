<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<link rel="stylesheet" type="text/css" href="assets/css/styles.css"><!-- Attach the main stylesheet file -->
	<link rel="stylesheet" type="text/css" href="assets/css/rating.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/dist/css/bootstrap.min.css">
</head>
<body class="internal-pages sticky room-details trans-header">
	
	

	<!-- Main Header -->
	<c:import url="header.jsp"></c:import>
	<!-- End of Main Header -->

	<div class="room-detail-page">

		<!-- Internal Page Header -->
	<div class="internal-page-title about-page" data-parallax="scroll" data-image-src="${ offres.get(0).chambre.hotel.image}">
		<h1><span>${offres.get(0).chambre.hotel.nom_hotel}</span> - Chambres</h1>
		<ol class="breadcrumb"><!-- Internal Page Breadcrumb -->
            <li><a href="../index.html">Accueil</a></li>
            <li>${offres.get(0).chambre.hotel.nom_hotel}</li>
            <li class="active">
            	<c:forEach begin='1' end="${offres.get(0).chambre.hotel.nbEtoiles}">
            		<i class="fa fa-star"></i>
            	</c:forEach>
            </li>
        </ol>
	</div>
	<!-- End of Internal Page Header -->

	    <div class="room-details container">
	    
	   	
			<div class="row" style="margin-top:50px">
				<div class="text-left col-md-6"  >
			    	${fn:substring(offres.get(0).chambre.hotel.description_hotel,0,1180)}
				</div>
				<div class="col-sm-3 col-md-3">
					<div class="rating-block">
						<h4>Moyenne rating</h4>
						<h2 class="bold padding-bottom-7">${offres.get(0).chambre.hotel.avgRating} <small>/ 5</small></h2>
						
						<c:forEach begin="1" end="${ offres.get(0).chambre.hotel.avgRating }" var="i">
									<a  href="/rating?s=${i}" type="button" class="btn btn-warning btn-sm" aria-label="Left Align">
									  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									</a>
						</c:forEach>
						<c:forEach begin="${offres.get(0).chambre.hotel.avgRating+1}" end="${ 5 }" var="i">
									<a  href="/rating?s=${i}" type="button" class="btn btn-default btn-sm" aria-label="Left Align">
									  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									</a>
						</c:forEach>
						
				
						
					</div>
	
				</div>
				<div class="col-md-3">
						<div class="pull-left">
						<div class="pull-left" style="width:35px; line-height:1;">
							<div style="height:9px; margin:5px 0;">5 <span class="glyphicon glyphicon-star"></span></div>
						</div>
						<div class="pull-left" style="width:180px;">
							<div class="progress" style="height:9px; margin:8px 0;">
							 <c:if test="${ offres.get(0).chambre.hotel.nbVote == 0 }">
							 	<c:set var="nbVote">1</c:set>
							 </c:if>
							 <c:if test="${ offres.get(0).chambre.hotel.nbVote != 0 }">
							 	<c:set var="nbVote">${ offres.get(0).chambre.hotel.nbVote}</c:set>
							 </c:if>
							  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="5" style="width: ${ (nbPerStar[4]/nbVote)*100 }%">
								<span class="sr-only">80% Complete (danger)</span>
							  </div>
							</div>
						</div>
						<div class="pull-right" style="margin-left:10px;">${nbPerStar[4]}</div>
					</div>
					<div class="pull-left">
						<div class="pull-left" style="width:35px; line-height:1;">
							<div style="height:9px; margin:5px 0;">4 <span class="glyphicon glyphicon-star"></span></div>
						</div>
						<div class="pull-left" style="width:180px;">
							<div class="progress" style="height:9px; margin:8px 0;">
							  <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="4" aria-valuemin="0" aria-valuemax="5" style="width: ${ (nbPerStar[3]/nbVote)*100 }%">
								<span class="sr-only">80% Complete (danger)</span>
							  </div>
							</div>
						</div>
						<div class="pull-right" style="margin-left:10px;">${nbPerStar[3]}</div>
					</div>
					<div class="pull-left">
						<div class="pull-left" style="width:35px; line-height:1;">
							<div style="height:9px; margin:5px 0;">3 <span class="glyphicon glyphicon-star"></span></div>
						</div>
						<div class="pull-left" style="width:180px;">
							<div class="progress" style="height:9px; margin:8px 0;">
							  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="3" aria-valuemin="0" aria-valuemax="5" style="width: ${ (nbPerStar[2]/nbVote)*100 }%">
								<span class="sr-only">80% Complete (danger)</span>
							  </div>
							</div>
						</div>
						<div class="pull-right" style="margin-left:10px;">${nbPerStar[2]}</div>
					</div>
					<div class="pull-left">
						<div class="pull-left" style="width:35px; line-height:1;">
							<div style="height:9px; margin:5px 0;">2 <span class="glyphicon glyphicon-star"></span></div>
						</div>
						<div class="pull-left" style="width:180px;">
							<div class="progress" style="height:9px; margin:8px 0;">
							  <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="5" style="width: ${ (nbPerStar[1]/nbVote)*100 }%">
								<span class="sr-only">80% Complete (danger)</span>
							  </div>
							</div>
						</div>
						<div class="pull-right" style="margin-left:10px;">${nbPerStar[1]}</div>
					</div>
					<div class="pull-left">
						<div class="pull-left" style="width:35px; line-height:1;">
							<div style="height:9px; margin:5px 0;">1 <span class="glyphicon glyphicon-star"></span></div>
						</div>
						<div class="pull-left" style="width:180px;">
							<div class="progress" style="height:9px; margin:8px 0;">
							  <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="1" aria-valuemin="0" aria-valuemax="5" style="width: ${ (nbPerStar[0]/nbVote)*100 }%">
								<span class="sr-only">80% Complete (danger)</span>
							  </div>
							</div>
						</div>
						<div class="pull-right" style="margin-left:10px;">${nbPerStar[0]}</div>
					</div>
				</div>
				
				<div class="col-md-6">
					<ul class="services list-inline">
			    		<c:if test="${offres.get(0).chambre.hotel.annulation==0}">
			    			<li style="font-weight:bold" class="text-success"><i class="fa fa-check" ></i>Annulation gratuite</li>	
			    		</c:if>
			    		<c:if test="${offres.get(0).chambre.hotel.paiement eq false}">
			    			<li style="font-weight:bold" class="text-success"><i class="fa fa-check"></i>Paiement non pré-requis</li>	
			    		</c:if>
						<c:if test="${offres.get(0).chambre.hotel.parking}">
			    			<li><i class="fa fa-check"></i>Parking</li>	
			    		</c:if>
			    		<c:if test="${offres.get(0).chambre.hotel.piscine!=0}">
			    			<li><i class="fa fa-check"></i>Piscine ${offres.get(0).chambre.hotel.piscine} m<sup>2</sup></li>	
			    		</c:if>
						<c:if test="${offres.get(0).chambre.hotel.wifi eq true}">
			    			<li><i class="fa fa-check"></i>Free Wifi</li>	
			    		</c:if>
						
					</ul>
					<ul class="services list-inline">
						<li><i class="fa fa-lg fa-map-marker"></i>${offres.get(0).chambre.hotel.adresse_hotel}</li>
					</ul>
				</div>
		    	
			</div>
	    </div>
	    
	</div>	
	
	<!-- Rooms Container -->
	<div class="room-container container room-list">
		
		<div style="height: 60px;"></div>
		<c:forEach items="${ offres}" var="offre">
		<form action="/reservation" method="get">
	
					<!-- Room Boxes -->
					<div class="room-box clearfix"   >
						<div class="img-container col-xs-6" style="height:320px">
							<img src="${offre.chambre.photo}" alt="1">
							<a href="#" class="btn btn-default" onclick="$(this).closest('form').submit()">Réservez</a>
						</div>
						<div class="details col-xs-6" style="height:320px">
							<div class="title"><a href="#"><span>Chambre </span> ${offre.chambre.categorie}</a></div>
							<div class="desc">
									${fn:substring(offre.chambre.description,0,270)}
								<ul class="facilities list-inline">
									<c:if test="${offre.chambre.hotel.restaurant}">
									<li><i class="fa fa-check"></i>Petit déjeuner inclus</li>
									</c:if>
									<c:if test="${offre.chambre.hotel.wifi}">
										<li><i class="fa fa-check"></i>Wifi Gratuit</li>
									</c:if>
									<li><i class="fa fa-check"></i>Taille  : ${offre.chambre.taille} m²</li>
								</ul>
								<label for="nbChambre">nombre de chambres</label>
								<div class="field-container col-xs-6 col-md-4">
						                <select id="nbChambre" name="nbChambre" placeholder="Nombre de chambres ?">
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


	<!-- Post Container -->
				<div class="post-container">
					<!-- Post boxes -->
					<div class="post-box">
						
						
						
						
						<!-- Comment Box -->
						<div class="comments-container">
							<h3>${commentaires.size()} <b>Commentaires</b></h3>
							
							<c:forEach items="${commentaires }" var="comment">
							<!-- Comment Boxes -->
							<div class="comment-box-container">
								<div class="comment-box">
									<div class="user-img">
										<img src="assets/img/staff/user.png" alt="">
									</div>
									<div class="comment-info">
										<div class="user-name">${comment.user.prenom} ${comment.user.nom}</div>
										<div class="comment-date">${comment.dateCommentaire}</div>
										<c:if test="${pageContext.request.remoteUser == comment.user.userName}">
											<a href="/removecomment?id=${comment.idCommentaire}" class="reply fa fa-remove"></a>
										</c:if>
									</div>
									<div class="comment-text">
										${ comment.commentaire }
									</div>
								</div>
							

							</div>
						</c:forEach>
							
						</div>
						<!-- End of Comment Box -->

						<!-- Comment Form -->
						<div class="comment-form-container">
							<h3>Ecrire un <b>Commentaire</b></h3>
							<div class="desc">Please fill all the fields of the below form and let us know what you are thinking about this hotel.</div>
							<form class="comment-form" action="/savecomment" method="post">
								<div class="field-row">
									<textarea name="commmentaire" placeholder="Votre commentaire :"></textarea>
								</div>
								<div class="field-row">
									<input type="submit" value="Ajouter" class="btn btn-default">
								</div>
							</form>

						</div>
						<!-- End of Comment Form -->

					</div>

				</div>
				<!-- End of Post Container -->

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
	<c:import url="footer.jsp"></c:import>
	<!-- End of Top Footer -->

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