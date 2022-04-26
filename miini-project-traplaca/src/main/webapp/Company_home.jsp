<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
	<% if (session.getAttribute("name")==null) { response.sendRedirect("login.jsp"); } %>


		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
			<link rel="shortcut icon" href="images/Book Lover_Monochromatic.svg" type="image/x-icon">
			<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>

			<link rel="stylesheet" href="css/company_home.css">
			<title>COMPANY-HOME</title>

		</head>

		<body>

			<script>
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
				<a href="company_home.html"> <img src="images/MINI-PROJECT-LOGO.svg" alt="">
				</a>
			</div>
			<div class="navbar" id="nav">

				<div class="items ">
					<a href="Company_home.jsp" class="active ">Home</a>
					<a href="job_post.jsp">Create a Job Post</a>
					<a href="about_us.jsp">About Us</a>
<a href="company_profile.jsp"><%= session.getAttribute("name") %></a>
				</div>
				<div class="menu">
					<i class="fa fa-navicon"
						style="color: white; font-size: 38px; position: relative; left: 250px; cursor: pointer"
						onclick="veiwMenu();"></i>

				</div>
			</div>
			<div class="menu-links" id="menu-link" style="visibility: hidden;">
				<ul style="list-style: none;">
					<li><a href="company_profile.jsp">My Profile</a></li>
					<hr>
					<li><a href="logout">Log Out</a></li>
					<hr>
					<li><a href="">Help</a></li>
					<hr>
				</ul>
			</div>
			<div class="content">
			<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/traplaca?useSSL=false" user="root"
			password="123456" />
			<sql:query dataSource="${db}" var="rs">
				SELECT rec_id FROM recruiter WHERE rec_name='<%= session.getAttribute("name") %>'
			</sql:query>
			<c:forEach var="table" items="${rs.rows}">
         <c:set var="recId" scope="session" value="${table.rec_id}"/>
         </c:forEach>
		<sql:query dataSource="${db}" var="rs">  
SELECT app_name,app_email,app_resume,job.job_title from applicant,job WHERE applicant.job_id=job.job_id AND job.rec_id=<c:out value="${recId}"/>
</sql:query> 
				<h1>Applicants List</h1>
				<br>
				<br>
				<div class="list">
				<table>
					<tr>
					<th>Job Title</th>
					 <th>Applicant Name</th>
               		 <th>Applicant Email</th>
              		 <th>Resume</th>
				   </tr>
					<c:forEach var="table" items="${rs.rows}">
					<tr>
						<td><c:out value="${table.job_title}" /></td>
						<td><c:out value="${table.app_name}" /></td>
						<td><c:out value="${table.app_email}" /></td>
						<td><c:out value="${table.app_resume}" /></td>
					</tr>
				</c:forEach>
						
					</table>
				</div>
			</div>
			<div class="footer">
				<footer>
					<h3>Contact Us</h3>
					<ol>
						<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="iconify" data-icon="logos:google-gmail"></i></a></li>
					</ol>
				</footer>
			</div>
			<script>
				window.onscroll = function () {
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