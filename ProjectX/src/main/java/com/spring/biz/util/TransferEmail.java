package com.spring.biz.util;

import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

public class TransferEmail {
	public static String sendEmail(String email, JavaMailSender mailSender) {
		// 난수발생 문자
		String uuid = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 6); 
		
		//여기만 바꾸면 가능
		String setfrom = "FinDream"; // 보내는 이(한글 안먹던데)
		String tomail = email; // 받는 사람 이메일
		String title = "구인구직 사이트 파인드림입니다."; // 제목(생략가능)
		String content = "인증번호를 보내드립니다. \n 인증번호 : " + uuid; // 내용
		
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() { 
			@Override public void prepare(MimeMessage mimeMessage) throws Exception { 
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
				helper.setFrom(setfrom); 
				helper.setTo(tomail); 
				helper.setSubject(title); 
				helper.setText(content); 
			} 
		}; 
		mailSender.send(preparator);
		return uuid;
	}
}
