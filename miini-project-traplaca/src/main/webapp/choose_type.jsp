<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Choose Type</title>
        <link rel="shortcut icon" href="images/Book Lover_Monochromatic.svg" type="image/x-icon">

        <link rel="stylesheet" href="css/choose_type.css">

        <script>
            function userType() {

                let studentRadio = document.getElementById("s").checked;
                let companyRadio = document.getElementById("c").checked;

                if (studentRadio) {

                    location.href = "student_signup.jsp";
                } else if (companyRadio) {

                    location.href = "company_signup.jsp";
                }
            }
        </script>
    </head>

    <body>
        <h1>Before you SignUp</h1>
        <div class="box">
            <div class="field">

                <label for="type">Choose your User Type</label><br>
                <Br>
                <input type="radio" name="rdbtn" id="c" value="Company"> <span id="Company">Company</span><br><br>
                <input type="radio" name="rdbtn" id="s" value="Student"> <span id="Student">Student</span><br><br>
            </div>

            <div class="button">
                <input type="button" value="OK" onclick="userType();">
            </div>
        </div>
    </body>

    </html>
