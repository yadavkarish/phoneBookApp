package com.android.entity;

public class Contact {

	private int id;
	private String name;
	private String email;
	private String phoneNo;
	private String about;
	private int userId;

	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Contact(int id, String name, String email, String phoneNo, String about, int userId) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phoneNo = phoneNo;
		this.about = about;
		this.userId = userId;
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

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Contact [id=" + id + ", name=" + name + ", email=" + email + ", phoneNo=" + phoneNo + ", about=" + about
				+ ", userId=" + userId + "]";
	}

}
