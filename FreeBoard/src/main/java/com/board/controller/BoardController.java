package com.board.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.dao.BoardDAO;
import com.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired BoardService service;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping(value="/")
	public String index() {
		
		return "index";
		
	}
	
	@GetMapping(value="join.go")
	public String joinForm() {
		
		return "join";
	}
	
	
	@PostMapping(value="idOver.ajax")
	@ResponseBody
	public HashMap<String, Object> idOver(@RequestParam String id){
		
		boolean idOver = true;
		logger.info("아이디 중복체크 : "+id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		idOver = service.idOver(id);
		map.put("idOver", idOver);
		
		return map;
		
	}
	
	@PostMapping(value="emailOver.ajax")
	@ResponseBody
	public HashMap<String, Object> emailOver(@RequestParam String email){
		
		boolean emailOver = true;
		logger.info("이메일 중복체크 컨트롤러 : "+email);
		HashMap<String, Object> map = new HashMap<String, Object>();
		emailOver = service.emailOver(email);
		map.put("emailOver", emailOver);
		
		return map;
	}
	
	@PostMapping(value="nickOver.ajax")
	@ResponseBody
	public HashMap<String, Object> nickOver(@RequestParam String nickName){
		
		boolean nickOver = true;
		logger.info("이메일 중복체크 컨트롤러 : "+nickName);
		HashMap<String, Object> map = new HashMap<String, Object>();
		nickOver = service.nickOver(nickName);
		map.put("nickOver", nickOver);
		
		return map;
	}	
	
	@GetMapping(value="mailChk.ajax")
	@ResponseBody
	public String mailChk(String email, String path) {
		logger.info("요청 jsp :"+path);
		logger.info("요청 이메일 컨트롤러 : "+email);
		
		return service.mailChk(email, path);
	}
	
	@PostMapping(value="join.ajax")
	@ResponseBody
	public HashMap<String, Object> join(@RequestParam HashMap<String, Object> params){

		logger.info("params : ",params);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int success = service.join(params);
		map.put("success", success);
		
		return map;
	}
	
	@GetMapping(value="login.go")
	public String loginForm() {
		
		return "login";
	}
	
	@PostMapping(value="login.do")
	public ModelAndView login(@RequestParam String id, String pw, RedirectAttributes rAttr) {
		
		logger.info("로그인 아이디 : "+id);
				
		return service.login(id,pw,rAttr);
	}
	
	@GetMapping(value="accountFind.go")
	public String accountFind() {
		
		return "accountFind";
	}
	
	
	@PostMapping(value="idFind.go")
	public HashMap<String, Object> idFind(@RequestParam String email, RedirectAttributes rAttr) {
		
		logger.info("아이디 찾기 이메일 : "+email);
		
		return service.idFind(email, rAttr);
	}
	
	@PostMapping(value="pwReset.ajax")
	@ResponseBody
	public HashMap<String, Object> pwReset(@RequestParam String pw, String id){
		logger.info("비밀번호 변경");
		HashMap<String, Object> map = new HashMap<String, Object>();
		service.pwReset(pw, id);
		
		
		return map;
	}
	
	


}
