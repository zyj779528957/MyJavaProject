<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.entity.*,com.service.impl.*,com.service.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include.jsp" %>
<%
/* 
	此段代码已在include.jsp中写了，本页已引入了include.jsp，所以无需再重写此段代码
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	//取session的值
	Object uobj = session.getAttribute("userInfo");
	Users userInfo = new Users();
	if(uobj != null){
		userInfo = (Users)uobj;
	} 
*/


//取数据
INewsService ns = new NewsService();
List<News> nlist = ns.getAll();
//调试
System.out.println("nlist:"+nlist);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>管理后台 admin page</title>
<link href="${pageContext.request.contextPath}/CSS/admin.css" rel="stylesheet" type="text/css" />
<style>
	* {
		margin: 0;
		padding: 0;
	}
	#admin_bar > #status > span {
		color: red;
	}
	
	li table #td1{
  		color: orange;
  		width: 600px;	
  		//background-color: rgba(0,256,0,0.1);
  	}
  	li table .td2,.td3 {
  		color: orange;
  		width: 60px;	
  	}
  	li table td a {
  		text-decoration: none;
  	}
  	li table td a:hover {
  		display: inline-block;
  		padding: 2px 4px;
  		background-color: skyblue;
  		border-radius: 6px;
  	}
  	
	
</style>
<script src="${pageContext.request.contextPath}js/jquery-1.11.1.min.js"></script>
<script>
	<!-- 第一种方式：a标签传值 -->
  	jQuery(function(){
  		$('.del-news').click(function(){
  			//alert(1);
  			var ck = confirm('是否删除！');
  			var node = $(this).next();
  			console.log("ck:"+ck+" ----- node-value:"+node.val());
			
			return ck;		  			
  		});
  		
  	}); //jQuery结束
  </script>
</script>
</head>
<body>
<div id="header">
  <div id="welcome">欢迎使用新闻管理系统！</div>
  <div id="nav">
    <div id="logo"><img src="${pageContext.request.contextPath}/Images/logo.jpg" alt="新闻中国" /></div>
    <div id="a_b01"><img src="${pageContext.request.contextPath}/Images/a_b01.gif" alt="" /></div>
  </div>
</div>
<div id="admin_bar">
  <div id="status">管理员：<span><%=userInfo.getUname() %></span> 登录  &#160;&#160;&#160;&#160; <a href="../index.jsp">login out</a></div>
  <div id="channel"> </div>
</div>
<div id="main">
  <div id="opt_list">
    <ul>
      <li><a href="${pageContext.request.contextPath}/newspages/news_add.jsp">添加新闻</a></li>
      <li><a href="javascript:;">编辑新闻</a></li>
      <li><a href="${pageContext.request.contextPath}/newspages/topic_add.jsp">添加主题</a></li>
      <li><a href="${pageContext.request.contextPath}/TopicListAction">编辑主题</a></li>
    </ul>
  </div>
  <div id="opt_area">
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <script language="javascript">
	function clickdel(){
		return confirm("删除请点击确认");
	}
	
</script>
    <ul class="classlist">
            
        <c:forEach items="${nlist}" var="n2">
     		<li>
      	 		<!-- 第一种方式：a标签传值 -->
	       		<table border="0"  cellpadding="0" cellspacing="0">
	       			<tr>
	       				<td class="td1" id="td1">${n2.ntitle}</td>
	       				<td class="td2"><a href='OneNewsAction?nid=${n2.nid}'>修改</a></td>
	       				<td class="td3"><a href='DelNewsAction?nid=${n2.nid }' class="del-news" >删除</a></td><span>${DelTopicError }</span>
	       			</tr>
	       		</table>
      		</li>
      	</c:forEach>
        
      <li class='space'></li>
      <p align="right"> 当前页数:[1/3]&nbsp; <a href="#">下一页</a> <a href="#">末页</a> </p>
    </ul>
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
