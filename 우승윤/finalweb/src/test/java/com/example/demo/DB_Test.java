package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class DB_Test {
	private static final String DRIVER = "org.mariadb.jdbc.Driver";
	private static final String URL = "jdbc:mariadb://34.64.46.27:3306/big16";
	private static final String USER = "root";
	private static final String PW = "Kny3229!";
	
	@Test
	public void testConnection() throws Exception {
		Class.forName(DRIVER);
		try (Connection con = DriverManager.getConnection(URL, USER, PW)){
			System.out.println(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}