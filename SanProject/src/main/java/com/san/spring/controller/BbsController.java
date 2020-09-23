package com.san.spring.controller;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		System.out.println(request.getSession().getAttribute("login")); // 세션 확인용
		return "mainBbs.tiles";
	}
	
	@RequestMapping(value = "mainBbswrite.do", method = {RequestMethod.GET})
	public String gomainBbsWrite(HttpServletRequest request) {
		System.out.println(request.getSession().getAttribute("login")); // 세션 확인용
		return "mainBbsWrite.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "addmainBbswrite.do", method = {RequestMethod.POST})
	public boolean mainBbsWrite(BbsDto bbsDto, HttpServletRequest request, MultipartHttpServletRequest mtfRequest) throws InterruptedException {
		System.out.println(request.getSession().getAttribute("login")); // 세션 확인용
		System.out.println(bbsDto);
		
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String src = mtfRequest.getParameter("src");
		System.out.println("src value : " + src);

//		String path = "C:\\image\\";
		String path = request.getSession().getServletContext().getRealPath("/image/");
		System.out.println(path);
		String imgNamdAdd ="";
		String originFileNameAdd = "";
		
		for (MultipartFile mf : fileList) {
			TimeUnit.MILLISECONDS.sleep(200); // safefile name이 겹치는걸 방지하기위해 500ms term을 줌 
			
			String imgName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈

			System.out.println("originFileName : " + imgName);
			System.out.println("fileSize : " + fileSize);
			
			String fpost ="";
			if(imgName.indexOf('.') >=0	) { //확장자명이 있음
				fpost = imgName.substring(imgName.indexOf('.'));	// fpost = .txt가 들어가있다
			}

			String originFileName =  System.currentTimeMillis()+fpost;
			imgNamdAdd += imgName;
			originFileNameAdd += originFileName+"-";

			try {
				mf.transferTo(new File(path + originFileName));
				System.out.println(path+ originFileName);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		String originFile = originFileNameAdd.substring(0, originFileNameAdd.lastIndexOf("-"));
		bbsDto.setOriginfilename(originFile);
		bbsDto.setImgname(imgNamdAdd);
		System.out.println(bbsDto);
		boolean addBbs = bbsService.addBbs(bbsDto);
		return addBbs;
	}

}
