package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;

import com.common.Page;
import com.entity.*;
import com.service.*;
import com.service.impl.*;


public class TopicListAction extends HttpServlet {

	/**
	 * 无参构造
	 */
	public TopicListAction() {
		super();
		System.out.println("---TopicListAction无参构造---");
	}


	/**
	* servlet的destroy方法
	* 销毁servlet
	*/
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		//调试
		System.out.println("---TopicListAction-destroy方法---");
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
		
		//调试
		System.out.println("---TopicListAction-doGet方法---");
		
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

		//调试
		System.out.println("---TopicListAction-doPost方法---");
		
		Page page = new Page();
		
		int pageNo = page.getPageNo();
		int pageSize = page.getPageSize();
		
		if(request.getParameter("pageNo") != null){
			try {
				pageNo = Integer.parseInt(request.getParameter("pageNo"));	
			} catch (Exception e) {
				pageNo = page.getPageNo();
			}
		}
		if(request.getParameter("pageSize") != null){
			pageSize = Integer.parseInt(request.getParameter("pageSize"));
		}
		
		//从数据库取数据
		ITopicService ts = new TopicService();
		page = ts.getPage(pageNo, pageSize, page);
		
		request.setAttribute("pageNo", page.getPageNo());
		request.setAttribute("pageSize", page.getPageSize());
		request.setAttribute("totalPageCount", page.getTotalPageCount());
		request.setAttribute("list", page.getPageList());
		
		System.out.println("---TopicListAction---totalPageCount:"+page.getTotalPageCount());

		
		request.getRequestDispatcher("newspages/topic_list.jsp").forward(request, response);
	}

	/**
	 * servlet的init方法
	 * 
	 * 初始化servlet
	 *  @throws ServletException 如果发生错误ServletException
	 */
	public void init() throws ServletException {
		//调试
		System.out.println("---TopicListAction-init方法---");
	}

}
