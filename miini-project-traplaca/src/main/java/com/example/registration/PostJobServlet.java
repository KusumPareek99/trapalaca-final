package com.example.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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
import javax.servlet.http.HttpSession;

import com.example.dbconnection.DBConnection;

/**
 * Servlet implementation class PostJobServlet
 */
@WebServlet("/postJob")
public class PostJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String desc	= request.getParameter("description");
		String course = request.getParameter("course");
		String location = request.getParameter("location");
		Date lastDate = Date.valueOf(request.getParameter("lastDate"));
		long millis=System.currentTimeMillis();  
        Date postDate= new Date(millis);
        int course_id= 0;
        int rec_id = 0;
        
        HttpSession httpSession = request.getSession();
        String email = httpSession.getAttribute("c_email").toString();
		
		System.out.println(title);
		System.out.println(desc);
		System.out.println(location);
		System.out.println(lastDate);
		System.out.println(postDate);
		System.out.println(course);
		System.out.println(email);
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = new DBConnection().getConnection();
			
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery("select course_id from course where course_name = \""  + course +"\";");
			
			if(resultSet.next()) {
				course_id = resultSet.getInt(1);					
			}
			
			ResultSet resultSet2 = statement.executeQuery("select rec_id from recruiter where rec_email = \"" + email + "\";");
			if(resultSet2.next()) {
				rec_id =  resultSet2.getInt(1);
			}
			
			PreparedStatement stmt = conn
					.prepareStatement("insert into job(job_title, job_desc, post_date, last_date, location, course_id, rec_id) values (?, ?, ?, ?, ?, ?, ?);");

			stmt.setString(1, title);
			stmt.setString(2, desc);
			stmt.setDate(3, postDate);
			stmt.setDate(4, lastDate);
			stmt.setString(5, location);
			stmt.setInt(6, course_id);
			stmt.setInt(7, rec_id);
			
			int rowCount = stmt.executeUpdate();
			
			RequestDispatcher dispatcher = null;
			
			if(rowCount > 0) {
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("job_post.jsp");
			}else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("job_post.jsp");
			}
			
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
