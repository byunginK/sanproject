package com.san.spring.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.san.spring.dto.BbsDto;
import com.san.spring.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;
	
	@RequestMapping(value = "goMainSearch.do", method = RequestMethod.GET)
	public String goMainSearch(String searchWord, String nowPage ,Model model) {
		if(nowPage == null || nowPage == "") {
			nowPage = "0";
		}
		
		int start = (Integer.parseInt(nowPage))*6+1;
		int end = start + 5;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchWord", searchWord);
		map.put("start", start);
		map.put("end", end);
		
		List<BbsDto> list = searchService.getSearchList(map);
		model.addAttribute("search", list);
		
		return "mainSearch.tiles";
	}
}
