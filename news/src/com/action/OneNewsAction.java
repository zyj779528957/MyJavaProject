package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.News;
import com.entity.Topic;
import com.service.INewsService;
import com.service.ITopicService;
import com.service.impl.NewsService;
import com.service.impl.TopicService;

public class OneNewsAction extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public OneNewsAction() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
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
		
		String nids = request.getParameter("nid");
		int nid = 0;
		try{
			nid = Integer.parseInt(nids);
		}catch(Exception e){
			nid = 0;
		}

		ITopicService ts = new TopicService();
		List<Topic> tlist = ts.getAll();

		INewsService ns = new NewsService();
		News oldNews = ns.getOne(nid); //原有的新闻对象
		
		if (tlist != null && oldNews != null ) {
			request.setAttribute("tlist", tlist);
			request.setAttribute("oldNews", oldNews);
			request.getRequestDispatcher("newspages/news_modify.jsp").forward(request, response);
		} else {
			request.setAttribute("OneNewsError", "原有主题对象失败！");
			response.sendRedirect("TopicListAction");
		}
		
		
	
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		
	}

}
