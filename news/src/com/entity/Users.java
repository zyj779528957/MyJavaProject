package com.entity;

/**
 * 用户实体类
 * @author Aeyjie
 *
 */
public class Users {
	
	private Integer usid; //用户ID
	private String uname; //用户名
	private String upwd; //用户密码
	
	//无参构造
	public Users() {
		super();
	}

	//有参构造
	public Users(Integer usid, String uname, String upwd) {
		super();
		//this();
		this.usid = usid;
		this.uname = uname;
		this.upwd = upwd;
	}

	//get、set方法
	public Integer getUsid() {
		return usid;
	}

	public void setUsid(Integer usid) {
		this.usid = usid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

}
