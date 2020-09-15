package com.san.spring.login;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "login.do", method = {RequestMethod.GET,RequestMethod.POST}) //get, post 들어오는 방식 중 하나 선택
	public String login() {  			//(외부로부터 들어오는 값(object, String), Model,HttpServletRequest)
		logger.info("login "+new Date());
	
		return "login.tiles"; // -> *.jsp 이 아니라  layouts.xml에 설정한 name값으로
	}
	
	@RequestMapping(value = "regi.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String regi() {
		return "regi.tiles";
	}
	
	@RequestMapping(value = "regiAf.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String regiAf(MemberDto dto) {
		logger.info("login "+new Date());
		
		boolean b = memberService.addMember(dto);
		if(b) {
			logger.info("회원가입 되었습니다");
			return "login.tiles";
		}
		logger.info("가입되지 않았습니다");
		return "regi.tiles";
	}
	
	@RequestMapping(value = "loginAf.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String loginAf(MemberDto dto, HttpServletRequest req) {
		
		logger.info("loginAf "+new Date());
		System.out.println(dto);
		MemberDto login = memberService.login(dto);
		
		if(login !=null && !login.getEmail().equals("")) {
			logger.info("login success "+new Date());
			//session저장
			req.getSession().setAttribute("login", login);
			//req.getSession().setMaxInactiveInterval(60 * 60);
			
			//이동
			return "redirect:/bbslist.do"; 
		}else {
			logger.info("login fail "+new Date());
			return "redirect:/login.do";
		}
	}
	
	@RequestMapping(value = "logout.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String logout(HttpServletRequest req) {
		//세션 삭제
		req.getSession().invalidate();
		
		return "redirect:/login.do";
	}
	
}
