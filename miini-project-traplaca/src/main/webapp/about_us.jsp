<%@ page import="java.io.*,java.util.*,javax.servlet.http.HttpSession"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
        <link rel="shortcut icon" href="images/Book Lover_Monochromatic.svg" type="image/x-icon">
        <link rel="stylesheet" href="css/about-us.css">
        <script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
        <title>About Us</title>

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
            <a href="student_home_page.jsp">
                <img src="images/MINI-PROJECT-LOGO.svg" alt="">
            </a>
        </div>
        <div class="navbar" id="nav">
       <c:set var="userType" scope="session" value="${type}" />
      
<c:if test="${userType=='student'}">

            <div class="items ">
                <a href="student_home_page.jsp">Home</a>
                <a href="student_placement.jsp">Training & Placement</a>
                <a href="student_careerGuide.jsp">Career Guide</a>
                <a href="about_us.jsp" class="active ">About Us</a>
            </div>
</c:if>

<c:if test="${userType=='company'}">

            <div class="items ">
                <a href="Company_home.jsp" class="active ">Home</a>
					<a href="job_post.jsp">Create a Job Post</a>
					<a href="#">About Us</a>
            </div>
</c:if>

<c:if test="${userType=='admin'}">

            <div class="items ">
			<a href="admin_home.jsp" class="active ">Home</a> <a href="">About
				Us</a>

            </div>
</c:if>
            <div class="menu">
                <i class="fa fa-navicon" style="color: white;font-size:38px;position:relative;left:250px;cursor:pointer"
                    onclick="veiwMenu();"></i>

            </div>
        </div>
        <div class="menu-links" id="menu-link" style="visibility: hidden;">
            <ul style="list-style: none;">
                <li> <a href="profile.jsp">My Profile</a></li>
                <hr>
                <li><a href="login.jsp">Log Out</a></li>
                <hr>
                <li><a href="">Help</a></li>
                <hr>
            </ul>

        </div>
        <div class="content">

            <div id="scope">
                <h3>TraPlaCa</h3>
                <p>Traplaca is a system to guide students to choose right career and to give knowledge, skill, and
                    aptitude
                    and meet the skill requirements of the industry. This system aims to provide job opportunities.
                    The
                    required documents like the resume
                    and photo will be stored for every student which could be viewed by the recruiters if the student
                    has
                    applied for the job .</p>

            </div>
            <div id="team">
                <div class="card">
                    <img src="images/MINI-PROJECT-LOGO.svg" alt="">
                </div>
                <h3>Team Members</h3>
                <ol>
                    <li>Kusum Pareek</li>
                    <li>Akanksha Singh</li>
                    <li>BalKrishna Mehata</li>
                </ol>
            </div>
        </div>
        <div class="footer">
            <h3>Contact Us</h3>
            <ol>
                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                <li><a href=""><i class="fa fa-twitter"></i></a></li>
                <li><a href="#"><i class="iconify" data-icon="logos:google-gmail"></i></a></li>
            </ol>
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
