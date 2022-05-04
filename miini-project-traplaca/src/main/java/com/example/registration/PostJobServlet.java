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

import com.example.dao.CourseDao;
import com.example.dao.DBConnection;
import com.example.dao.JobDao;
import com.example.dao.RecruiterDao;
import com.example.models.Job;
import com.example.models.Recruiter;

/**
 * Servlet implementation class PostJobServlet
 */
@WebServlet("/postJob")
public class PostJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private RecruiterDao recruiterDao = null;
	private CourseDao courseDao = null;
	private JobDao jobDao = null;

	public PostJobServlet() {
		this.recruiterDao = new RecruiterDao();
		this.courseDao = new CourseDao();
		this.jobDao = new JobDao();
	}



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
	

		try {
				
			course_id = courseDao.getCourseId(course);
			
			rec_id = recruiterDao.getRecruiterByEmail(email).getId();
			
			Job job = new Job(title, desc, postDate, lastDate, location, course_id, rec_id);
			
						
			int rowCount = jobDao.insertJob(job);
			
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
