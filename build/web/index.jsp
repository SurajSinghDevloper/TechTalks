<%-- 
    Document   : index
    Created on : 19-Aug-2022, 1:01:40 pm
    Author     : suraj
--%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- BootStrap Link -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Css Part -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />
<style>
.banner-background {
clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 82%, 70% 100%, 25% 87%, 0 100%, 0 0);

}
</style>
        <title>Home</title>
    </head>
    <body>
     <!-- Nav Bar -->
	<%@include file="normal_navbar.jsp"%>
	<!-- Banner of Home page -->
	<div class="container-fluid p-0 m-0">
		<div class="jumbotron primary-background text-white banner-background">
			<div class="container">
				<h3 class="display-3">Welcome to Techblog</h3>
				<p>Welcome to technical blog, World of technology A programming
					language is any set of rules that converts strings, or graphical
					program elements in the case of visual programming languages, to
					various kinds of machine code output. [citation needed] Programming
					languages are one kind of computer language, and are used in
					computer programming to implement algorithms.</p>
                                <a href="register_page.jsp" class="btn btn-outline-dark btn-lg">
					<span class="fa fa-lightbulb-o"> </span>Start ! its Free
				</a>
				<a href="login_page.jsp" class="btn btn-outline-dark btn-lg">
					<span class="fa fa-user-circle fa-spin"> </span>Login
				</a>
			</div>
		</div>
	</div>
	<br>

	<!-- Card -->
	<div class="container">
		<div class="row mb-2">
			<!-- Card1 -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programing</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>
			<!-- Card2 -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programing</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>


			<!-- Card3 -->

			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programing</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>
			<!-- Card 2nd row -->
			<div class="row">
				<!-- Card4 -->
				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Java Programing</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn primary-background text-white">Read
								More</a>
						</div>
					</div>
				</div>
				<!-- Card4 -->
				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Java Programing</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn primary-background text-white">Read
								More</a>
						</div>
					</div>
				</div>


				<!-- Card5 -->

				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Java Programing</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn primary-background text-white">Read
								More</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>










	<!-- Here is the JavaScript Url -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<script src="js/myjs.js" type="text/javascript"></script>   
    </body>
</html>
