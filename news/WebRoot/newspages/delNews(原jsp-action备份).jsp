<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.entity.*,com.service.impl.*,com.service.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String nids = request.getParameter("nid");
int nid = 0;
try{
	nid = Integer.parseInt(nids);
}catch(Exception e){
	nid = 0;
}

INewsService ns = new NewsService();

ns.delete(nid);
response.sendRedirect("admin.jsp");
//调试
System.out.println("delNews-nid:"+nid);

%>

