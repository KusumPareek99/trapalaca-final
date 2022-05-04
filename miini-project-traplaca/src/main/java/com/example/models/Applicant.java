package com.example.models;

import java.sql.Blob;

public class Applicant {
	private int id;
	private String name;
	private String email;
	private String password;
	private String location;
	private int course_id;
	private int job_id;
	private Blob profilePicture;
	private Blob resume;
		
	public Applicant(String name, String email, String password, String location, int course_id, int job_id,
			Blob profilePicture, Blob resume) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.location = location;
		this.course_id = course_id;
		this.job_id = job_id;
		this.profilePicture = profilePicture;
		this.resume = resume;
	}

	public Applicant(int id, String name, String email, String password, String location, int course_id, int job_id,
			Blob profilePicture, Blob resume) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.location = location;
		this.course_id = course_id;
		this.job_id = job_id;
		this.profilePicture = profilePicture;
		this.resume = resume;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	public int getJob_id() {
		return job_id;
	}
	public void setJob_id(int job_id) {
		this.job_id = job_id;
	}
	public Blob getProfilePicture() {
		return profilePicture;
	}
	public void setProfilePicture(Blob profilePicture) {
		this.profilePicture = profilePicture;
	}
	public Blob getResume() {
		return resume;
	}
	public void setResume(Blob resume) {
		this.resume = resume;
	}
	
	
}
