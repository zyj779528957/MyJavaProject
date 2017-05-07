package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.News;
import com.service.INewsService;
import com.service.impl.NewsService;

public class AdminAction extends HttpServlet {


	public AdminAction() {
		super();
	}


	public void destroy() {
		super.destroy(); 
		
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//取数据
		INewsService ns = new NewsService();
		List<News> nlist = ns.getAll();
		request.setAttribute("nlist", nlist);
		
		if (nlist != null) {
			request.setAttribute("nlist", nlist);
			request.getRequestDispatcher("newspages/admin.jsp").forward(request, response);
		} else {
			request.setAttribute("AdminActionError", "得到所有新闻失败！");
			response.sendRedirect("newspages/admin.jsp");
		}
		
	
	}


	public void init() throws ServletException {
		
	}

}
