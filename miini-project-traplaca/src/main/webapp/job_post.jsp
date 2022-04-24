<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="shortcut icon" href="images/Book Lover_Monochromatic.svg" type="image/x-icon">
        <script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>

        <link rel="stylesheet" href="css/job_post.css">

        <title>Create new Job Post</title>

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
            <a href="student_home_page.html">
                <img src="images/MINI-PROJECT-LOGO.svg" alt="">
            </a>
        </div>
        <div class="navbar" id="nav">

            <div class="items ">
                <a href="Company_home.jsp" >Home</a>
                <a href="job_post.html"class="active">Create a Job Post</a>
                <a href="#">About Us</a>

            </div>
            <div class="menu">
                <i class="fa fa-navicon" style="color: white;font-size:38px;position:relative;left:250px;cursor:pointer"
                    onclick="veiwMenu();"></i>

            </div>
        </div>
        <div class="menu-links" id="menu-link" style="visibility: hidden;">
            <ul style="list-style: none;">
                <li> <a href="company_profile.jsp">My Profile</a></li>
                <hr>
                <li><a href="logout">Log Out</a></li>
                <hr>
                <li><a href="">Help</a></li>
                <hr>
            </ul>
        </div>
        <div class="content">
            <div class="title">
                <h1>Create New Job Post</h1>
            </div>
            <div class="box">
                <form action="postJob" method="post">
                    <table>
                        <tr>
                            <td>
                                <label for="job_title">Job Title:</label>
                            </td>
                            <td>
                                <input type="text" name="title" id="job_title" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="desc">Job Decription:</label>
                            </td>
                            <td>
                                <textarea name="description" id="desc" cols="50" rows="5" required></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="course" id="scourse">Course :</label></td>
                            <td><select id="course" name="course" required>
                                    <option>--Choose a course--</option>
                                    <option>MCA</option>
                                    <option>MBA</option>
                                    <option>MBA(DM)</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td><label for="loc">Location:</label></td>
                            <td><input type="text" name="location" id="loc"></td>
                        </tr>
                        <tr>
                            <td><label for="lastDate">Last Date to Apply:</label></td>
                            <td><input type="date" id="lastDate" name="lastDate"></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Post"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <div class="footer">
            <footer>
                <h3>Contact Us</h3>
                <ol>
                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                    <li><a href=""><i class="fa fa-twitter"></i></a></li>
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
