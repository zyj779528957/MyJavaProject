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

public class AddTopicAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddTopicAction() {
		super();
		System.out.println("---AddTopicAction无参构造---");
		
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		System.out.println("---AddTopicAction-destroy----");
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
		System.out.println("---AddTopicAction-doGet---");
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

		System.out.println("---AddTopicAction-doPost---");
		
		//新增主题
		request.setCharacterEncoding("UTF-8");
		String tname = request.getParameter("tname");

		Topic t2 = new Topic();
		t2.setTname(tname);

		ITopicService ts = new TopicService();
		int num = ts.add(t2);

		if(num > 0){
			response.sendRedirect("TopicListAction");
		}else{
			request.setAttribute("addTopicError", "新增失败！");
			request.getRequestDispatcher("newspages/topic_add.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * Initialization of the servlet. 
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		System.out.println("---AddTopicAction-init----");
	}

}
