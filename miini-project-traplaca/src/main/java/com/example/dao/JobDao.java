package com.example.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.models.Job;


public class JobDao {
	private static final String INSERT_SQL = "insert into job(job_title, job_desc, post_date, last_date, location, course_id, rec_id) values (?, ?, ?, ?, ?, ?, ?);";
	private static final String SELECT_ALL = "select * from job;";
	private static final String SELECT_BY_ID = "select * from job where job_id = ?;";
	private static final String UPDATE_SQL = "update job set job_title = ?, job_desc = ?, last_date = ? where job_id = ?;";
	private static final String DELETE_SQL = "delete from job where job_id = ?;";
	
	
	public int insertJob(Job job) throws SQLException{
		int rowInserted = 0;
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement stmt = conn.prepareStatement(INSERT_SQL);
			
			stmt.setString(1, job.getTitle());
			stmt.setString(2, job.getDesc());
			stmt.setDate(3, job.getPost_date());
			stmt.setDate(4, job.getLast_date());
			stmt.setString(5, job.getLocation());
			stmt.setInt(6, job.getCourse_id());
			stmt.setInt(7, job.getRec_id());
						
			
			rowInserted = stmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return rowInserted;

	}
	
	// Get job by ID 
	public Job getJobById(int job_id) {
		Job job = null;
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);
			stmt.setInt(1, job_id);
			
			ResultSet resultSet = stmt.executeQuery();
			
			while(resultSet.next()) {
				int id = resultSet.getInt("job_id");
				String job_title = resultSet.getString("job_title");
				String job_desc = resultSet.getString("job_desc");
				Date post_date = resultSet.getDate("post_date");
				Date last_date = resultSet.getDate("last_date");
				String location = resultSet.getString("location");
				int course_id = resultSet.getInt("course_id");
				int rec_id = resultSet.getInt("rec_id");
				job = new Job(id, job_title,job_desc,post_date,last_date,location,course_id,rec_id);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return job;
	}
	
	//Edit Job Details
	public boolean updateJob(Job job) throws SQLException{
		boolean rowUpdated = false;
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement stmt = conn.prepareStatement(UPDATE_SQL);
			stmt.setString(1, job.getTitle());
			stmt.setString(2, job.getDesc());
			stmt.setDate(3, job.getLast_date());
			stmt.setInt(4, job.getId());
			
			rowUpdated = stmt.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rowUpdated;
	}
}
