<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<header id="main-header">
		<div class="inner-container container">
			<div class="left-sec col-sm-4 col-md-2 clearfix">
				<!-- Top Logo -->
				<div id="top-logo">
					<div class="title"><span>Book</span> Hotel</div>
					<i class="fa fa-star-o"></i>
					<i class="fa fa-star-o"></i>
					<i class="fa fa-star-o"></i>
					<i class="fa fa-star-o"></i>
					<i class="fa fa-star-o"></i>
				</div>
			</div>
			<div class="right-sec col-sm-8 col-md-10 clearfix">


				<!-- Main Menu -->
				<nav id="main-menu">
					<ul class="list-inline">
						<li class="active"><a href="#">Accueil</a> 
						</li>
						<sec:authorize ifAnyGranted="ROLE_CLIENT">
					       	 <li>
					        	<a href="#"><c:out value="${pageContext.request.remoteUser}"></c:out></a>
									<ul>
										<li><a href="/compteinfos">Paramètres</a></li>
										<li><a href="/mesreservations">Mes réservations</a></li>
										<li><a href="logout">Se déconnectez</a></li>
									</ul>
								</li>
					    </sec:authorize>
					    <sec:authorize ifNotGranted="ROLE_CLIENT">
					       		<li><a href="/login">Connectez-vous</a></li>
					    </sec:authorize>
						
						
						<li><a href="#">Contact</a>
						</li>
					</ul>
				</nav>
				<!-- Menu Handel -->
				<div id="main-menu-handle" class="hidden-md hidden-lg"><i class="fa fa-bars"></i></div>
			</div>
		</div>
		<div id="mobile-menu-container" class="hidden-md hidden-lg"></div>
	</header>