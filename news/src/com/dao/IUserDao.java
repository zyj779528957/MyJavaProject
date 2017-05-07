package com.dao;

import com.entity.Users;

/**
 * 数据层用户接口
 * @author Aeyjie
 *
 */
public interface IUserDao {
	
	/**
	 * 登录方法
	 * @param uname
	 * @param upwd
	 * @return
	 */
	public Users ifLogin(String uname, String upwd);

}
