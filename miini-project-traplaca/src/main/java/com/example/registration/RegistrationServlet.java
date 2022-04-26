package com.example.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/registerApplicant")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uname = request.getParameter("name");
		String uemail = request.getParameter("email");
		String upwd = request.getParameter("password");
		String ucourse = request.getParameter("course");
		String ulocation = null;
		@SuppressWarnings("unused")
		int job_id = 0;
		int course_id = 0;
		
		System.out.println(uname);
		System.out.println(uemail);
		System.out.println(upwd);
		System.out.println(ucourse);
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/traplaca?useSSL=false", "root", "123456");
			RequestDispatcher rd = null;
			/*
			 * Statement sel = conn.createStatement(); ResultSet rs =
			 * sel.executeQuery("select app_email from applicant where app_email=\"" +
			 * uemail + "\";"); if(rs.next()) { System.out.println("IN IFF"); rd =
			 * request.getRequestDispatcher("login.jsp"); rd.forward(request, response);
			 * }else
			 * {
			 */
				System.out.println("IN ELSE");
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery("select course_id from course where course_name = \""  + ucourse +"\";");
			
				if(resultSet.next()) {
					course_id = resultSet.getInt(1);
	//				System.out.println(course_id);						
				}
			
	
				PreparedStatement stmt = conn
						.prepareStatement("insert into applicant(app_name, app_email, app_password, location, course_id, job_id) values (?, ?, ?, ?, ?, ?);");
	
				stmt.setString(1, uname);
				stmt.setString(2, uemail);
				stmt.setString(3, upwd);
				stmt.setString(4, ulocation);
				stmt.setInt(5, course_id);
				stmt.setString(6, null);
				
				int rowCount = stmt.executeUpdate();
				
				RequestDispatcher dispatcher = null;
			
				if(rowCount > 0) {
					request.setAttribute("status", "success");
					dispatcher = request.getRequestDispatcher("login.jsp");
				}else {
					request.setAttribute("status", "failed");
					dispatcher = request.getRequestDispatcher("student_signup.jsp");
				}
			
				dispatcher.forward(request, response);
			//}
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		}
	
}
