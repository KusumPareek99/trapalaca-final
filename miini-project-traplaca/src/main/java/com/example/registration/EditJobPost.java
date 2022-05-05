package com.example.registration;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.dao.JobDao;

import com.example.models.Job;

/**
 * Servlet implementation class EditJobPost
 */
@WebServlet("/EditJobPost")
public class EditJobPost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private JobDao jobDao;

	public EditJobPost() {

		this.jobDao = new JobDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("job_id");
		String title = request.getParameter("job_title");
		String desc = request.getParameter("job_desc");
		String date = request.getParameter("last_date");

		int job_id = Integer.parseInt(id);

		Date last_date = Date.valueOf(date);
		try {

			RequestDispatcher dispatcher = null;

			Job job = new Job(job_id, title, desc, last_date);

			boolean isUpdated = jobDao.updateJob(job);

			if (isUpdated) {
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("job_post.jsp");
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
