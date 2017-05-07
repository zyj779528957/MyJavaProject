<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.entity.*,com.service.impl.*,com.service.*" %>
<%@ include file="/include.jsp" %>
<%

//取数据
ITopicService ts = new TopicService();
List<Topic> tlist = ts.getAll();

INewsService ns = new NewsService();
News n2 = null;
//调试
System.out.println("tlist:"+tlist);


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />

<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>新闻发布系统管理后台</title>
<link href="../CSS/admin.css" rel="stylesheet" type="text/css" />
 <style>
 	#admin_bar > #status > span {
		color: red;
	}
  </style>
<div id="header">
  <div id="welcome">欢迎使用新闻管理系统！</div>
  <div id="nav">
    <div id="logo"><img src="../Images/logo.jpg" alt="新闻中国" /></div>
    <div id="a_b01"><img src="../Images/a_b01.gif" alt="" /></div>
  </div>
</div>
<div id="admin_bar">
 <!--  <div id="status">管理员： 登录  &#160;&#160;&#160;&#160; <a href="#">login out</a></div> -->
  <div id="status">管理员：<span><%=userInfo.getUname() %></span> 登录  &#160;&#160;&#160;&#160; <a href="../index.jsp">login out</a></div>
  <div id="channel"> </div>
</div>
</head>
<body>

<script type="text/javascript">
	function check(){
		var ntitle = document.getElementById("ntitle");
		var nauthor = document.getElementById("nauthor");
		var nsummary = document.getElementById("nsummary");
		var ncontent = document.getElementById("ncontent");
		
		if(ntitle.value == ""){
			alert("标题不能为空！！");
			ntitle.focus();
			return false;
		}else if(nauthor.value == ""){
			alert("作者不能为空！！");
			nauthor.focus();
			return false;
		}else if(nsummary.value == ""){
			alert("摘要不能为空！！");
			nsummary.focus();
			return false;
		}else if(ncontent.value == ""){
			alert("内容不能为空！！");
			ncontent.focus();
			return false;
		}		
		return true;
	}
</script>

<div id="main">
  <div id="opt_list">
  <ul>
    <li><a href="javascript:;">添加新闻</a></li>
    <li><a href="../AdminAction">编辑新闻</a></li>
    <li><a href="topic_add.jsp">添加主题</a></li>
    <li><a href="../TopicListAction"">编辑主题</a></li>
  </ul>
</div>

  <div id="opt_area">
    <h1 id="opt_type"> 添加新闻： </h1>
    <form action="../AddNewsAction" method="post" enctype="multipart/form-data" onsubmit="return check()">
      <p>
        <label> 主题 </label>
        <select name="ntid">     	
        	<%for(Topic t2 : tlist){ %>
        		<option value='<%=t2.getTid() %>'><%=t2.getTname() %></option>
        	<%} %>      
        </select>
      </p>
      <p>
        <label> 标题 </label>
        <input name="ntitle" type="text" class="opt_input" id="ntitle" />
      </p>
      <p>
        <label> 作者 </label>
        <input name="nauthor" type="text" class="opt_input" id="nauthor" />
      </p>
      <p>
        <label> 摘要 </label>
        <textarea name="nsummary" cols="40" rows="3" id="nsummary"></textarea>
      </p>
      <p>
        <label> 内容 </label>
        <textarea name="ncontent" cols="70" rows="10" id="ncontent"></textarea>
      </p>
      <p>
        <label> 上传图片 </label>
        <input name="file" type="file" class="opt_input" />
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
