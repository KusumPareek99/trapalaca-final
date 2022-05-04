package com.example.registration;

import java.io.IOException;
import java.io.InputStream;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.example.dao.DBConnection;

//import com.mysql.cj.xdevapi.Statement;

/**
 * Servlet implementation class StudentProfile
 */
@WebServlet("/ApplicantProfile")
@MultipartConfig
public class ApplicantProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// PROFILE PHOTO
		InputStream inputStream = null;
		Part filepart = request.getPart("photo");

		if (filepart != null) {
			/*
			 * System.out.println("Photo File Name "+filepart.getName());
			 * System.out.println("Photo File Size "+filepart.getSize());
			 * System.out.println("Photo File Content Type "+filepart.getContentType());
			 */

			inputStream = filepart.getInputStream();
		}

		String name = request.getParameter("user");
		
		//String course = request.getParameter("course");
		
		
		String email = request.getParameter("mail");
		String location = request.getParameter("location");
		String course = request.getParameter("course");
		
		// RESUME
		InputStream rinputstream = null;
		Part rfilepart = request.getPart("resume");

		if (rfilepart != null) {
			/*
			 * System.out.println("Resume File Name "+rfilepart.getName());
			 * System.out.println("Resume File Size "+rfilepart.getSize());
			 * System.out.println("Resume File Content Type "+rfilepart.getContentType());
			 */
			rinputstream = filepart.getInputStream();
		}


		Connection conn = null;
		
		RequestDispatcher dispatcher = null;
		int id = 0;
		int course_id=0;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = new DBConnection().getConnection();

			// getting app_id String
			
			Statement selstmt =conn.createStatement();
			ResultSet rs = selstmt.executeQuery("SELECT app_id FROM applicant WHERE app_email= \""  + email +"\";");
			
			if (rs.next()) {
				id = rs.getInt("app_id");
				System.out.println("User Id: " + id);
			}
			
			
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery("select course_id from course where course_name = \""  + course +"\";");
			
			if(resultSet.next()) {
				course_id = resultSet.getInt(1);
						
			}
			
			// updating applicant profile String
			String query = "UPDATE applicant SET app_profile=?, app_name=?,app_email=?,location=?,app_resume=?,course_id=? WHERE app_id=?";
			PreparedStatement upstmt = conn.prepareStatement(query);
			if (inputStream != null) {
				upstmt.setBlob(1, inputStream);
			}
			upstmt.setString(2, name);
			upstmt.setString(3, email);
			upstmt.setString(4, location);
			if (rinputstream != null) {
				upstmt.setBlob(5, rinputstream);
			}
			upstmt.setInt(6, course_id);
			upstmt.setInt(7, id);
			System.out.println("update query: ");
			int row = upstmt.executeUpdate();
			if (row > 0) {
				System.out.println("Data updation Success");
				
				dispatcher = request.getRequestDispatcher("profile.jsp");
			}
			dispatcher.forward(request, response);

		} catch (Exception e) { // TODO Auto-generated catch block
			
			e.printStackTrace();
		}

	}

}
