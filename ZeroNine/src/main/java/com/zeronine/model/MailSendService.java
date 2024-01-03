package com.zeronine.model;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("mailService")
public class MailSendService {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber;
	
	public void makeRandomNumber() {
		Random r = new Random();
		int checkNum = r.nextInt(888888)+111111;
		authNumber = checkNum;
	}
	
	public String sendAuthMail(String email) {
		makeRandomNumber();
		String setFrom = "bys9032@naver.com";
		String toMail = email;
		String title = "제로나인 비밀번호 찾기 인증 이메일 입니다😊";
		String content = "제로나인 홈페이지를 방문해주셔서 감사합니다." + "<br><br>"+
						"인증 번호는 " + authNumber + "입니다." + "<br>" +
						"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		mailSend(setFrom,toMail,title,content);
		return Integer.toString(authNumber);
	}

	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		}catch(MessagingException e){
			e.printStackTrace();
		}
	}
}
