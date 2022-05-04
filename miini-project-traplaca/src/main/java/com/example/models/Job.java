package com.example.models;

import java.sql.Date;

public class Job {
	private int id;
	private String title;
	private String desc;
	private Date post_date;
	private Date last_date;
	private String location;
	private int course_id;
	private int rec_id;
	
	public Job(int id, String title, String desc, Date post_date, Date last_date, String location, int course_id,
			int rec_id) {
		super();
		this.id = id;
		this.title = title;
		this.desc = desc;
		this.post_date = post_date;
		this.last_date = last_date;
		this.location = location;
		this.course_id = course_id;
		this.rec_id = rec_id;
	}
	
	public Job(String title, String desc, Date post_date, Date last_date, String location, int course_id, int rec_id) {
		super();
		this.title = title;
		this.desc = desc;
		this.post_date = post_date;
		this.last_date = last_date;
		this.location = location;
		this.course_id = course_id;
		this.rec_id = rec_id;
	}
	
	public Job(int id, String title, String desc, Date last_date) {
		super();
		this.id = id;
		this.title = title;
		this.desc = desc;
		this.last_date = last_date;
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Date getPost_date() {
		return post_date;
	}

	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}

	public Date getLast_date() {
		return last_date;
	}

	public void setLast_date(Date last_date) {
		this.last_date = last_date;
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

	public int getRec_id() {
		return rec_id;
	}

	public void setRec_id(int rec_id) {
		this.rec_id = rec_id;
	}
	
	
}
