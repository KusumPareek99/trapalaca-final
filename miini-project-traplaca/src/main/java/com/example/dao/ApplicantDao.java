package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.example.models.Applicant;

public class ApplicantDao {
	
	private static final String INSERT_SQL = "insert into applicant(app_name, app_email, app_password, location, course_id, job_id, app_profile, app_resume) values (?, ?, ?, ?, ?, ?, ?, ?);";
	private static final String SELECT_ALL = "select * from applicant;";
	private static final String SELECT_BY_EMAIL = "select * from applicant where app_email = ?";
	private static final String SELECT_BY_ID = "select * from applicant where app_id = ?";
	private static final String UPDATE_SQL = "update applicant set app_name = ?, app_email = ?, app_password = ?, location = ?, course_id = ?, job_id = ?, app_profile = ?, app_resume = ? where app_id = ?";
	private static final String DELETE_SQL = "delete from applicant where app_id = ?";
	
	public int insertApplicant(Applicant applicant) throws SQLException{
		int rowCount = 0;
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement stmt = conn.prepareStatement(INSERT_SQL);
			
			stmt.setString(1, applicant.getName());
			stmt.setString(2, applicant.getEmail());
			stmt.setString(3, applicant.getPassword());
			stmt.setString(4, applicant.getLocation());
			stmt.setInt(5, applicant.getCourse_id());
			stmt.setString(6, null);
			stmt.setBlob(7, applicant.getProfilePicture());
			stmt.setBlob(8, applicant.getResume());
			
			rowCount = stmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rowCount;
	}
}
