package com.example.models;

public class Recruiter {
	private int id;
	private String name;
	private String email;
	private String password;
	private String desc;
	private String address;
	private String contact;

	public Recruiter(int id, String name, String email, String password, String desc, String address, String contact) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.desc = desc;
		this.address = address;
		this.contact = contact;
	}

	public Recruiter(String name, String email, String password, String desc, String address, String contact) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.desc = desc;
		this.address = address;
		this.contact = contact;
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

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	@Override
	public String toString() {
		return "Recruiter [id=" + id + ", name=" + name + ", email=" + email + "]";
	}

}
