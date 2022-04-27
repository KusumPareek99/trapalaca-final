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

/**
 * Servlet implementation class AdminInsertData
 */
@WebServlet("/AdminInsertData")
public class AdminInsertData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type= request.getParameter("type");
		String title = request.getParameter("title");
		String link = request.getParameter("link");
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/traplaca?useSSL=false", "root", "123456");
			
			PreparedStatement ins = conn.prepareStatement("INSERT INTO career_training (type,links,title) VALUES (?,?,?);");
			
			ins.setString(1, type);
			ins.setString(2, link);
			ins.setString(3, title);
			

			int rowCount = ins.executeUpdate();
			
			RequestDispatcher dispatcher = null;
			
			if(rowCount > 0) {
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("admin_add_data.jsp");
			}else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("admin_add_data.jsp");
			}
			
			dispatcher.forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
