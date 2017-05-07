<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.service.*,com.service.impl.*,com.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include.jsp" %>

<%
 Topic oldTopic = null;
 try{
 	oldTopic = (Topic)request.getAttribute("oldTopic");
 }catch(Exception e){
 	System.out.println("---空指针了哟---");
 	e.printStackTrace();
 	System.out.println("---oldTopic--haha");
 }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />

<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>新闻发布系统管理后台</title>
<link href="CSS/admin.css" rel="stylesheet" type="text/css" />
<div id="header">
  <div id="welcome">欢迎使用新闻管理系统！</div>
  <div id="nav">
    <div id="logo"><img src="Images/logo.jpg" alt="新闻中国" /></div>
    <div id="a_b01"><img src="Images/a_b01.gif" alt="" /></div>
  </div>
</div>
<div id="admin_bar">
  <div id="status">管理员：<span>${userInfo.uname}</span> 登录  &#160;&#160;&#160;&#160; <a href="#">login out</a></div>
  <div id="channel"> </div>
</div>
</head>
<body>

<script type="text/javascript">
	function check(){
		var tname = document.getElementById("tname");

		if(tname.value == ""){
			alert("请输入主题名称！！");
			tname.focus();
			return false;
		}		
		return true;
	}
</script>

<div id="main">
  <div id="opt_list">
  <ul>
    <li><a href="newspages/news_add.jsp">添加新闻</a></li>
    <li><a href="AdminAction">编辑新闻</a></li>
    <li><a href="newspages/topic_add.jsp">添加主题</a></li>
    <li><a href="TopicListAction">编辑主题</a></li>
  </ul>
</div>

  <div id="opt_area">
    <h1 id="opt_type"> 修改主题： </h1>
    <form action="UpdateTopicAction" method="post" onsubmit="return check()">
      <p>
        <label> 主题名称 </label>
        <input id="tname" name="tname" type="text" class="opt_input" value="${oldTopic.tname}"/>
        <input name="tid" type="hidden" value="${oldTopic.tid}">
      	${OneTopicError }
      	${UpdateTopicError }
      </p>
      <input type="submit" value="提交" class="opt_sub" />
      <input type="reset" value="重置" class="opt_sub" />
    </form>
  </div>
</div>
<div id="site_link"> <a href="#">关于我们</a><span>|</span> <a href="#">Aboue Us</a><span>|</span> <a href="#">联系我们</a><span>|</span> <a href="#">广告服务</a><span>|</span> <a href="#">供稿服务</a><span>|</span> <a href="#">法律声明</a><span>|</span> <a href="#">招聘信息</a><span>|</span> <a href="#">网站地图</a><span>|</span> <a href="#">留言反馈</a> </div>
<div id="footer">
  <p class="">24小时客户服务热线：010-68988888  &#160;&#160;&#160;&#160; <a href="#">常见问题解答</a> &#160;&#160;&#160;&#160;  新闻热线：010-627488888<br />
    文明办网文明上网举报电话：010-627488888  &#160;&#160;&#160;&#160;  举报邮箱：<a href="#">jubao@jb-aptech.com.cn</a></p>
  <p class="copyright">Copyright &copy; 1999-2009 News China gov, All Right Reserver<br />
    新闻中国   版权所有</p>
</div>
</body>
</html>