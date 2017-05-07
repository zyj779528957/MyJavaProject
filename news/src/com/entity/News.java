package com.entity;

import java.util.Date;

public class News {
	
	Integer nid; //新闻ID
	Integer ntid; //新闻主题
	String ntitle; //新闻标题
	String nauthor; //新闻作者
	Date ncreatedate; //新闻创建时间
	String npicpath; //新闻图片路径
	String ncontent; //新闻内容
	Date nmodifydate; //新闻修改时间
	String nsummary; //新闻摘要
	
	//无参构造
	public News() {
		super();
	}
	//有参构造
	public News(Integer nid, Integer ntid, String ntitle, String nauthor, Date ncreatedate, String npicpath,
String ncontent, Date nmodifydate, String nsummary) {
		super();
		this.nid = nid;
		this.ntid = ntid;
		this.ntitle = ntitle;
		this.nauthor = nauthor;
		this.ncreatedate = ncreatedate;
		this.npicpath = npicpath;
		this.ncontent = ncontent;
		this.nmodifydate = nmodifydate;
		this.nsummary = nsummary;
	}
	
   //get、set方法
	public Integer getNid() {
		return nid;
	}
	public void setNid(Integer nid) {
		this.nid = nid;
	}
	public Integer getNtid() {
		return ntid;
	}
	public void setNtid(Integer ntid) {
		this.ntid = ntid;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNauthor() {
		return nauthor;
	}
	public void setNauthor(String nauthor) {
		this.nauthor = nauthor;
	}
	public Date getNcreatedate() {
		return ncreatedate;
	}
	public void setNcreatedate(Date ncreatedate) {
		this.ncreatedate = ncreatedate;
	}
	public String getNpicpath() {
		return npicpath;
	}
	public void setNpicpath(String npicpath) {
		this.npicpath = npicpath;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public Date getNmodifydate() {
		return nmodifydate;
	}
	public void setNmodifydate(Date nmodifydate) {
		this.nmodifydate = nmodifydate;
	}
	public String getNsummary() {
		return nsummary;
	}
	public void setNsummary(String nsummary) {
		this.nsummary = nsummary;
	}
	
	
}
