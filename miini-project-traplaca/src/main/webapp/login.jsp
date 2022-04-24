<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>
<html>
<!-- #F9A826 -->

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
    <link rel="shortcut icon" href="images/Book Lover_Monochromatic.svg" type="image/x-icon">
    <script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
    <title>Login Page</title>
</head>

<body>

    <div class="container">
        <div class="images">

            <div class="message">
                <h2>Welcome</h2><br>
                <p class="content">Traplaca is a system to guide students to choose right career and to give knowledge, skill, and aptitude and meet the manpower requirements of the industry. This system aims to provide job opportunities. The required documents like the
                    resume and photo will be stored for every student which could be viewed by the recruiters if the student has applied for the job .</p>

                <img src="images/Startup _Outline.svg" alt="img" id="login">
            </div>



            <img id="logo" src="images/Book Lover_Monochromatic.svg" alt="logo">
        </div>
        <div class="form-container">
            <div class="title">Login Form</div>
            <form action="login" method="post">
                <div class="field" id="type">

                    <label for="type"><span>Choose Type : </span> </label>
                    <input type="radio" name="usertype" id="c" value="company"> <span>Recruiter</span>&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="usertype" id="s" value="student"> <span>Student</span>&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="usertype" id="a" value="admin"> <span>Admin</span>&nbsp;&nbsp;&nbsp;
                </div>

                <div class="field">
                    <input type="email" name="username" id="uid" value="" required>
                    <div class="icon"> <i class="fa fa-user" aria-hidden="true"></i></div>
                    <label for="uid">Username</label>
                </div>

                <div class="field">
                    <div class="icon"><i class="fa fa-lock" aria-hidden="true"></i></div>
                    <input type="password" name="password" id="password"  required />
                     <i class="bi bi-eye-slash" id="togglePassword" style="position: absolute; top:20px;right:20px;cursor:pointer;"></i> 
                  <label for="password" id="pass">Password</label> 
                </div>

                <div class="option_div">
                    <div class="check_box">
                        <input name="remember" type="checkbox" id="chkbox">
                        <span>Remember me</span>
                    </div>

                    <div class="pass-link">
                        <a href="#">Forgot password?</a>
                    </div>
                </div>
                <div class="field"><input type="submit" value="Login"></div>
                <div class="icons">
                    <a href="#"><i class="iconify" data-icon="logos:google-gmail"></i></a>
                    <a href="#"><i class="fa fa-linkedin" ></i></a>
                </div>
                <div class="signup-link">Not a member? <a href="choose_type.jsp">Signup now</a></div>



            </form>
        </div>
    </div>

   <script>
        const togglePassword = document.querySelector("#togglePassword");
        const password = document.querySelector("#password");

        togglePassword.addEventListener("click", function() {
            // toggle the type attribute
            const type = password.getAttribute("type") === "password" ? "text" : "password";
            password.setAttribute("type", type);

            // toggle the icon
            this.classList.toggle("bi-eye");
        });

        // prevent form submit
       /*  const form = document.querySelector("form");
        form.addEventListener('submit', function(e) {
            e.preventDefault();
        }); */
    </script>

</body>

</html>