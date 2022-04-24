<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="shortcut icon" href="images/Book Lover_Monochromatic.svg" type="image/x-icon">
        <link rel="stylesheet" href="css/company_profile.css">
        
        <script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
<title>Company Profile</title>
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
            <a href="company_home.jsp">
                <img src="images/MINI-PROJECT-LOGO.svg" alt="LOGO">
            </a>
        </div>
        <div class="navbar" id="nav">

            <div class="items ">
			<a href="Company_home.jsp">Home</a> 
			<a href="job_post.jsp">Create a Job Post</a>
			<a href="#">About Us</a>
			<a href="company_profile.jsp"  class="active "><%= session.getAttribute("name")%></a>

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
        <form action="CompanyProfile" method="post" >
       <div class="content">
        <h1>Your Personal Details</h1><br><br><br>
        <div class="box">
            <table>
               
                <tr>
                    <td>
                        <label for="cname">Company Name</label>

                    </td>
                    <td> <input name="user" type="text" id="cname" value="<%= session.getAttribute("name") %>" ></td>
                </tr>
                <tr>
					<td>
					<label>About company:</label>
					</td>
					<td>
					<textarea name="aboutCom" placeholder="Brief description of what your company does"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label>Address:</label>
					</td>
					<td>
						<textarea name="address" placeholder="Type your address here"></textarea>
					</td>	
				</tr>
                
                <tr>
                    <td> 
                        <label for="">E-Mail</label>

                    </td>
                    <td><input type="email" name="mail" value="<%= session.getAttribute("c_email") %>" ></td>
                </tr>
                <tr>
                    <td>
                        <label>Contact Details:</label>

                    </td>
                    <td>
                       <input type="text" name="contact">
                    </td>

                </tr>
                
                <tr>
                    <td><input type="submit" value="Update Profile"></td>
                </tr>
            </table>
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