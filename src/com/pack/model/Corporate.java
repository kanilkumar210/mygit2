package com.pack.model;

public class Corporate {
	private String CorporateName, Address, PhoneNumber, status;
	public int CorporateId;

	public Corporate(String corporateName, String address, String phoneNumber, String status, int corporateId) {
		super();
		CorporateName = corporateName;
		Address = address;
		PhoneNumber = phoneNumber;
		this.status = status;
		CorporateId = corporateId;
	}
	

	public Corporate() {
		super();
	}


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCorporateName() {
		return CorporateName;
	}

	public void setCorporateName(String corporateName) {
		this.CorporateName = corporateName;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		this.Address = address;
	}

	public String getPhoneNumber() {
		return PhoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.PhoneNumber = phoneNumber;
	}

	public int getCorporateId() {
		return CorporateId;
	}

	public void setCorporateId(int corporateId) {
		this.CorporateId = corporateId;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.CorporateName + " " + this.Address + " " + this.PhoneNumber;
	}
}
