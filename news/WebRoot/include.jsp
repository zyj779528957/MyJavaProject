<%@ page language="java" import="com.entity.*" pageEncoding="UTF-8"%>

<%
//写此页面目的:凡利用inclue标签引入了本页面代码的其他后台或前台jsp页面， 必须用户登录后使session有值才可访问，否则重定向到index页
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

//取session的值
Object uobj = session.getAttribute("userInfo");
Users userInfo = new Users();
if(uobj != null){
	userInfo = (Users)uobj;
}else{
	response.sendRedirect("/news/index.jsp");
}

%>
