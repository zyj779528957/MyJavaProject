<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.service.*,com.service.impl.*,com.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>新闻发布系统管理后台</title>
  <script src="js/jquery-1.11.1.js"></script>
  <link href="${pageContext.request.contextPath}/CSS/admin.css" rel="stylesheet" type="text/css" />
  <style>
  * {
  	/* margin: 0;
  	padding: 0; */
  }
  
  	li table td {
  		color: orange;
  		width: 100px;	
  		//background-color: rgba(0,256,0,0.1);
  	}
  	li table td a {
  		text-decoration: none;
  	}
  	li table td a:hover {
  		display: inline-block;
  		padding: 2px 6px;
  		background-color: skyblue;
  		border-radius: 6px;
  	}
  </style>
  <script src="${pageContext.request.contextPath}js/jquery-1.11.1.min.js"></script>
  <script>
  <!-- 第一种方式：js-location传值 -->
  	/* jQuery(function(){
  		alert(0);
  		$('.del-topic').click(function(){
  			//alert(1);
  			var ck = confirm('是否删除！');
  			var node = $(this).next();
  			console.log("ck:"+ck+" ----- node-value:"+node.val());
  			
  			if(ck){
  				window.location.href='delTopic.jsp?tid='+node.val();
  				alert(node.val());
  			}
  			
  		});
  		
  	}); //jQuery结束 */
  	
  	<!-- 第二种方式：a标签传值 -->
  	jQuery(function(){
  		$('.del-topic').click(function(){
  			//alert(1);
  			var ck = confirm('是否删除！');
  			var node = $(this).next();
  			console.log("ck:"+ck+" ----- node-value:"+node.val());
			
			return ck;		  			
  		});
  		
  	}); //jQuery结束
  </script>
  

<body>

  <script language="javascript">
  function clickdel(){
    return confirm("删除后，主题下的文章也会删除，确认删除吗？");
  } 
</script>

  <div id="main">
    <div id="opt_list">
      <ul>
        <li>
          <a href="newspages/news_add.jsp">添加新闻</a>
        </li>
        <li>
          <a href="AdminAction">编辑新闻</a>
        </li>
        <li>
          <a href="newspages/topic_add.jsp">添加主题</a>
        </li>
        <li>
          <a href="javascript:;">编辑主题</a>
        </li>
      </ul>
    </div>

    <div id="opt_area">
      <ul class="classlist">
      	<c:forEach items="${list}" var="t2">
	      			<li>
	       	 		<!-- 第一种方式：a标签传值 -->
		       		<table border="0"  cellpadding="0" cellspacing="0">
		       			<tr>
		       				<td>${ t2.tname }</td>
		       				<td><a href='OneTopicAction?tid=${t2.tid}'>修改</a></td>
		       				<td><a href='DelTopicAction?tid=${t2.tid }' class="del-topic" >删除</a></td><span>${DelTopicError }</span>
		       			</tr>
		       		</table>
	       		</li>
      	</c:forEach>
        <script>
        	jQuery(function(){
   
        		var optEle = $('#pageSize option');
				
				//当value与pageSize相等时，将当前元素设为selected
        		$.each(optEle, function(i, e){
  					console.log(typeof e.value);
  					if(e.value == ${pageSize}){
        				e.selected = 'selected';
        			}
				});
        		
        		//点击button跳转页面
        		$('#btn_toPageNo').click(function(){
        			var pageNo = $('#toPageNo').val();
        			window.location.href = 'TopicListAction?pageNo='+pageNo;
        		});
        		
        		//按回车跳转页面
        		$('#toPageNo').keypress(function(e){
        			var pageNo = $('#toPageNo').val();
        			//alert(e.keyCode);
        			if(e.keyCode == 13){
        				window.location.href = 'TopicListAction?pageNo='+pageNo+'&pageSize=${pageSize}';
        			}
        		});
        	
        		//改变pageSize
        		$('#pageSize').change(function(){
        			window.location.href = 'TopicListAction?pageSize='+$(this).val();
        		});
        	});
        </script>
        <p align="right">
                              当前页数:[${pageNo}/${totalPageCount}]&nbsp;
          <a href="TopicListAction?pageNo=1">首页</a>
          
     	  <!-- 上一页 -->
          <c:choose>
		  	<c:when test="${pageNo == 1}">
				<a href="javascript:;">上一页&nbsp;&nbsp;</a>
			</c:when>
			<c:otherwise>
				<a href="TopicListAction?pageNo=${pageNo-1}&pageSize=${pageSize}">上一页&nbsp;&nbsp;</a>
			</c:otherwise>
		  </c:choose>
		  <!-- 下一页 -->
		  <c:choose>
			  <c:when test="${pageNo == totalPageCount}">
					<a href="javascript:;">下一页&nbsp;&nbsp;</a>
			  </c:when>
			  <c:otherwise>
					<a href="TopicListAction?pageNo=${pageNo+1}&pageSize=${pageSize}">下一页&nbsp;&nbsp;</a>
			  </c:otherwise>
		  </c:choose>
		  
          <a href="TopicListAction?pageNo=${totalPageCount}">末页&nbsp;&nbsp;</a>
          <input type="text" value="${pageNo}" size="3" id="toPageNo"/>&nbsp<button id="btn_toPageNo">跳转</button>
          <select name="pageSize" id="pageSize">
          	<option value="3">3</option>
          	<option value="5">5</option>
          	<option value="10">10</option>
          </select>
        </p>
      </ul>
    </div>
  </div>

  <div id="site_link">
    <a href="#">关于我们</a>
    <span>|</span>
    <a href="#">Aboue Us</a>
    <span>|</span>
    <a href="#">联系我们</a>
    <span>|</span>
    <a href="#">广告服务</a>
    <span>|</span>
    <a href="#">供稿服务</a>
    <span>|</span>
    <a href="#">法律声明</a>
    <span>|</span>
    <a href="#">招聘信息</a>
    <span>|</span>
    <a href="#">网站地图</a>
    <span>|</span>
    <a href="#">留言反馈</a>
  </div>
  <div id="footer">
    <p class="">
      24小时客户服务热线：010-68988888  &#160;&#160;&#160;&#160;
      <a href="#">常见问题解答</a>
      &#160;&#160;&#160;&#160;  新闻热线：010-627488888
      <br />
      文明办网文明上网举报电话：010-627488888  &#160;&#160;&#160;&#160;  举报邮箱：
      <a href="#">jubao@jb-aptech.com.cn</a>
    </p>
    <p class="copyright">
      Copyright &copy; 1999-2009 News China gov, All Right Reserver
      <br />
      新闻中国   版权所有
    </p>
  </div>
</body>
</html>