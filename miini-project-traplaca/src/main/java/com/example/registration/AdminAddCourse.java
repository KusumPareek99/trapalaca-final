package com.example.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.dao.CourseDao;
import com.example.models.Course;

/**
 * Servlet implementation class AdminAddCourse
 */
@WebServlet("/AdminAddCourse")
public class AdminAddCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CourseDao courseDao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddCourse() {
        this.courseDao = new CourseDao();
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String desc = request.getParameter("desc");
		
		try {
			
			Course course = new Course(name, desc);

			int rowCount = courseDao.insertCourse(course);
			
			RequestDispatcher dispatcher = null;
			
			if(rowCount > 0) {
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("admin_add_course.jsp");
			}else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("admin_add_course.jsp");
			}
			
			dispatcher.forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
