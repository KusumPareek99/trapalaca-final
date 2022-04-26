<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
<link rel="shortcut icon" href="images/Book Lover_Monochromatic.svg"
	type="image/x-icon">
<link rel="stylesheet" href="css/student-careerGuide.css">
<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
<title>Career Guidance</title>

</head>

<body>

	<script>
		window.onscroll = function() {

			stickynav()
		};
		var navbar = document.getElementById("nav");
		var sticky = navbar.offsetTop;

		function stickynav() {
			if (window.pageYOffset >= sticky) {
				navbar.classList.add("sticky");
			} else {
				navbar.classList.remove("sticky");
			}
		}

		function veiwMenu() {
			var x = document.getElementById("menu-link");

			if (x.style.visibility === 'hidden') {
				x.style.visibility = 'visible';
			} else {
				x.style.visibility = 'hidden';
			}
		}
	</script>
	<div class="logo">
		<a href="student_home_page.jsp"> <img
			src="images/MINI-PROJECT-LOGO.svg" alt="">
		</a>
	</div>
	<div class="navbar" id="nav">

		<div class="items ">
			<a href="student_home_page.jsp">Home</a> <a
				href="student_placement.jsp">Training & Placement</a> <a
				href="student_careerGuide.jsp" class="active">Career Guide</a> <a
				href="about_us.jsp">About Us</a>

		</div>
		<div class="menu">
			<i class="fa fa-navicon"
				style="color: white; font-size: 38px; position: relative; left: 250px; cursor: pointer"
				onclick="veiwMenu();"></i>

		</div>
	</div>
	<div class="menu-links" id="menu-link" style="visibility: hidden;">
		<ul style="list-style: none;">
			<li><a href="./profile.jsp">My Profile</a></li>
			<hr>
			<li><a href="login.jsp">Log Out</a></li>
			<hr>
			<li><a href="">Help</a></li>
			<hr>
		</ul>

	</div>
	<form  method="post">
	<div class="content">
		<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/traplaca?useSSL=false" user="root"
			password="123456" />
		<div class="search-domain">

			<div class="search-bar">
				<input type="text" name="search" id="search" placeholder="Type here to search">
				<button name="searchbtn" type="submit"><i class="fa fa-search"></i></button>
			</div>
			<div class="domains">
			
			<c:if test="${param.searchbtn}">
			<p>hey</p>
			</c:if>
				<sql:query dataSource="${db}" var="rs">  
SELECT * from career_training where type='domain' ;   

</sql:query>
				<h3>Domain</h3>
				<ul><c:forEach var="table" items="${rs.rows}">
					

						<li><c:out value="${table.title}" /> <a
							href="<c:out value="${table.links}" />"><br>Know More</a></li>
					
				</c:forEach></ul>  
			</div>
		</div>
		<div class="trending-careers">
			<sql:query dataSource="${db}" var="rs">  
SELECT * from career_training where type='trending';  
</sql:query>
			<h3>Trending Careers</h3>
			<c:forEach var="table" items="${rs.rows}">
				<ul>
					<li><c:out value="${table.title}" /> <a
						href="<c:out value="${table.links}" />"> Know More</a></li>
				</ul>
			</c:forEach>
		</div>
	</div>
	<div class="footer">
		<h3>Contact Us</h3>
		<ol>
			<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
			<li><a href="#"><i class="fa fa-twitter"></i></a></li>
			<li><a href="#"><i class="iconify"
					data-icon="logos:google-gmail"></i></a></li>
		</ol>
	</div>
	</form>
	<script>
		window.onscroll = function() {
			myFunction()
		};

		var navbar = document.getElementById("nav");
		var sticky = navbar.offsetTop;

		function myFunction() {

			if (window.pageYOffset >= sticky) {
				navbar.classList.add("sticky")
			} else {
				navbar.classList.remove("sticky");
			}
		}
	</script>


</body>

</html>
