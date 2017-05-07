package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.impl.AppUtil;

public class IndexAction extends HttpServlet {

	
	public IndexAction() {
		super();
		System.out.println("---IndexAction无参构造---");
	}


	public void destroy() {
		super.destroy(); 
		//调试
		System.out.println("---IndexAction-destroy方法---");
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//调试
		System.out.println("---IndexAction-doGet方法---");
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//调试
		System.out.println("---IndexAction-doPost方法---");
		
		//取页面数据		
		//取cookie
		Cookie[] carr = request.getCookies();
		if (carr != null) {
			
			String cname = "";
			String cpwd = "";
			
			for (Cookie c2 : carr) {
				if (c2.getName().equals("uname")) {
					cname = c2.getValue();
					//解密中文
					cname = AppUtil.decode(cname);
				}
				if (c2.getName().equals("upwd")) {
					cpwd = c2.getValue();
				}
			}
	
			request.setAttribute("cname", cname);
			request.setAttribute("cpwd", cpwd);
			//调试
			System.out.println("---indexAction---cname:"+cname);
			System.out.println("---indexAction---cpwd:"+cpwd);
		}
		request.getRequestDispatcher("index.jsp").forward(request, response); //  "/index.jsp"为绝对路径：localhost:8080/index.jsp
		
	}


	public void init() throws ServletException {
		//调试
		System.out.println("---IndexAction-init方法---");
	}

}
