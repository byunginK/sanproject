package com.san.spring.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.san.spring.dto.QnADto;
import com.san.spring.service.QnAService;

@Controller
public class QnAController {
	@Autowired
	private QnAService QnAService;
	
	@RequestMapping(value = "QnAList.do", method = RequestMethod.GET)
	public String AllQnAList(QnADto qnADto, Model model){
		List<QnADto> list = QnAService.allQnaBbsList(qnADto);
		model.addAttribute("QnA", list);
		return "QnA.tiles";
	}
	
	@RequestMapping(value = "goWriteQnA.do", method = RequestMethod.GET)
	public String goWriteQnA() {
		return "writeQnA.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "writeQna.do",method = RequestMethod.POST)
	public int writeQna(QnADto qna) {
		System.out.println(qna.toString());
		int result = QnAService.addQnaBbs(qna);
		return result;
	}
	
	@RequestMapping(value = "goQnaDetail.do", method = RequestMethod.GET)
	public String goQnaDetail(int post_number, Model model) {
		QnADto dto = QnAService.getQnaBbs(post_number);
		model.addAttribute("qna", dto);
		return "qnaDetail.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "deleteQna.do", method = RequestMethod.GET)
	public int deleteQna(int post_number) {
		int result = QnAService.removeQnaBbs(post_number);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "updateQna.do",method = RequestMethod.POST)
	public int updateQna(QnADto qnADto) {
		int result = QnAService.updateQnaBbs(qnADto);
		return result;
	}
}
