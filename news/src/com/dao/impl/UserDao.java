package com.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dao.IUserDao;
import com.entity.Users;

/**
 * 数据层用户类
 * @author Aeyjie
 *
 */
public class UserDao extends BaseDao implements IUserDao {

	@Override
	public Users ifLogin(String uname, String upwd) {
		
		init(); //初始化
		Users u2 = null; //声明用户对象
		
		String sql = "select * from news_users where uname=? and upwd=?";
		
		try {
			PreparedStatement prestmt = conn.prepareStatement(sql);
			prestmt.setString(1, uname);
			prestmt.setString(2, upwd);
			
			ResultSet rs = prestmt.executeQuery();
			
			while(rs.next()){
				
				u2 = new Users();
				
				u2.setUsid(rs.getInt("usid"));
				u2.setUname(rs.getString("uname"));
				u2.setUpwd(rs.getString("upwd"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(); //关闭连接
		return u2;
	}

}
