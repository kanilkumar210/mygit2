package com.pack.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyCon {

	public static Connection getCon() {
		Connection c = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			if (c == null) {
				c = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Anilkarre8@");

			}

		}

		catch (Exception e) {
			System.out.println(e);
		}
		return c;

	}
}
