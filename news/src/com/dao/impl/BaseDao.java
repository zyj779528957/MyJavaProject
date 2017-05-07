package com.dao.impl;

import java.sql.Connection;
import java.util.Collection;

/**
 * 数据层公共类
 * @author Aeyjie
 *
 */
public class BaseDao {

	protected Connection conn = null;
	
	/**
	 * 初始化Jdbc(即得到连接)
	 */
	protected void init(){
		conn = JdbcUtil.getConn();
	}
	
	/**
	 * 关闭连接
	 */
	protected void close(){
		JdbcUtil.closeConn();
	}
	

}