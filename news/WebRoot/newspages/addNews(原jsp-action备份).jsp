<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.entity.*,com.service.impl.*,com.service.*" %>

<%@page import="java.util.Arrays"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

	//得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
	String savePath = this.getServletContext().getRealPath("/upload"); // 即 E:\Java\javaCode\MyEclipse 2017 CI\.metadata\.me_tcat85\webapps\news\
	File file = new File(savePath);
	//判断上传文件的保存目录是否存在
	if (!file.exists() && !file.isDirectory()) {
		System.out.println(savePath + "目录不存在，需要创建");
		//创建目录
		file.mkdir();
	}
	//消息提示
	String message = "";
	boolean flag = true;
	
	try {
		//使用Apache文件上传组件处理文件上传步骤：
		//1、创建一个DiskFileItemFactory工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//2、创建一个文件上传解析器
		ServletFileUpload upload = new ServletFileUpload(factory);
		//解决上传文件名的中文乱码
		upload.setHeaderEncoding("UTF-8");
		//3、判断提交上来的数据是否是上传表单的数据
		if (!ServletFileUpload.isMultipartContent(request)) {
			//按照传统方式获取数据
			return;
		}

		//创建新闻实体用于数据上传
		News tNews = new News(); //提示-有参构造为：new News(Integer nid, Integer ntid, String ntitle, String nauthor, Date ncreatedate, String npicpath,String ncontent, Date nmodifydate, String nsummary)
		
		//给新闻创建时间赋值(此处可不赋创建时间，直接在sql语句中用 sysdate 更方便)
		/* SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   String date = sdf.format(new Date()); 
		   tNews.setNcreatedate(new Date()); //创建时间 */
		   
		//4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
		List<FileItem> list = upload.parseRequest(request);
		for (FileItem item : list) {
			//如果fileitem中封装的是普通输入项的数据
			if (item.isFormField()) {
				String name = item.getFieldName();
				
				//解决普通输入项的数据的中文乱码问题
				//String value = item.getString("UTF-8");
				//System.out.println(name + "=" + value);
				
				if (name.equals("ntid")) {
					tNews.setNtid(Integer.parseInt(item.getString("UTF-8"))); //新闻主题ID
				} else if (name.equals("ntitle")) {
					tNews.setNtitle(item.getString("UTF-8")); //标题
				} else if (name.equals("nauthor")) {
					tNews.setNauthor(item.getString("UTF-8")); //作者
				} else if (name.equals("nsummary")) {
					tNews.setNsummary(item.getString("UTF-8")); //摘要
				} else if (name.equals("ncontent")) {
					tNews.setNcontent(item.getString("UTF-8")); //内容
				}
			} else {//如果fileitem中封装的是上传文件
				//得到上传的文件名称（即图片名）
				String filename = item.getName();
				System.out.println("filename:"+filename);

				//设置文件格式
				List<String> filType = Arrays.asList("gif", "bmp", "png", "jpg");
				String picSuffix = filename.substring(filename.lastIndexOf(".") + 1).toLowerCase(); //得到后缀名并转换为小写形式
				if (!filType.contains(picSuffix) && filename != null && !filename.equals("")) { //判断文件类型是否在允许范围内
					%>
					<script type="text/javascript">
					 	alert(1);
						alert('上传失败，图片文件类型只能是gif、bmp、png、jpg、GIF、BMP、PNG、JPG!');
						console.log(121);
					</script>
					<% 
					out.print("上传失败，文件类型只能是gif、bmp、png、jpg、GIF、BMP、PNG、JPG");
					request.getRequestDispatcher("news_add.jsp").forward(request, response); //注：转发或重定向后，网页发生跳转但后台jsp代码继续接着运行
					flag = false;
					
				}


				// str.trim()方法:将字符串中开始与结束的空格删除
				if (filename == null || filename.trim().equals("")) {
					continue;
				}
				
				//注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
				//处理获取到的上传文件的文件名的路径部分，只保留文件名部分
				filename = filename.substring(filename.lastIndexOf("\\") + 1);
				//获取item中的上传文件的输入流
				InputStream in = item.getInputStream();
				//创建一个文件输出流
				FileOutputStream fos = new FileOutputStream(savePath + "\\" + filename);
				out.print(savePath + "\\" + filename);
				//创建一个缓冲区
				byte buffer[] = new byte[1024];
				//判断输入流中的数据是否已经读完的标识
				int len = 0;
				//循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
				while ((len = in.read(buffer)) > 0) {
					//使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
					fos.write(buffer, 0, len);
				}

				//对新闻对象中的npicpath属性进行赋值
				tNews.setNpicpath(savePath + "\\" + filename); //图片路径  //注：路径分隔符 "\"表示转义，"\\"才表示"\"
				//关闭输入流
				in.close();
				//关闭输出流
				fos.close();
				//删除处理文件上传时生成的临时文件
				item.delete();
				message = "文件上传成功！";
			}
		}
		if(flag){
			//图片格式（符合，跳转至admin页；否则，跳转至new_add页重新添加）	
			NewsService tns= new NewsService();	//new一个用户业务层对象（多态）		
			Integer count = tns.add(tNews);  //调用业务层新闻实现类中的add有参方法（实质后台业务层中的此方法紧接着再进一步调用数据层中的增添方法）
			
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
			
	} catch (Exception e) {
		message = "文件上传失败！";
		e.printStackTrace();

	}
	out.print(message);

%>



