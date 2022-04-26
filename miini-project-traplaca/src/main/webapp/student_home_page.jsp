<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="en">

<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
}
%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon" href="images/Book Lover_Monochromatic.svg"
	type="image/x-icon">
<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>

<link rel="stylesheet" href="css/student-home.css">
<title>STUDENT-HOME</title>

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
		<a href="student_home_page.jsp"> <img
			src="images/MINI-PROJECT-LOGO.svg" alt="LOGO">
		</a>
	</div>
	<div class="navbar" id="nav">

		<div class="items ">
			<a href="student_home_page.jsp" class="active">Home</a> 
			<a href="student_placement.jsp">Training & Placement</a> 
			<a href="student_careerGuide.jsp">Career Guide</a> 
			<a href="about_us.jsp">About Us</a>
			<a href="profile.jsp"><%= session.getAttribute("name")%></a>

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
	<div class="content">
		<div class="jobs-by-location">
		<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/traplaca?useSSL=false" user="root"
			password="123456" />
			 <sql:query dataSource="${db}" var="rs">  
SELECT recruiter.rec_name, job.job_title,job.job_id,recruiter.rec_id FROM ((recruiter INNER JOIN job ON recruiter.rec_id=job.rec_id) INNER JOIN applicant
ON applicant.location = job.location AND applicant.app_name='<%= session.getAttribute("name") %>' )
</sql:query>

			<h3>Opportunities near you</h3>
			<marquee behavior="scrolling" direction="up" height="350px"
				scrollamount="5" onmouseover="this.stop();"
				onmouseout="this.start();">
				<c:forEach var="table" items="${rs.rows}">
				<ul>
					<li><c:out value="${table.rec_name} --- ${table.job_title}" />
					<a href="job_knowMore.jsp?cid=<c:out value="${table.rec_id}"/>&jtitle=<c:out value="${table.job_title}"/>"> Know More</a></li>
					
				</ul>
				</c:forEach>
			</marquee>
		</div>
		
		 
		<div class="jobs-by-interest">
		<sql:query dataSource="${db}" var="rs">  
SELECT recruiter.rec_name, job.job_title,job.job_id,recruiter.rec_id FROM ((recruiter INNER JOIN job ON recruiter.rec_id=job.rec_id) INNER JOIN applicant
ON applicant.course_id = job.course_id AND applicant.app_name='<%= session.getAttribute("name") %>')
 
</sql:query>


			<h3>Based on your course</h3>
			<marquee behavior="scrolling" direction="up" height="350px"
				scrollamount="5" onmouseover="this.stop();"
				onmouseout="this.start();">
				<c:forEach var="table" items="${rs.rows}">
				
				<ul>
					<li><c:out value="${table.rec_name} --- ${table.job_title}" />
					 <a href="job_knowMore.jsp?cid=<c:out value="${table.rec_id}"/>&jtitle=<c:out value="${table.job_title}"/>"> Know More</a></li>
					
				</ul>
				</c:forEach>
			</marquee>
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
