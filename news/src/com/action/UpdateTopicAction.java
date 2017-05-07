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

public class UpdateTopicAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateTopicAction() {
		super();
		System.out.println("---UpdateTopicAction无参构造---");
	}

	/**
	* Destruction of the servlet. <br>
	*/
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		System.out.println("---UpdateTopicAction-destroy方法---");
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
		
		System.out.println("---UpdateTopicAction-doGet方法---");
		
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("---UpdateTopicAction-doPost方法---");
		
		//新增主题
		request.setCharacterEncoding("UTF-8"); //处理乱码(当上一页面的form表单提交至本页面的value值含中文时才需要，处理乱码)
		String tname = request.getParameter("tname");
		String tids = request.getParameter("tid");

		int tid = 0;
		try{
			tid = Integer.parseInt(tids);
		}catch(Exception e){
			tid = 0;
		}

		Topic t2 = new Topic();
		t2.setTname(tname);
		t2.setTid(tid);

		ITopicService ts = new TopicService();
		int num = ts.update(t2);

		if(num > 0){
			response.sendRedirect("TopicListAction");
		}else{
			request.setAttribute("UpdateTopicError", "修改失败！");
			request.getRequestDispatcher("newspages/topic_modify.jsp").forward(request, response);
		}

		
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		
		System.out.println("---UpdateTopicAction-init方法---");
	}
	

}
