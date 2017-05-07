<%@ page language="java" import="java.util.*,com.entity.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

	Topic t2 = new Topic();
	t2.setTname("笑话");
	request.setAttribute("t2", t2);

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  <body>
    
 <%--    out输出:<c:out value="varName" 
		[escapeXml="{true|false}"]
	 	[default="defaultValue"] /> --%>
    snum:${sessionScope.snum+1+1}
    love:${sessionScope.love}
    
    <br/>
    <br/>
    
 	姓名： ${param.username}</br>
	密码： ${param.password}</br>
	性别： ${param.sex}</br>
	年龄： ${param.old}</br>
	兴趣： ${paramValues.habit[0]}
	${paramValues.habit[1]}
	${paramValues.habit[2]}
	${paramValues.habit[3]}
	${paramValues.habit[4]}
	
	<!-- 原对象中的属性值 -->
	<h2>old tname:${t2.tname}</h2>
	<!-- 替换对象中的属性值 ,el输出属性值-->
	<c:set target="${t2}" property="tname" value="惊喜" />
	<h2>replace-tname:${t2.tname}</h2>
	
	<!-- 用set好替换对象中的属性值，out输出属性值 -->
	<c:set target="${t2}" property="tname">新属性值哟</c:set>
	<h2>
		replace2-tname:<c:out value="${t2.tname }"></c:out>
	</h2>
	
	<!-- 移除指定属性的值 -->
	<c:remove var="snum" />
	<h2>empty snum:${snum}</h2>
	
	
	
	
  </body>
</html>
