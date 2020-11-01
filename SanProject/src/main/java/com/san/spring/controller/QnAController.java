package com.san.spring.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.san.spring.dto.QnADto;
import com.san.spring.service.QnAService;

@Controller
public class QnAController {
	@Autowired
	private QnAService QnAService;
	
	@RequestMapping(value = "QnAList.do", method = RequestMethod.GET)
	public String AllQnAList(QnADto qnADto, Model model){
		List<QnADto> list = QnAService.allQnaBbsList(qnADto);
		System.out.println(list);
		model.addAttribute("QnA", list);
		return "QnA.tiles";
	}
}
