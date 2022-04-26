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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ApplyForJob
 */
@WebServlet("/ApplyForJob")
public class ApplyForJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
  

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		Connection conn = null;
		
		RequestDispatcher dispatcher = null;
		String name = (String) session.getAttribute("name");
		System.out.println("JOB ID : " + session.getAttribute("jobId"));
		int id = (int) session.getAttribute("jobId");
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/traplaca?useSSL=false", "root", "123456");
			String query = "UPDATE applicant SET job_id=? WHERE app_name=?";
			PreparedStatement upstmt = conn.prepareStatement(query);
		upstmt.setInt(1, id);
		upstmt.setString(2, name);
		int row = upstmt.executeUpdate();
		if (row > 0) {
			System.out.println("Data updation Success");
			
			dispatcher = request.getRequestDispatcher("job_knowMore.jsp");
		}
		dispatcher.forward(request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
