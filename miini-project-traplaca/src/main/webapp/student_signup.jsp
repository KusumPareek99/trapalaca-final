<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- insert and style fontawesome eye icon & code for captcha -->
<!-- HEX CODE FOR THEME COLOR USED #F9A826 -->
<!DOCTYPE html>
<html>

<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Student-SignUp</title>
<link rel="shortcut icon" href="images/Book Lover_Monochromatic.svg"
	type="image/x-icon">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="css/student-signup.css">
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>

<body>

	<form class="form-container" method="post" action="registerApplicant">
		<div class="signupimg">
			<img src="images/student-signup-img.svg"
				alt="images/student-signup-img">
		</div>
		<img id="logo" src="images/Book Lover_Monochromatic.svg" alt="logo">

		<div class="container">
			<h2 id="heading">Create new account</h2>

			<table>
				<!-- <tr>
                    <td><label for="sid">Student ID :</label></td>
                    <td><input type="text" id="sid" required></td>
                </tr> -->
				<tr>
					<td><label for="name" id="sname">Name :</label></td>
					<td><input type="text" id="name" name="name" required></td>
				</tr>

				<tr>
					<td><label for="course" id="scourse">Course :</label></td>
					<td><select id="course" name="course" required>
							<option>--Choose a course--</option>
							<option >MCA</option>
							<option >MBA</option>
							<option >MBA(DM)</option>
					</select></td>
				</tr>
				<!--
                    To be added in profile section      
                <tr>
                    <td><label for="city">Preferred Locations:</label></td>
                    <td><select name="city" id="city" multiple>
                        <option value="0">--Choose Cities--</option>
                        <option value="1">Pimpri</option>
                        <option value="2">Hinjewadi</option>
                        <option value="3">Balewadi</option>
                    </select></td>
                </tr>
               
                    <tr>
                    <td>
                        <label for="chk">
                            Interested Fields
                        </label>
                        <input type="checkbox" name="ch1" id="ch1" value="">Coding and Programming
                        <input type="checkbox" name="ch2" id="ch2">Digital Marketing
                        <input type="checkbox" name="ch3" id="ch3">Web Development

                    </td>
                </tr> -->

				<tr>
					<td><label for="email">E-mail :</label></td>
					<td><input id="email" type="email" name="email" required>
					</td>
				</tr>
				<tr>
					<td><label for="password">Password:</label></td>
					<td><input type="password" name="password" id="password" /></td>

				</tr>
				<tr>
					<td><label for="pass2">Confirm Password :</label></td>
					<td><input id="pass2" type="password" required></td>
				</tr>

			</table>
		</div>
		<div class="button">
			<input type="submit" value="Confirm">
		</div>
		<div class="link-container">
			<br>
			<br> Already have an account? <a href="login.jsp">Sign in</a>
		</div>
	</form>

</body>

</html>
