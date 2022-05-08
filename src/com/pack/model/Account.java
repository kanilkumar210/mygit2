package com.pack.model;

//Account Entity
public class Account {

	private long accountNumber;
	private long corporateId;
	private String accountName;
	private String branch;
	private String currency;
	private double availBal;
	private String status;

	public Account(long accountNumber, long corporateId, String accountName, String branch, String currency,
			double availBal, String status) {
		super();
		this.accountNumber = accountNumber;
		this.corporateId = corporateId;
		this.accountName = accountName;
		this.branch = branch;
		this.currency = currency;
		this.availBal = availBal;
		this.status = status;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Account(long accountNumber, long corporateId, String accountName, String branch, String currency,
			double availBal) {
		super();
		this.accountNumber = accountNumber;
		this.corporateId = corporateId;
		this.accountName = accountName;
		this.branch = branch;
		this.currency = currency;
		this.availBal = availBal;
	}

	public long getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(long accountNumber) {
		this.accountNumber = accountNumber;
	}

	public long getCorporateId() {
		return corporateId;
	}

	public void setCorporateId(long corporateId) {
		this.corporateId = corporateId;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public double getAvailBal() {
		return availBal;
	}

	public void setAvailBal(double availBal) {
		this.availBal = availBal;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.corporateId + " " + this.accountName + " " + this.accountNumber;
	}

	public Account() {
		super();
	}

}
