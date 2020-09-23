package com.san.spring.controller;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.san.spring.dto.BbsDto;
import com.san.spring.service.BbsService;

@Controller
public class BbsController {
	
	@Autowired
	private BbsService bbsService;
	
	private static Logger logger = LoggerFactory.getLogger(BbsController.class);
	
	@RequestMapping(value = "bbslist.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String bbslist(Model model, HttpServletRequest request) {
		
		logger.info("bbslist " + new Date());
		//System.out.println(request.getSession().getAttribute("login")); // 세션 확인용
		
		List<BbsDto> bbslist = bbsService.allBbsList();
		
		model.addAttribute("bbslist", bbslist);
		
		
		return "mainBbs.tiles";
	}

}
