package com.example.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.dbconnection.DBConnection;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uemail = request.getParameter("username");
		String upwd = request.getParameter("password");
		String remember = request.getParameter("remember");
		String usertype = request.getParameter("usertype");

		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = new DBConnection().getConnection();
			PreparedStatement stmt = null;
			
			if (usertype.equals("student")) {
				stmt = conn.prepareStatement("select * from applicant where app_email = ? and app_password = ?;");
			}
			
			if (usertype.equals("company")) {
				stmt = conn.prepareStatement("select * from recruiter where rec_email = ? and rec_password = ?;");
			}
			if (usertype.equals("admin")) {
				stmt = conn.prepareStatement("select * from admin where ad_email = ? and ad_pass = ?;");
			}

			stmt.setString(1, uemail);
			stmt.setString(2, upwd);

			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) {
				System.out.println("User exists");
				if (remember.equals("on")) {
					//String name = usertype.equals("company") ? "rec_name" : "app_name";
					String name="";
					if(usertype.equals("company")) {
						name="rec_name";
					}else if(usertype.equals("student")) {
						name="app_name";
					}else if(usertype.equals("admin")) {
						name="ad_name";
					}
					session.setAttribute("type", usertype);
					session.setAttribute("name", rs.getString(name));
				}
				if (usertype.equals("company")) {
					session.setAttribute("c_email", uemail);
					dispatcher = request.getRequestDispatcher("Company_home.jsp");
				}
				if (usertype.equals("student")) {
					session.setAttribute("a_email",uemail);
					dispatcher = request.getRequestDispatcher("student_home_page.jsp");
				}
				if (usertype.equals("admin")) {
					session.setAttribute("admin_email",uemail);
					dispatcher = request.getRequestDispatcher("admin_home.jsp");
				}
			} else {
				System.out.println("User fetching failed");
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
			}

			dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
