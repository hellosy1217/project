package com.web.blueballoon.util;

import java.util.Date;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class SendMessageUtil {
	@Autowired
	private JavaMailSender mailSender;

	public boolean sendToEmail(String fromEmail, String toEmail, String title, String content) {
		boolean res =false;
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			System.out.println("보내는 사람 : "+fromEmail);
			messageHelper.setFrom(fromEmail); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(toEmail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
			
			res = true;
		} catch (Exception e) {
			System.out.println(e);
			res = false;
		}
		return res;
	}
	
	public boolean findToEmail (String toEmail, String newPasswd) {
		boolean res =false;
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			Date today = new Date();
			String fromEmail = "blueballoonteam@gmail.com";
			String title = "BlueBalloon에서 고객님의 요청에 따른 메일 수신드립니다.(비번찾기 관련)";
			String content = "고객님의 요청으로 새로운 임시 비밀번호를 전송해 드립니다. \n " + "새로운 비밀 번호 : " + newPasswd
					+ "\n 정상적으로 BlueBalloon 서비스를 이용하실 수 있습니다. \n 감사합니다. \n" + today + "Blue Balloon 드림";
			messageHelper.setFrom(fromEmail); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(toEmail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
			res = true;
		} catch (Exception e) {
			System.out.println(e);
			res = false;
		}
		return res;
	}
}
