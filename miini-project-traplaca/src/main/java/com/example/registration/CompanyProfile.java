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

import com.example.dbconnection.DBConnection;

/**
 * Servlet implementation class CompanyProfile
 */
@WebServlet("/CompanyProfile")

public class CompanyProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("user");
		String desc = request.getParameter("aboutCom");
		String address = request.getParameter("address");
		String email = request.getParameter("mail");
		String contact = request.getParameter("contact");
		
		int id=0;
		Connection conn = null;
		RequestDispatcher dispatcher=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = new DBConnection().getConnection();

			// getting app_id String
			Statement selstmt =conn.createStatement();
			ResultSet rs = selstmt.executeQuery("SELECT rec_id FROM recruiter WHERE rec_email= \""  + email +"\";");
			
			if (rs.next()) {
				id = rs.getInt("rec_id");
			}
			
			
			String upquery = "UPDATE recruiter SET rec_name=?,rec_email=?,rec_desc=?,rec_address=?,rec_contact=? WHERE rec_id=?";
			PreparedStatement upstmt=conn.prepareStatement(upquery);
			upstmt.setString(1,user);
			upstmt.setString(2,email);
			upstmt.setString(3,desc);
			upstmt.setString(4,address);
			upstmt.setString(5,contact);
			upstmt.setInt(6,id);
			
			int row = upstmt.executeUpdate();
			if (row > 0) {
				System.out.println("Data updation Success");
				dispatcher = request.getRequestDispatcher("company_profile.jsp");
			}
			dispatcher.forward(request, response);
		}
		catch(Exception e) {
			
		}
	}

}
