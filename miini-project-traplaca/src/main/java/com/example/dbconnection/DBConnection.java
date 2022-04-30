package com.example.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	Connection conn = null;
	
	public Connection getConnection() {
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/traplaca?allowPublicKeyRetrieval=true&useSSL=false", "root",
				"123456");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	 

}
