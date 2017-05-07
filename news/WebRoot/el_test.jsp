<%@ page language="java" import="java.util.*,com.entity.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:out value="hello world!" />

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

/* 	Topic t2 = new Topic();
	t2.setTname("笑话");
	request.setAttribute("t2", t2); */

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>el-test</title>
  </head>
  <body>
 <%--  
  <c:set value="haha"
		var="varName"
		[scope="{page|request|session|application}"] /> --%>
  
  	<c:set var="snum" scope="session" value="8"></c:set>
  	<c:set var="love" scope="session" value="电影"></c:set>
  
     <form method = "post" action = "el_showTest.jsp">
	    <p>姓名：<input type="text" name="username" size="15" /></p>
		<p>密码：<input type="password" name="password" size="15" /></p>
		<p>性别：<input type="radio" name="sex" value="Male" checked/> 男
		<input type="radio" name="sex" value="Female" /> 女</p>
		<p>年龄：
		<select name="old">
		<option value="10">10 - 20</option>
		<option value="20" selected>20 - 30</option>
		<option value="30">30 - 40</option>
		<option value="40">40 - 50</option>
		</select>
		</p>
		<p>兴趣：
		<input type="checkbox" name="habit" value="Reading"/>看书
		<input type="checkbox" name="habit" value="Game"/>玩游戏
		<input type="checkbox" name="habit" value="Travel"/>旅游
		<input type="checkbox" name="habit" value="Music"/>听音乐
		<input type="checkbox" name="habit" value="Tv"/>看电视
		</p>
		<p>
		<input type="submit" value="传送"/>
		<input type="reset" value="清除"/>
		</p>
	</form>
  </body>
</html>
