package com.itcast.shop.utils;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

/**
 * 邮件发送工具类
 * @author LiGang
 * @version v1.0
 */
public class MailUtils {
	public static void sendMail(String to, String code) {
		Properties props = new Properties();
		// props.setProperty("mail.host", "localhost");
		// props.setProperty("mail.store.protocol", "pop3");
		// props.setProperty("mail.pop3.host", "pop3.126.com");

		props.setProperty("mail.host", "smtp.163.com"); //设置服务器主机名
		props.setProperty("mail.smtp.auth", "true"); //设置需要认证
		Session session = Session.getInstance(props, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("15764339496@163.com", //无需加"@163.com"
						"15764339496lg");
			}

		});
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress("15764339496@163.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(to));
			//message.setRecipient(RecipientType.CC, new InternetAddress("")); //设置抄送
			//message.setRecipient(RecipientType.BCC, new InternetAddress("")); //设置暗送
			message.setSubject("欢迎注册淘宝网，请您激活账号！");
			message.setContent(
							"<h2>淘宝网账号激活邮件</h2>"
									+ "<h3>您只需点击下面的链接即可激活您的帐号：</h3>"
									+ "<h3><a href='http://xkdream.tunnel.qydev.com/taobao/user_active.action?code="
									+ code
									+ "'>http://www.taobao.com/user_active.action?code="
									+ code
									+ "</a></h3>"
									+ "<h3>此致</h3><h3>淘宝购物网站 管理团队.</h3>"
									+ "<h3><a href='http://xkdream.tunnel.qydev.com/taobao/index.action'>http://www.taobao.com</a></h3><h3>"
									+ new SimpleDateFormat("yyyy年MM月dd日")
											.format(new Date()) + "</h3>",
							"text/html;charset=UTF-8");
			
			// 发送带附件的邮件
//			MimeMultipart list = new MimeMultipart();
//			MimeBodyPart bodyPart1 = new MimeBodyPart();
//			bodyPart1.setContent("此处填写邮件内容！", "text/html;charset=UTF-8");
//			list.addBodyPart(bodyPart1);
//			MimeBodyPart bodyPart2 = new MimeBodyPart();
//			try {
//				bodyPart2.attachFile("文件路径");
//				bodyPart2.setFileName(MimeUtility.encodeText("文件名称"));
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			list.addBodyPart(bodyPart2);
//			message.setContent(list);
			
			Transport.send(message); // 发送邮件
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}

	public static void main(String[] args) {
		sendMail("2366452869@qq.com", "nihaoa");
		System.out.println("发送成功！");
	}

}
