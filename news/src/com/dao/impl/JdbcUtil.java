package com.dao.impl;

import oracle.jdbc.driver.OracleDriver; //此包可不导
import java.sql.*;

/**
 * Jdbc工具类
 * @author Aeyjie
 *
 */
public class JdbcUtil {

	private static String Driver = "oracle.jdbc.driver.OracleDriver";
	private static String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static String USER = "news";
	private static String PWD = "123456";

	private static Connection conn = null;

	/**
	 * 得到连接
	 * @return conn
	 */
	public static Connection getConn() {
		if(conn == null){
			try {
				Class.forName(Driver); //加载驱动
				conn = DriverManager.getConnection(URL,USER,PWD); //得到连接
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return conn;
	}

	/**
	 * 关闭连接
	 */
	public static void closeConn(){
		if(conn != null){
			try {
				conn.close();
				conn = null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	
}