package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.models.Recruiter;

public class RecruiterDao {
	
	private static final String INSERT_SQL = "insert into recruiter(rec_name, rec_email, rec_password, rec_desc, rec_address, rec_contact) values (?, ?, ?, ?, ?, ?);";
	private static final String SELECT_ALL = "select * from recruiter;";
	private static final String SELECT_BY_EMAIL = "select * from recruiter where rec_email = ?";
	private static final String UPDATE_SQL = "update recruiter set rec_name = ?, rec_email = ?, rec_desc = ?, rec_address = ?, rec_contact = ? where rec_id = ?";
	private static final String DELETE_SQL = "delete from recruiter where rec_id = ?";
	
	// insert recruiter
	public int insertRecruiter(Recruiter recruiter) throws SQLException{
		int rowCount = 0;
		try {
			
			Connection conn = new DBConnection().getConnection();
			PreparedStatement stmt = conn.prepareStatement(INSERT_SQL);
			
			stmt.setString(1, recruiter.getName());
			stmt.setString(2, recruiter.getEmail());
			stmt.setString(3, recruiter.getPassword());
			stmt.setString(4, recruiter.getDesc());
			stmt.setString(5, recruiter.getAddress());	
			stmt.setString(6, recruiter.getContact());
			
			rowCount = stmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return rowCount;
	}
	
	// get recruiter
	public Recruiter getRecruiterByEmail(String uemail) {
		Recruiter recruiter = null;
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement stmt = conn.prepareStatement(SELECT_BY_EMAIL);
			stmt.setString(1, uemail);
			
			ResultSet resultSet = stmt.executeQuery();
			
			while(resultSet.next()) {
				int id = resultSet.getInt("rec_id");
				String name = resultSet.getString("rec_name");
				String email = resultSet.getString("rec_email");
				String password = resultSet.getString("rec_password");
				String desc = resultSet.getString("rec_desc");
				String address = resultSet.getString("rec_address");
				String contact = resultSet.getString("rec_contact");
				
				recruiter = new Recruiter(id, name, email, password, desc, address, contact);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return recruiter;
	}
	
   // update user
	public boolean updateRecruiter(Recruiter recruiter) throws SQLException{
		boolean rowUpdated = false;
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement stmt = conn.prepareStatement(UPDATE_SQL);
			stmt.setString(1, recruiter.getName());
			stmt.setString(2, recruiter.getEmail());
			stmt.setString(3, recruiter.getDesc());
			stmt.setString(4, recruiter.getAddress());
			stmt.setString(5, recruiter.getContact());
			stmt.setInt(6, recruiter.getId());
			
			rowUpdated = stmt.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rowUpdated;
	}
	
	
	
//  delete user
	
	public boolean deleteRecruiter(int id) {
		boolean rowDeleted = false;
		
		try {
			Connection conn	= new DBConnection().getConnection();
			PreparedStatement stmt = conn.prepareStatement(DELETE_SQL);
			stmt.setInt(1, id);
			rowDeleted = stmt.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rowDeleted;
	}

}
