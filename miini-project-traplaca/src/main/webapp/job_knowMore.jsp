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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" href="images/Book Lover_Monochromatic.svg" type="image/x-icon">
    <script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>

    <link rel="stylesheet" href="css/knowMore.css">
    <title>Know More</title>

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

        <div class="items ">
            <a href="student_home_page.jsp">Home</a>
            <a href="student_placement.jsp">Training & Placement</a>
            <a href="student_careerGuide.jsp">Career Guide</a>
            <a href="about_us.jsp">About Us</a>

        </div>
        <div class="menu">
            <i class="fa fa-navicon" style="color: white;font-size:38px;position:relative;left:250px;cursor:pointer" onclick="veiwMenu();"></i>

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
    <form action="ApplyForJob" method="post">
    <div class="content">
    <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/traplaca?useSSL=false" user="root"
			password="123456" />
			<sql:query dataSource="${db}" var="rs">  
			
SELECT job.job_title,job.job_id,job.rec_id,job.job_desc,job.last_date,job.location from job,recruiter WHERE job.job_title="<c:out value="${param.jtitle}"/>" AND job.rec_id=<c:out value="${param.cid}"/>;  
</sql:query>

       <table>
       
              <tr>
                <th>Job Title</th>
                <th>Job Description</th>
                <th>Last Date to Apply</th>
                <th>Location</th>
                
            </tr>
              
            <c:forEach var="table" items="${rs.rows}">
         <c:set var="jobId" scope="session" value="${table.job_id}"/>
         <c:set var="recId" scope="session" value="${table.rec_id}"/>
				<c:out value="${table.job_id } is my cout job id." />
				<c:out value="${table.rec_id } is my cout rec id." />
<c:out value="${jobId} is job id."/>
<c:out value="${recId} is rec id."/>
            <tr>
                <td><c:out value="${table.job_title}" /></td>
                <td><c:out value="${table.job_desc}" /></td>
                <td><c:out value="${table.last_date}" /></td>
                <td><c:out value="${table.location}" /></td>
                
            </tr>
           </c:forEach>
        </table>
<div class="button">
<input type="submit" value="Apply for this job">
</div>
    </div>
    </form>
    <div class="footer">
        <footer>
            <h3>Contact Us</h3>
            <ol>
                <li><a href="#"><i class="fa fa-linkedin" ></i></a></li>
                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li><a href="#"><i class="iconify" data-icon="logos:google-gmail"></i></a></li>
            </ol>
        </footer>
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