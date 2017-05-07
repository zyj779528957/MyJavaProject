package com.action;

import java.io.IOException;
import java.io.PrintWriter;



import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import com.entity.*;
import com.service.*;
import com.service.impl.*;


public class LoginAction extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public LoginAction() {
		super();
		System.out.println("---LoginAction无参构造---");
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		//调试
		System.out.println("---LoginAction-destroy方法---");
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

		//调试
		System.out.println("---LoginAction-doGet方法---");
		
		doPost(request, response);
		
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
		
		//调试
		System.out.println("---LoginAction-doPost方法---");
		
		//上页表单 为post提交方式时：设置页面所接收的request的字符编码
		request.setCharacterEncoding("UTF-8"); //或：request.setCharacterEncoding("GBK);
		
		//通过request得到文本框中键入的uname与upwd
		String uname = request.getParameter("uname");
		String upwd = request.getParameter("upwd");
		
		//new一个业务层实现类用户对象
		IUserService us = new UserService();
		
		//调用业务层实现类的：登录方法
		Users u2 = us.ifLogin(uname, upwd);
		
		//注：一般：目录不同用重定向，目录相同用转发
		if(u2 != null){ //登录成功
			
			//写入cookie
			String times = request.getParameter("times");
			System.out.println("----times:"+times);
			if (times != null) {
				int time = Integer.parseInt(times);
				
				//加密中文
				uname = AppUtil.encode(uname);
				
				Cookie c1 = new Cookie("uname", uname);
				c1.setMaxAge(time * 3600);
				Cookie c2 = new Cookie("upwd", upwd);
				
				response.addCookie(c1);
				response.addCookie(c2);
			}
			
			//把用户信息放session
			request.getSession().setAttribute("userInfo", u2);
		
			//自动跳转：重定向(多用于不同目录，不同业务)
			response.sendRedirect("AdminAction"); 
			//request.getRequestDispatcher("/newspages/admin.jsp").forward(request, response);			 
		}else{ //登录失败
			//自动跳转：转发(多用于同一目录下的页面间跳转)
			request.setAttribute("errorInfo", "用户名或密码错误！");
			request.getRequestDispatcher("index.jsp").forward(request, response); 
			
		}
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		
		//调试
		System.out.println("---LoginAction-init方法---");
	}

}
