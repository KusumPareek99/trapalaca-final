<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
        <link rel="shortcut icon" href="images/Book Lover_Monochromatic.svg" type="image/x-icon">
        <link rel="stylesheet" href="css/student-careerGuide.css">
        <script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
        <title>Career Guidance</title>

    </head>

    <body>

        <script>
            window.onscroll = function () {

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
            <a href="student_home_page.jsp">
                <img src="images/MINI-PROJECT-LOGO.svg" alt="">
            </a>
        </div>
        <div class="navbar" id="nav">

            <div class="items ">
                <a href="student_home_page.jsp">Home</a>
                <a href="student_placement.jsp">Training & Placement</a>
                <a href="student_careerGuide.jsp" class="active">Career Guide</a>
                <a href="about_us.jsp">About Us</a>

            </div>
            <div class="menu">
                <i class="fa fa-navicon" style="color: white;font-size:38px;position:relative;left:250px;cursor:pointer"
                    onclick="veiwMenu();"></i>

            </div>
        </div>
        <div class="menu-links" id="menu-link" style="visibility: hidden;">
            <ul style="list-style: none;">
                <li> <a href="./profile.jsp">My Profile</a></li>
                <hr>
                <li><a href="login.jsp">Log Out</a></li>
                <hr>
                <li><a href="">Help</a></li>
                <hr>
            </ul>

        </div>
        <div class="content">
            <div class="search-domain">
                <div class="search-bar">
                    <input type="text" id="search"><a href="#"><i class="fa fa-search"></i></a>

                </div>
                       <div class="domains">
                <h3>Domain</h3>
                <ul>
                    <li>Web Developer
                        <a href="https://brainstation.io/career-guides/how-to-become-a-web-developer"><br>Know More</a>
                    </li>
                    <li>AI and ML
                        <a href="https://uxdesign.cc/the-beginners-guide-to-understanding-artificial-intelligence-3b93e844591"><br>Know More</a>
                    </li>
                    <li>DBA
                        <a href="https://www.databasestar.com/how-to-become-a-database-administrator/"><br>Know More</a>
                    </li>
                    <li>Testing and Automation
                        <a href="https://angiejones.tech/test-automation-career-path/"><br>Know More</a>
                    </li>
                    <li>Research Field
                        <a href="https://engineering-computer-science.wright.edu/computer-science-and-engineering/areas-of-research"><br>Know More</a>
                    </li>
                </ul>
                <ul>
                    <li>Robotics
                        <a href="https://www.analyticsinsight.net/datarobots-no-code-ai-now-quickly-turn-any-model-into-ai-application/"> <br> Know More</a>
                    </li>
                    <li>Cyber Security
                        <a href="https://expel.com/blog/a-beginners-guide-to-getting-started-in-cybersecurity/"> <br> Know More</a>
                    </li>
                    <li>Bioinformatics
                        <a href="https://www.bioinformaticscareerguide.com/"><br> Know More</a>
                    </li>
                    <li>Blockchain
                        <a href="https://101blockchains.com/blockchain-for-beginners/"> <br>Know More</a>
                    </li>
                    <li>Cloud Computing
                        <a href="https://hackr.io/blog/what-is-cloud-computing-beginners-guide"><br> Know More</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="trending-careers">
            <h3>Trending Careers</h3>
            <ul>
                <li>Software Development Director <a href="https://www.zippia.com/director-of-software-development-jobs/">  Know More</a></li>
                <li>Principal Software Engineer <a href="https://www.zippia.com/principal-software-engineer-jobs/what-does-a-principal-software-engineer-do/">  Know More</a></li>
                <li>Site Reliability Engineer<a href="https://www.flagship.io/glossary/site-reliability-engineer/">  Know More</a></li>
                <li>Security Consultant <a href="https://flatironschool.com/blog/how-to-become-a-cyber-security-consultant">  Know More</a></li>
                <li>Cyber Security Engineer <a href="https://www.jigsawacademy.com/blogs/cyber-security/cyber-security-engineer/">  Know More</a></li>
                <li>Full Stack Developer<a href="https://www.geeksforgeeks.org/what-is-full-stack-development/">  Know More</a></li>
                <li>Developer Opertions(DevOps) Engineer<a href="https://www.redhat.com/en/topics/devops/devops-engineer#:~:text=A%20DevOps%20engineer%20introduces%20processes,deployment%2C%20to%20maintenance%20and%20updates.r">  Know More</a></li>
                <li>Security Engineer<a href="https://cybersecurityguide.org/careers/security-engineer/">  Know More</a></li>
                <li>Computer Scientist<a href="https://www.mastersindatascience.org/careers/computer-scientist/">  Know More</a></li>
                <li>Software Developer <a href="https://www.thebalancecareers.com/software-developer-job-description-salary-and-skills-2061833">  Know More</a></li>
            </ul>
        </div>
    </div>
        <div class="footer">
            <h3>Contact Us</h3>
            <ol>
                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
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
