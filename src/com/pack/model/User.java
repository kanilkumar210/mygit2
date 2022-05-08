package com.pack.model;

public class User {
	private long corporate_id;
	private long login_id;
	private String username;
	private String department;
	private String address;
	private long mobileNumber;
	private String password;
	private String status;
	private String activestatus;

	public User(long corporate_id, long login_id, String username, String department, String address, long mobileNumber,
			String password, String status, String activestatus) {
		super();
		this.corporate_id = corporate_id;
		this.login_id = login_id;
		this.username = username;
		this.department = department;
		this.address = address;
		this.mobileNumber = mobileNumber;
		this.password = password;
		this.status = status;
		this.activestatus = activestatus;
	}

	public String getActivestatus() {
		return activestatus;
	}

	public void setActivestatus(String activestatus) {
		this.activestatus = activestatus;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public User() {
		super();
	}

	public long getCorporate_id() {
		return corporate_id;
	}

	public void setCorporate_id(long corporate_id) {
		this.corporate_id = corporate_id;
	}

	public long getLogin_id() {
		return login_id;
	}

	public void setLogin_id(long login_id) {
		this.login_id = login_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public long getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(long mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.username + " " + this.password + "" + this.address + " " + this.status + " " + this.department;

	}
}
