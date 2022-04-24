<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    <!doctype html>
    <html>

    <head>
        <meta charset="UTF-8">
      <!--  <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">  -->
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="shortcut icon" href="images/Book Lover_Monochromatic.svg" type="image/x-icon">
        <link rel="stylesheet" href="css/student-profile.css">
        
        <script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>

 <title>Student-Profile</title>      
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
         
    </head>

    <body>
    
        <div class="logo">
            <a href="student_home_page.jsp">
                <img src="images/MINI-PROJECT-LOGO.svg" alt="LOGO">
            </a>
        </div>
        <div class="navbar" id="nav">

            <div class="items ">
			<a href="student_home_page.jsp">Home</a> 
			<a href="student_placement.jsp">Training & Placement</a> 
			<a href="student_careerGuide.jsp">Career Guide</a> 
			<a href="about_us.jsp">About Us</a>
			<a href="profile.jsp" class="active"><%= session.getAttribute("name")%></a>

		</div>
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
        <form action="ApplicantProfile" method="post" enctype="multipart/form-data">
       <div class="content">
       <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/traplaca?useSSL=false" user="root"
			password="123456" />
			<sql:query dataSource="${db}" var="rs">  
SELECT * from applicant where app_email='<%= session.getAttribute("a_email") %>';  
</sql:query>
        <h1>Your Personal Details</h1><br><br><br>
        <div class="box">
        <c:forEach var="table" items="${rs.rows}">
        <table>
                <tr>
                    <td>
                        <label for="picture">Profile Photo</label>
                    </td>
                    <td>
                        <input type="file" id="picture" name="photo"><c:out value="${table.app_profile}" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="uname">Name</label>

                    </td>
                    <td> <input name="user" type="text" id="uname" value="<%= session.getAttribute("name") %>" ></td>
                </tr>
                <tr>
					<td><label for="course" id="scourse">Course :</label></td>
					<td><select id="course" name="course">
							<option>--Choose a course--</option>
							<option>MCA</option>
							<option>MBA</option>
							<option>MBA(DM)</option>
					</select></td>
				</tr>
                
                <tr>
                    <td> 
                        <label for="">E-Mail</label>

                    </td>
                    <td><input type="email" name="mail" value="<%= session.getAttribute("a_email") %>" ></td>
                </tr>
                <tr>
                    <td>
                        <label for="loc">Location</label>

                    </td>
                    <td>
                        <select name="location" id="loc">
                            <option >Pimpri</option>
                            <option >Balewadi</option>
                            <option >Hinjewadi</option>
                        </select>
                    </td>

                </tr>


                <tr>
                    <td>
                        <label for="resume">Resume</label>

                    </td>
                    <td>
                        <input type="file" name="resume" id="res" value="${table.app_resume}">
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Update Profile"></td>
                </tr>
                
            </table>
        
        </c:forEach>
                    </div>
    </div>
    </form>
    <div class="footer">
        <h3>Contact Us</h3>
        <ol>
            <li><a href="#"><i class="fa fa-linkedin" ></i></a></li>
            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
            <li><a href="#"><i class="iconify" data-icon="logos:google-gmail"></i></a></li>
        </ol>
    </div>
  
    </body>

    </html>
