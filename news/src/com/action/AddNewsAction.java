package com.action;

import java.io.File;
import java.io.IOException;

import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.entity.News;
import com.service.impl.NewsService;


public class AddNewsAction extends HttpServlet {

	/**
	 * 无参构造
	 */
	public AddNewsAction() {
		super();
		System.out.println("---AddNewsAction无参构造---");
	}

	/**
	 * destory方法
	 */
	public void destroy() {
		super.destroy(); 
		System.out.println("---AddNewsAction-destroy----");
		

	}

	/**
	 * doGet方法
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("---AddNewsAction-doGet---");
		doPost(request, response);
		
	}

	/**
	 * doPost方法
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//调试
		System.out.println("---AddNewsAction-doPost---");
		
		//创建新闻实体用于数据上传
		News tNews = new News(); //提示-有参构造为：new News(Integer nid, Integer ntid, String ntitle, String nauthor, Date ncreatedate, String npicpath,String ncontent, Date nmodifydate, String nsummary)
		
		//1.判断提交上来的数据是否是上传表单的数据
		boolean ckUpload = ServletFileUpload.isMultipartContent(request);
		if (ckUpload) {
			boolean ckFile = true; //标识文件上传是否成功
			try {
				//文件上传
				//1.1.创建一个DiskFileItemFactory工厂
				DiskFileItemFactory df = new DiskFileItemFactory();
				//1.2.创建一个文件上传解析器
				ServletFileUpload sfu = new ServletFileUpload(df);
				//1.3解决上传文件名的中文乱码
				sfu.setHeaderEncoding("UTF-8"); //注：此句不写好像上传文件中文也不会乱码
				//1.4得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
				//上传位置  E:\Java\tomcat-8.0.41\webapps\news\ upload
				String filePath = this.getServletContext().getRealPath("/upload"); // 
				//1.5.1创建文件对象
				File file = new File(filePath);				
				//调试
				System.out.println("---filePath:"+filePath);
									
				//1.5.2判断上传文件的保存目录是否存在
				if (!file.exists() && !file.isDirectory()) {
					System.out.println(filePath + "目录不存在，需要创建");
					//创建目录
					file.mkdir();
				}					
				
				//1.5.3设置上传文件的大小
				//sfu.setSizeMax(500*1025*1024); //设置总共文件大小为500M
				sfu.setFileSizeMax(500*1024*1024); //设置单个文件大小为500M
				
				//1.6.解析请求，得到请求中的所有参数值，并转码为UTF-8
				//使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
				List<FileItem> flist = sfu.parseRequest(request);
				for (FileItem fit : flist) {
					System.out.println("---fit:"+fit); //调试
					String name = fit.getFieldName();
					if (fit.isFormField()) { //1.6.1 普通组件： text,checkbox,radio,password
						if (name.equals("ntid")) {
							String ntid = fit.getString("UTF-8"); //新闻主题ID
							tNews.setNtid(Integer.parseInt(ntid));
						}
						if (name.equals("ntitle")) {
							String ntitle = fit.getString("UTF-8"); //标题
							tNews.setNtitle(ntitle);
						}
						if (name.equals("nauthor")) {
							String nauthor = fit.getString("UTF-8"); //作者
							tNews.setNauthor(nauthor);
						}
						if (name.equals("nsummary")) {
							String nsummary = fit.getString("UTF-8"); //摘要
							tNews.setNsummary(nsummary);
						}
						if (name.equals("ncontent")) {
							String ncontent = fit.getString("UTF-8"); //内容
							tNews.setNcontent(ncontent);
						}
					} else { //1.6.2 如果fileitem中封装的是上传文件(即input type=file)
						//1.6.2.1 得到上传的文件名称（即图片名）
						String fileName = fit.getName();

						//1.6.2.2  注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
						//处理获取到的上传文件的文件名的路径部分，只保留文件名部分
						int index = fileName.lastIndexOf("\\"); //注：路径分隔符 "\"表示转义，"\\"才表示"\"
						if (index != -1) {
							fileName = fileName.substring(index+1);
						}
						
						//1.6.2.3 得到随机字符串，并与原文件名相拼接，避免重复
						String rand = UUID.randomUUID().toString();
						fileName = rand +"_"+ fileName;
						
						System.out.println("---fileName:"+fileName); //调试
						
						//1.6.2.4 设置web 访问路径
						//对新闻对象中的npicpath属性进行赋值
						 tNews.setNpicpath(filePath+"\\"+fileName); //注：路径分隔符 "\"表示转义，"\\"才表示"\"
						
						//1.6.2.5 新建文件对象
						File f2 = new File(filePath,fileName);
						System.out.println("---f2---:"+f2);
						//1.6.2.6  写文件
						fit.write(f2);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				ckFile = false; //文件上传失败
			}
			
			//2.进数据库(当文件上传已成功上传后)
			if(ckFile) {
				//2.1new一个用户业务层对象（多态）,调用业务层新闻实现类中的add有参方法
				NewsService tns= new NewsService();	
				Integer count = tns.add(tNews); 
				//2.2 最后要去新闻列表页面
				request.getRequestDispatcher("newspages/admin.jsp").forward(request, response);
			}
			
		}else{
			throw new ServletException("---enctype != multipart/from-data");
		}
		
		
	} //doPost方法结束


	/**
	 * init方法
	 */
	public void init() throws ServletException {
		System.out.println("---AddNewsAction-init----");
	}

}
