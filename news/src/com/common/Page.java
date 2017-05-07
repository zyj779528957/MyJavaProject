package com.common;

import java.util.List;

public class Page {

	private int pageNo = 1; //当前页码号
	private int pageSize = 5; //每页容量
	private int totalCount = 0; //总记录数
	private int totalPageCount; //总页数
	private List pageList;
	
	//无参构造
	public Page() {
		super();
	}
	
	//有参构造
	public Page(int pageNo, int pageSize, int totalCount, int totalPageCount, List pageList) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.totalPageCount = totalPageCount;
		this.pageList = pageList;
	}

	//get、set方法
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		if (pageNo < 1) {
			this.pageNo  = 1;
		} else if(pageNo > totalPageCount) {
			this.pageNo  = totalPageCount;
		}else{
			this.pageNo = pageNo;
		}
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		this.totalPageCount = totalCount/pageSize+(totalCount%pageSize==0?0:1);
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public List getPageList() {
		return pageList;
	}

	public void setPageList(List pageList) {
		this.pageList = pageList;
	}

	
	
}
