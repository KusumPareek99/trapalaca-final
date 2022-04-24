package com.example.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/registerRecruiter")
public class RegistrationServletCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uname = request.getParameter("name");
		String uemail = request.getParameter("email");
		String upwd = request.getParameter("password");
		String umobile = request.getParameter("contact");
		String address = request.getParameter("address");
		String desc = request.getParameter("description");
		
		System.out.println(uname);
		System.out.println(uemail);
		System.out.println(upwd);
		System.out.println(umobile);
		System.out.println(address);
		System.out.println(desc);
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/traplaca?useSSL=false", "root", "root");

			PreparedStatement stmt = conn
					.prepareStatement("insert into recruiter(rec_name, rec_email, rec_password, rec_desc, rec_address) values (?, ?, ?, ?, ?);");

			stmt.setString(1, uname);
			stmt.setString(2, uemail);
			stmt.setString(3, upwd);
			stmt.setString(4, desc);
			stmt.setString(5, address);	
			
			int rowCount = stmt.executeUpdate();
			
			RequestDispatcher dispatcher = null;
			
			if(rowCount > 0) {
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("login.jsp");
			}else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("company_signup.jsp");
			}
			
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
