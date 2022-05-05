package com.example.registration;

import java.io.IOException;
import java.sql.Blob;
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

import com.example.dao.ApplicantDao;
import com.example.dao.CourseDao;
import com.example.dao.DBConnection;
import com.example.models.Applicant;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/registerApplicant")
public class StudentRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ApplicantDao applicantDao;
	private CourseDao courseDao;

	public StudentRegistration() {
		super();
		this.applicantDao = new ApplicantDao();
		this.courseDao = new CourseDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uname = request.getParameter("name");
		String uemail = request.getParameter("email");
		String upwd = request.getParameter("password");
		String ucourse = request.getParameter("course");
		String ulocation = null;
//		Blob profilePicture = null;
//		Blob resume = null;
		@SuppressWarnings("unused")
		int job_id = 0;
		int course_id = 0;

		System.out.println(uname);
		System.out.println(uemail);
		System.out.println(upwd);
		System.out.println(ucourse);
		try {

			course_id = courseDao.getCourseId(ucourse);

			Applicant applicant = new Applicant(uname, uemail, upwd, ulocation, course_id, job_id, null, null);

			int rowCount = applicantDao.insertApplicant(applicant);

			RequestDispatcher dispatcher = null;

			if (rowCount > 0) {
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("login.jsp");
			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("student_signup.jsp");
			}

			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
