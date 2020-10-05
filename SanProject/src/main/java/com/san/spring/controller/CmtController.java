package com.san.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.san.spring.dto.CommentDto;
import com.san.spring.service.CommentService;



@Controller
public class CmtController {
	
	@Autowired
	private CommentService commentService;
	
	private static Logger logger = LoggerFactory.getLogger(CmtController.class);
	
	@ResponseBody
	@RequestMapping(value = "addCmt.do", method = RequestMethod.GET)
	public List<CommentDto> addMainBbsComment(CommentDto commentDto) {
		System.out.println(commentDto);
		commentService.addMainBbsComment(commentDto);
		String post_number = commentDto.getMain_post_number()+"";
		List<CommentDto> list = commentService.getCmtList(post_number);
		return list;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "addReply.do", method = RequestMethod.GET)
	public List<CommentDto> addReply(CommentDto commentDto) {
		System.out.println(commentDto);
		commentService.updatestep(commentDto);
		commentService.addReply(commentDto);
		String post_number = commentDto.getMain_post_number()+"";
		List<CommentDto> list = commentService.getCmtList(post_number);
		return list;
	}

}
