<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="shortcut icon" href="images/Book Lover_Monochromatic.svg" type="image/x-icon">
        <title>Company-SignUp</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel="stylesheet" href="css/company-signup.css">

    </head>

    <body>
        <div class="container">
            <form action="registerRecruiter" method="post">

                <div class="form-container">
                    <div class="images">
                        <img id="fsignup" src="images/faculty-signup-img.svg" alt="faculty-sign-up">
                        <img id="logo" src="images/Book Lover_Monochromatic.svg" alt="logo">
                    </div>
                    <div class="heading">
                        <h2>Create a new account</h2>
                    </div>
                    <div class="form-input">
                        <table>

<!--                            <div class="input-1"> -->
<!--                                 <tr> -->
<!--                                     <td><label for="fid">Company ID :</label></td> -->
<!--                                     <td><input id="fid" type="text" required></td> -->
<!--                                 </tr> -->
<!--                             </div> -->

                            <div class="input-2">
                                <tr>
                                    <td><label for="fname">Company Name :</label></td>

                                    <td><input id="fname" type="text" name="name" required></td>
                                </tr>
                            </div>

                            <div class="input-3">
                                <tr>
                                    <td>
                                        <label for="email">E-mail :</label>
                                    </td>
                                    <td><input id="email" type="email" name="email" required></td>
                                </tr>
                            </div>
                            <div class="input-4">
                                <tr>
                                    <td> <label for="contact">Contact Number :</label></td>
                                    <td><input id="contact" type="text" pattern="[1-9]{1}[0-9]{9}" maxlength="10"
                                           name="contact" required>
                                    </td>
                                </tr>
                            </div>
                            <div class="input-5">
                            <tr>
                                <td><label for="desc">Description :</label></td>
                                <td><input name="description" id="desc" required>	</td>
                              </tr>
                            </div>
                            <div class="input-6">
                                <td><label for="address">Address :</label></td>
                                <td><textarea name="address" id="address" cols="40" rows="4" required></textarea></td>
                            </div>
                            <div class="input-7">
                                <tr>
                                    <td><label for="pass">Password :</label></td>
                                    <td><input id="pass" type="password" name="password" required></td>
                                </tr>
                            </div>
                            <div class="input-8">
                                <tr>
                                    <td><label for="conpass"> Confirm Password :</label></td>
                                    <td><input id="conpass" type="password" required></td>
                                </tr>
                            </div>


                        </table>
                    </div>
                    <div class="button">
                        <input type="submit" value="Confirm">
                    </div>
                    <div class="link-container">
                        <br><br> Already have an account? <a href="login.jsp">Sign in</a>
                    </div>

                </div>

            </form>
        </div>
    </body>

    </html>
