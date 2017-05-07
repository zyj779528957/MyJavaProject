package com.service.impl;

import java.io.StringWriter;

import com.sun.mail.imap.protocol.*;
import com.sun.mail.imap.protocol.BASE64MailboxEncoder;

//cookie中文字符转换成 英文与数字 工具类
public class AppUtil {

	public static String encode(String s2){
		String ss = null;
		StringWriter sw = new StringWriter();
		BASE64MailboxEncoder be = new BASE64MailboxEncoder(sw);

		ss = be.encode(s2);

		return ss;
	}
	



	public static String decode(String s2){	
		String ss = "";
		BASE64MailboxDecoder bd = new BASE64MailboxDecoder();
		ss = bd.decode(s2);
		
		return ss;
		
	}
}
