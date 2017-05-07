package com.service.impl;

import com.dao.IUserDao;
import com.dao.impl.UserDao;
import com.entity.Users;
import com.service.IUserService;

public class UserService implements IUserService {

	private IUserDao dao = new UserDao(); //new一个数据层用户对象，并私有化
	
	@Override
	public Users ifLogin(String uname, String upwd) {
		return dao.ifLogin(uname, upwd);
	}

	
}
