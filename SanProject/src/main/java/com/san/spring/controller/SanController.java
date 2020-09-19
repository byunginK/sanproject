package com.san.spring.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.san.spring.login.MemberController;

@Controller
public class SanController {

	private static Logger logger = LoggerFactory.getLogger(SanController.class);
	
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String gomain() {
		logger.info("gomain()");
		return "mainBbs.tiles";
	}
	
	@RequestMapping(value = "mainsearch.do", method = RequestMethod.GET)
	public String searchResult() {
		logger.info("searchResult()");
		return "mainSearch.tiles";
	}
	
	@RequestMapping(value = "infomain.do", method = RequestMethod.GET)
	public String goInfoMain() {
		logger.info("goInfoMain()");
		return "infomain.tiles";
	}
	@RequestMapping(value = "mypage.do", method = RequestMethod.GET)
	public String goMyPage() {
		logger.info("goMyPage()");
		return "mypage.tiles";
	}
}
