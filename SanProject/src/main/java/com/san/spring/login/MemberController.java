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
	
	@RequestMapping(value = "login.do", method = {RequestMethod.GET,RequestMethod.POST}) //get, post 들어오는 방식 중 하나 선택
	public String login() {  			//(외부로부터 들어오는 값(object, String), Model,HttpServletRequest)
		logger.info("login "+new Date());
	
		return "login.tiles"; // -> *.jsp 이 아니라  layouts.xml에 설정한 name값으로
	}
	
}
