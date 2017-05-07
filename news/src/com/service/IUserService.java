package com.service;

import com.entity.Users;

/**
 * 业务层用户接口
 * @author Aeyjie
 *
 */
public interface IUserService {

	/**
	 * 登录方法
	 * @param uname
	 * @param upwd
	 * @return
	 */
	public Users ifLogin(String uname, String upwd);
	
	
}
