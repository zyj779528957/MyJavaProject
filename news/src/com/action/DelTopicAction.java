package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import com.entity.*;
import com.service.*;
import com.service.impl.*;


public class DelTopicAction extends HttpServlet {

	/**
	 * 无参构造
	 */
	public DelTopicAction() {
		super();
		System.out.println("---DelTopicAction无参构造---");
		
	}

	/**
	 * destory方法
	 */
	public void destroy() {
		super.destroy();
		System.out.println("---DelTopicAction-destroy---");
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
		
		String tids = request.getParameter("tid");
		int tid = 0;
		try{
			tid = Integer.parseInt(tids);
		}catch(Exception e){
			tid = 0;
		}

		ITopicService ts = new TopicService();
		int num = ts.delete(tid);
		

		if(num > 0){
			response.sendRedirect("TopicListAction");
		}else{
			request.setAttribute("DelTopicError", " 删除失败！");
			response.sendRedirect("TopicListAction");
			request.getRequestDispatcher("TopicListAction").forward(request, response);
		}
		
		
	}

	/**
	 * init方法
	 */
	public void init() throws ServletException {
		System.out.println("---DelTopicAction-init---");
	}

}
