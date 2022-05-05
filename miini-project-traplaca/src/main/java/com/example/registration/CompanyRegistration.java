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

import com.example.dao.DBConnection;
import com.example.dao.RecruiterDao;
import com.example.models.Recruiter;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/registerRecruiter")
public class CompanyRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private RecruiterDao recruiterDao;
	
	
	public CompanyRegistration() {
		this.recruiterDao = new RecruiterDao();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String contact = request.getParameter("contact");
		String address = request.getParameter("address");
		String desc = request.getParameter("description");
		
		
		try {
			
			Recruiter recruiter = new Recruiter(name, email, password, desc, address, contact);
			int rowCount = recruiterDao.insertRecruiter(recruiter);
			
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
