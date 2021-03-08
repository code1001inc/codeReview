package com.example.demo.model;

public class UserProfile {
	private String id;
	private String grade;
	private String name;
	private String phone;
	
	public UserProfile(String id, String grade, String name, String phone) {
		super();
		this.id = id;
		this.grade = grade;
		this.name = name;
		this.phone = phone;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
}
