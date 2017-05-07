package com.entity;

import java.util.Date;

public class Comments {

	private Integer cid; //评论ID
	private Integer cnid; //评论的新闻ID
	private String  ccontent; //评论内容
	private Date    cdate; //评论时间（年-月-日  时:分:秒）
	private String  cip; //评论IP
	private String  cauthor; //评论者
	
	//无参构造
	public Comments() {
		super();
	}
	//有参构造
	public Comments(Integer cid, Integer cnid, String ccontent, Date cdate, String cip, String cauthor) {
		super();
		this.cid = cid;
		this.cnid = cnid;
		this.ccontent = ccontent;
		this.cdate = cdate;
		this.cip = cip;
		this.cauthor = cauthor;
	}

	//get、set方法
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getCnid() {
		return cnid;
	}
	public void setCnid(Integer cnid) {
		this.cnid = cnid;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public String getCip() {
		return cip;
	}
	public void setCip(String cip) {
		this.cip = cip;
	}
	public String getCauthor() {
		return cauthor;
	}
	public void setCauthor(String cauthor) {
		this.cauthor = cauthor;
	}
	

}
