<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" href="images/Book Lover_Monochromatic.svg" type="image/x-icon">
    <script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>

    <link rel="stylesheet" href="css/admin_add_data.css">
    <title>Admin Add Data</title>
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

        function viewUser() {
            var user = document.getElementById("user").value;
            var applicant = document.getElementById("appDetails");
            var company = document.getElementById("compDetails");

            if (user == "company") {
                applicant.style.visibility = 'hidden';
                company.style.visibility = 'visible';
            } else if (user == "applicant") {
                applicant.style.visibility = 'visible';
                company.style.visibility = 'hidden';
            }
        }
    </script>
    <div class="logo">
        <a href="admin_home.js[]">
            <img src="images/MINI-PROJECT-LOGO.svg" alt="">
        </a>
    </div>
    <div class="navbar" id="nav">

        <div class="items ">
            <a href="admin_home.jsp" >Home</a>
            <a href="admin_add_data.jsp" class="active"> Add Career Training Data</a>
            <a href="admin_add_course.jsp"> Add Course</a>
            <a href="about_us.jsp">About Us</a>

        </div>
        <div class="menu">
            <i class="fa fa-navicon" style="color: white;font-size:38px;position:relative;left:250px;cursor:pointer" onclick="veiwMenu();"></i>

        </div>
    </div>
    <div class="menu-links" id="menu-link" style="visibility: hidden;">
        <ul style="list-style: none;">

            <li><a href="login.jsp">Log Out</a></li>
            <hr>
            <li><a href="">Help</a></li>
            <hr>
        </ul>
    </div>
    <div class="content">
        <form action="AdminInsertData" method="post">
        <div class="title">
            <h1>Add Career/Training Data</h1>
        </div>
        <div class="box">
            <table>
                <tr>
                    <td><label>Choose Type:</label></td>
                    <td>
                        <select name="type">
                            <option value="articles">Articles</option>
                            <option value="resources">Resources</option>
                            <option value="domain">Domain</option>
                            <option value="trending">Trending</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>Title:</label></td>
                    <td><input type="text" name="title"></td>
                </tr>
                <tr>
                    <td><label>Link:</label></td>
                    <td><input type="text" name="link"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Add Data" name="submitbtn"></td>
                </tr>

            </table>
           
        </div>
         </form>
    </div>
    <div class="footer">
        <footer>
            <h3>Contact Us</h3>
            <ol>
                <li><a href="#"><i class="fa fa-linkedin" ></i></a></li>
                <li><a href=""><i class="fa fa-twitter"></i></a></li>
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