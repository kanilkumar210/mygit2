package com.pack.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pack.model.Corporate;

public class CorporateDao {

	public int save(Corporate u) {
		int status = 0;
		try {
			Connection con = MyCon.getCon();
			PreparedStatement ps = con.prepareStatement(
					"insert into corporate_setup(corporate_name,address,phonenumber,status)  values(?,?,?,?)");

			ps.setString(1, u.getCorporateName());
			ps.setString(2, u.getAddress());
			ps.setString(3, u.getPhoneNumber());
			ps.setString(4, "active");
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;

	}

	public int update(Corporate u) {
		int status = 0;
		System.out.println(u + " Object in dao");
		try {
			Connection con = MyCon.getCon();

			PreparedStatement ps = con.prepareStatement(
					"update corporate_setup set corporate_name=?,address=?,phonenumber=? where corporate_id=?");
			ps.setInt(4, u.getCorporateId());
			ps.setString(1, u.getCorporateName());
			ps.setString(2, u.getAddress());
			ps.setString(3, u.getPhoneNumber());
			status = ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public int delete(int id) {
		int status = 0;
		try {
			Connection con = MyCon.getCon();
			PreparedStatement ps = con
					.prepareStatement("update  corporate_setup set status='close' where corporate_id=?");
			ps.setInt(1, id);
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}

	public List<Corporate> getAllRecords() {
		List<Corporate> list = new ArrayList<Corporate>();

		try {
			Connection con = MyCon.getCon();
			PreparedStatement ps = con.prepareStatement("select * from corporate_setup where status='active'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Corporate u = new Corporate();
				u.setCorporateId(rs.getInt("corporate_id"));
				u.setCorporateName(rs.getString("corporate_name"));
				u.setAddress(rs.getString("address"));
				u.setPhoneNumber(rs.getString("phonenumber"));
				list.add(u);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public Corporate getRecordByCorporateId(int corporate_id) {
		Corporate u = null;
		try {
			Connection con = MyCon.getCon();
			PreparedStatement ps = con.prepareStatement("select * from corporate_setup where corporate_id=?");
			ps.setInt(1, corporate_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u = new Corporate();
				u.setCorporateId(rs.getInt(1));
				u.setCorporateName(rs.getString(2));
				u.setAddress(rs.getString(3));
				u.setPhoneNumber(rs.getString(4));

			}
		} catch (Exception e) {
			System.out.println(e);
		}
//		System.out.println(u);
		return u;
	}
}
