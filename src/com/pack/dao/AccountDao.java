package com.pack.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pack.model.Account;

public class AccountDao {

	public int save(Account u) {
		int status = 0;
		try {
			Connection con = MyCon.getCon();
			PreparedStatement ps = con.prepareStatement(
					"insert into account_setup(account_number,corporate_id,account_name,branch,currency,available_balance,status)  values(?,?,?,?,?,?,?)");
			ps.setLong(2, u.getCorporateId());
			ps.setLong(1, u.getAccountNumber());
			ps.setString(3, u.getAccountName());
			ps.setString(4, u.getBranch());
			ps.setString(5, u.getCurrency());
			ps.setDouble(6, u.getAvailBal());
			ps.setString(7, "active");
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;

	}
	/*
	 * public int update(Account u){
	 * 
	 * int status=0; try{ Connection con=MySqlConn.getCon();
	 * 
	 * PreparedStatement ps=con.
	 * prepareStatement("update account_setup set account_number=?,account_name=?,branch=?,currency=?,available_balance=? where corporate_id=?"
	 * );
	 * System.out.println("corporate_id= "+u.getCorporate_id()+" "+u.getAccountName(
	 * )+" "+u.getBranch()); ps.setInt(6,u.getCorporate_id());
	 * ps.setString(1,u.getAccountNumber()); ps.setString(2,u.getAccountName());
	 * ps.setString(3,u.getBranch()); ps.setString(4,u.getCurrency());
	 * ps.setString(5,u.getAvailableBalance());
	 * 
	 * 
	 * status=ps.executeUpdate(); }catch(Exception e){System.out.println(e);} return
	 * status;
	 * 
	 * 
	 * }
	 */

	public int delete(int id) {
		int status = 0;
		try {
			Connection con = MyCon.getCon();
			PreparedStatement ps = con
					.prepareStatement("update account_setup set status='close' where account_number=?");
			ps.setLong(1, id);
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}

	public List<Account> getAllRecords() {
		List<Account> list = new ArrayList<Account>();

		try {
			Connection con = MyCon.getCon();
			PreparedStatement ps = con.prepareStatement("select * from account_setup");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Account u = new Account();
				u.setCorporateId(rs.getInt(1));
				u.setAccountNumber(rs.getLong(2));
				u.setAccountName(rs.getString(3));
				u.setBranch(rs.getString(4));
				u.setCurrency(rs.getString(5));
				u.setAvailBal(rs.getDouble(6));

				list.add(u);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public Account getRecordById(int corporate_id) {
		Account u = null;
		try {
			Connection con = MyCon.getCon();
			PreparedStatement ps = con.prepareStatement("select * from account_setup where corporate_id=?");
			ps.setInt(1, corporate_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u = new Account();
				u.setCorporateId(rs.getInt(2));
				u.setAccountNumber(rs.getLong(1));
				u.setAccountName(rs.getString(3));
				u.setBranch(rs.getString(4));
				u.setCurrency(rs.getString(5));
				u.setAvailBal(rs.getLong(6));

			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return u;
	}

	public Account getAccount(long id) {
		Connection con = null;
		Account u = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		con = MyCon.getCon();
		System.out.println(id + " " + " dao");
		try {
			stmt = con.prepareStatement("select * from account_setup where account_number=?");
			stmt.setLong(1, id);
			rs = stmt.executeQuery();

			if (rs.next()) {
				u = new Account();
				u.setCorporateId(rs.getLong(2));
				u.setAccountNumber(rs.getLong(1));
				u.setAccountName(rs.getString(3));
				u.setBranch(rs.getString(4));
				u.setCurrency(rs.getString(5));
				u.setAvailBal(rs.getDouble(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}
}
