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
import javax.servlet.http.HttpSession;

import com.example.dao.DBConnection;
import com.example.dao.RecruiterDao;
import com.example.models.Recruiter;

/**
 * Servlet implementation class CompanyProfile
 */
@WebServlet("/CompanyProfile")

public class CompanyProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private RecruiterDao recruiterDao;
	
	
	public CompanyProfile() {
		this.recruiterDao = new RecruiterDao();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("user");
		String desc = request.getParameter("aboutCom");
		String address = request.getParameter("address");
		String email = request.getParameter("mail");
		String contact = request.getParameter("contact");
		
		HttpSession session = request.getSession();

		System.out.println(session.getAttribute("c_email"));

		RequestDispatcher dispatcher=null;
		try {
			
			Recruiter recruiter = recruiterDao.getRecruiterByEmail((String) session.getAttribute("c_email"));
			Recruiter updatedRec = new Recruiter(recruiter.getId(), name, email, recruiter.getPassword(), desc, address, contact);
			
			System.out.println(recruiter);
			System.out.println(updatedRec);
			
			boolean didUpdate = recruiterDao.updateRecruiter(updatedRec);
			if (didUpdate) {
				System.out.println("Data updation Success");
				dispatcher = request.getRequestDispatcher("company_profile.jsp");
			}
			
			session.setAttribute("c_email", email);
			dispatcher.forward(request, response);
		}
		catch(Exception e) {
			
		}
	}
	

}
