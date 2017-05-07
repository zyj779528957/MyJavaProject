package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.INewsService;
import com.service.impl.NewsService;

public class DelNewsAction extends HttpServlet {

	/**
	 * 无参构造
	 */
	public DelNewsAction() {
		super();
		System.out.println("---DelTopicAction无参构造---");
	}

	/**
	 * destory方法
	 */
	public void destroy() {
		super.destroy(); 
		System.out.println("---DelTopicAction无参构造---");

	}

	/**
	 * doGet方法
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("---DelTopicAction-doGet---");
		doPost(request, response);

	}

	/**
	 * doPost方法
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("---DelTopicAction-doPost---");
		
		String nids = request.getParameter("nid");
		int nid = 0;
		try{
			nid = Integer.parseInt(nids);
		}catch(Exception e){
			nid = 0;
		}

		INewsService ns = new NewsService();

		ns.delete(nid);
		response.sendRedirect("AdminAction");
		//调试
		System.out.println("delNews-nid:"+nid);
	}


	/**
	 * init方法
	 */
	public void init() throws ServletException {
		System.out.println("---DelTopicAction-init---");
	}

}
