package com.example.registration;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.dao.RecruiterDao;

@WebServlet("/DeleteRecruiter")
public class DeleteRecruiter extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private RecruiterDao recruiterDao;

	public DeleteRecruiter() {
		this.recruiterDao = new RecruiterDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String rec_id = request.getParameter("rec_id");

		try {

			RequestDispatcher dispatcher = null;

			boolean isDeleted = recruiterDao.deleteRecruiter(Integer.valueOf(rec_id));

			if (isDeleted) {
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("admin_home.jsp");
			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("company_signup.jsp");
			}

			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
