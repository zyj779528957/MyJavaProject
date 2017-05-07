package com.entity;

/**
 * 新闻主题实体类
 * @author Aeyjie
 *
 */
public class Topic {
	
	Integer tid;	//新闻主题ID
	String  tname;  //新闻主题名
	
	//无参构造
	public Topic() {
		super();
	}
	//有参构造
	public Topic(Integer tid, String tname) {
		super();
		this.tid = tid;
		this.tname = tname;
	}
	
	//get、set方法
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	
	
	
}
