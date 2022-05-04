package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.example.models.Course;


public class CourseDao {
	
	private static final String INSERT_SQL = "insert into course(course_name, course_desc) values (?, ?);";
	private static final String SELECT_ALL = "select * from course;";
	private static final String SELECT_BY_ID = "select * from course where course_id = ?";
	private static final String UPDATE_SQL = "update course set course_name = ?, course_desc = ? where course_id = ?";
	private static final String DELETE_SQL = "delete from course where course_id = ?";
	
	public int insertCourse(Course course) throws SQLException{
		int rowInserted = 0;
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement stmt = conn.prepareStatement(INSERT_SQL);
			
			stmt.setString(1, course.getName());
			stmt.setString(2, course.getDesc());
			
			rowInserted = stmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return rowInserted;

	}
}
