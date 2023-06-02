package com.board.service;

import java.util.HashMap;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.board.dao.BoardDAO;

@Service
public class BoardService {
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNum;
	
	@Autowired BoardDAO dao;
	@Autowired PasswordEncoder encoder;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public boolean idOver(String id) {
		
		logger.info("아이디 중복체크 서비스 : "+id);
		String  idOverlay = dao.idOver(id);
		
		return idOverlay == null?false:true;
	}
	
	
	public boolean emailOver(String email) {
		
		logger.info("이메일 중복체크 서비스 : "+email);
		String emailOver = dao.emailOver(email);
		
		return emailOver == null?false:true;
	}
	
	public boolean nickOver(String nickName) {

		logger.info("닉네임 중복체크 서비스 : "+nickName);
		String nickOver = dao.nickOver(nickName);
		
		return nickOver == null?false:true;
	}

	
	private void makeAuthNum() {
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111;
		logger.info("생성 인증번호 : "+checkNum);
		authNum = checkNum;		
	}

	public String mailChk(String email) {
		logger.info("요청 이메일 서비스 : "+email);
		makeAuthNum();
		
		String setFrom = "bawooljo1010@naver.com";
		String toMail = email;
		String title = "가입 이메일 테스트";
		String content = "가입 이메일 테스트"+
								"<br><br>"+
								"아래의 인증 번호를 정확하게 입력하여 주세요"+
								"<br><br>"+
								authNum+
								"<br><br>";
		
		
		mailSend(setFrom, toMail, title, content);
								
		
		return Integer.toString(authNum);
	}
	
	private void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();		
		
		logger.info("setFrom"+ setFrom);
		logger.info("toMail"+ toMail);
		logger.info("title"+ title);
		logger.info("content"+ content);
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	public int join(HashMap<String, Object> params) {
		logger.info("가입 서비스");
		
		String pre_pw = (String) params.get("pw");
		String enc_pw = encoder.encode(pre_pw);
		params.put("pw", enc_pw);
		
		return dao.join(params);
	}







}
