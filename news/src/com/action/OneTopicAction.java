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

public class OneTopicAction extends HttpServlet {

	/**
	 * 无参构造
	 */
	public OneTopicAction() {
		super();
		System.out.println("---OneTopicAction无参构造---");
	}

	/**
	* servlet的destroy方法
	* 销毁servlet
	*/
	public void destroy() {
		super.destroy(); //在日志中放置“destroy”字符串
		System.out.println("---OneTopicAction-destroy方法---");
	}


	/**
		* servlet的doGet方法
		*
		*当表单的标签值方法等于get时，调用此方法。
		*
		* @param请求 客户端发送给服务器的请求
		* @param响应 服务器发送给客户端的响应
		* @throws ServletException 如果发生错误
		* @throws IOException 如果发生错误
		*/
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("---OneTopicAction-doGet方法---");
		doPost(request, response);
		
	}


	/**
		* servlet的doPost方法
		*
		* 当表单的标签值方法等于post时，调用此方法。
		*
		* @param请求 客户端发送给服务器的请求
		* @param响应 服务器发送给客户端的响应
		* @throws ServletException 如果发生错误
		* @throws IOException 如果发生错误
		*/
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("---OneTopicAction-doPost方法---");
		
		String tids = request.getParameter("tid");
		int tid = 0;
		try{
			tid = Integer.parseInt(tids);
		}catch(Exception e){
			tid = 0;
		}

		ITopicService ts = new TopicService();
		Topic oldTopic = ts.getOne(tid); //原有的主题
		
		if (oldTopic != null) {
			request.setAttribute("oldTopic", oldTopic);
			request.getRequestDispatcher("newspages/topic_modify.jsp").forward(request, response);
		} else {
			request.setAttribute("OneTopicError", "原有主题对象失败！");
			response.sendRedirect("TopicListAction");
		}
		
		
	}

	/**
	 * servlet的init方法
	 * 
	 * 初始化servlet
	 *  @throws ServletException 如果发生错误ServletException
	 */
	public void init() throws ServletException {
		
		System.out.println("---OneTopicAction-init方法---");
		
	}

}
