package com.pack.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pack.model.Admin;
import com.pack.model.User;

public class LoginDao {

	public Admin getAdminByCredentials(String user, String pass) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Admin admin = null;
		System.out.println(user + " " + pass + " Dao");

		con = MyCon.getCon();
		try {
			stmt = con.prepareStatement("select * from login where username=? and password=?");
			stmt.setString(1, user);
			stmt.setString(2, pass);
			rs = stmt.executeQuery();
			if (rs.next()) {
				admin = new Admin(rs.getString(1), rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return admin;
	}

	public User getObjectByCredentials(String user, String pass) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		User userObj = null;
		try {
			con = MyCon.getCon();
			stmt = con.prepareStatement("select * from user where username=? and password=?");
			stmt.setString(1, user);
			stmt.setString(2, pass);
			rs = stmt.executeQuery();
			if (rs.next()) {
				userObj = new User(rs.getLong(1), rs.getLong(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getLong(6), rs.getString(7), rs.getString(8), rs.getString(9));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userObj;
	}

	public int addUser(User user) {
		Connection con = null;
		PreparedStatement stmt = null;
		int i = 0;
		con = MyCon.getCon();
		try {
			stmt = con.prepareStatement(
					"INSERT INTO `project`.`user` (`corporate_id`, `login_id`, `username`, `department`, `address`, `mobilenumber`, `password`,`status`,`activestatus`) VALUES (?,?,?,?,?,?,?,?,?);");
			stmt.setLong(1, user.getCorporate_id());
			stmt.setLong(2, user.getLogin_id());
			stmt.setString(3, user.getUsername());
			stmt.setString(4, user.getDepartment());
			stmt.setString(5, user.getAddress());
			stmt.setLong(6, user.getMobileNumber());
			stmt.setString(7, user.getPassword());
			stmt.setString(8, "F");
			stmt.setString(9, "active");
			i = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public String deleteUser(int id, int corId) {
		Connection con = null;
		PreparedStatement stmt = null;
		CallableStatement st = null;
		String corname = null;
		ResultSet rs = null;
		con = MyCon.getCon();
		try {
			st = con.prepareCall("update user set activestatus='close', status='F' where login_id=" + id);
			stmt = con.prepareStatement("select corporate_name from corporate_setup where corporate_id=" + corId);
			// stmt.setInt(1, id);
			st.executeUpdate();
			rs = stmt.executeQuery();
			if (rs.next())
				corname = rs.getString(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(corname + " Dao");
		return corname;
	}

	public User getUser(int id) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		User user = null;
		con = MyCon.getCon();
		try {
			stmt = con.prepareStatement("select * from user where login_id=?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				user = new User(rs.getLong(1), rs.getLong(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getLong(6), rs.getString(7), rs.getString(8), rs.getString(9));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	public int update(User user) {
		Connection con = null;
		PreparedStatement stmt = null;
		con = MyCon.getCon();
		int i = 0;
		try {
			stmt = con.prepareStatement("update user set department=?,address=?,mobilenumber=? where login_id=?");
			stmt.setString(1, user.getDepartment());
			stmt.setString(2, user.getAddress());
			stmt.setLong(3, user.getMobileNumber());
			stmt.setLong(4, user.getLogin_id());
			i = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public int resetPassword(User user) {
		Connection con = null;
		PreparedStatement stmt = null;
		int i = 0;
		con = MyCon.getCon();
		try {
			stmt = con.prepareStatement("update user set password=?,status=? where login_id=" + user.getLogin_id());

			stmt.setString(1, user.getPassword());
			stmt.setString(2, user.getStatus());
			i = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;

	}

	public String getCorName(long id) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		String corname = null;
		con = MyCon.getCon();
		try {
			stmt = con.prepareStatement("select corporate_name from corporate_setup where corporate_id=" + id);
			rs = stmt.executeQuery();
			if (rs.next())
				corname = rs.getString(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return corname;
	}

}
