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
import com.san.spring.dto.BbsLikeDto;
import com.san.spring.dto.CommentDto;
import com.san.spring.service.BbsService;
import com.san.spring.service.CommentService;

@Controller
public class BbsController {
	
	@Autowired
	private BbsService bbsService;
	@Autowired
	private CommentService commentService;
	
	private static Logger logger = LoggerFactory.getLogger(BbsController.class);
	
	@RequestMapping(value = "bbslist.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String bbslist(Model model, BbsDto bbsDto) {
		int nowPage = bbsDto.getPageNumber();
		int start = nowPage*2+1;
		int end = start + 1;

		bbsDto.setStart(start);
		bbsDto.setEnd(end);
		List<BbsDto> bbslist = bbsService.allBbsList(bbsDto);
		//System.out.println(bbslist);
		model.addAttribute("bbslist", bbslist);
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
//		System.out.println(path);
		String imgNamdAdd ="";
		String originFileNameAdd = "";
		
		for (MultipartFile mf : fileList) {
			TimeUnit.MILLISECONDS.sleep(200); // safefile name이 겹치는걸 방지하기위해 500ms term을 줌 
			
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);
			
			String fpost ="";
			if(originFileName.indexOf('.') >=0	) { //확장자명이 있음
				fpost = originFileName.substring(originFileName.indexOf('.'));	// fpost = .txt가 들어가있다
			}

			String imgName =  System.currentTimeMillis() + fpost;
			imgNamdAdd += imgName+"-";
			originFileNameAdd += originFileName;

			try {
				mf.transferTo(new File(path + imgName));
				System.out.println(path + imgName);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		String imgName = imgNamdAdd.substring(0, imgNamdAdd.lastIndexOf("-"));
		bbsDto.setOriginfilename(originFileNameAdd);
		bbsDto.setImgname(imgName);
		boolean addBbs = bbsService.addBbs(bbsDto);
		return addBbs;
	}
	
	@ResponseBody
	@RequestMapping(value = "checkLike.do", method = RequestMethod.GET)
	public int checkLike(BbsLikeDto bbslike) {
		System.out.println(bbslike);
		bbsService.checkLike(bbslike);
		return bbsService.getLikeCount(bbslike.getMain_post_number());
	}
	
	@ResponseBody
	@RequestMapping(value = "getLikeCount.do", method = RequestMethod.GET)
	public int getLikeCount(int seq) {
		System.out.println(bbsService.getLikeCount(seq));
		return bbsService.getLikeCount(seq);
	}
	
	@ResponseBody
	@RequestMapping(value = "addlist.do", method = {RequestMethod.GET,RequestMethod.POST})
	public List<BbsDto> addlist(BbsDto bbsDto){
		int nowPage = bbsDto.getPageNumber();
		int start = nowPage*2+1;
		int end = start + 1;
		
		bbsDto.setStart(start);
		bbsDto.setEnd(end);
		List<BbsDto> bbslist = bbsService.allBbsList(bbsDto);
		return bbslist;
	}
	
	@RequestMapping(value = "goBbsDetail.do", method = RequestMethod.GET )
	public String gotBbsDetail(String post_number, Model model, HttpServletRequest request) {
		System.out.println("gotBbsDetail()");
		BbsDto bbs = bbsService.getBbs(post_number);
		List<CommentDto> list = commentService.getCmtList(post_number);
		model.addAttribute("bbs", bbs);
		model.addAttribute("cmtlist", list);
		return "mainBbsDetail.tiles";
		
	}
	
	@RequestMapping(value = "delMain.do", method = RequestMethod.GET)
	@ResponseBody
	public boolean removeBbs(String seq) {
		return bbsService.removeBbs(seq);
	}

	@RequestMapping(value = "updateMain.do", method = RequestMethod.GET)
	public String updateMain(String post_number, Model model) {
		BbsDto dto = bbsService.getBbs(post_number);
		model.addAttribute("bbs", dto);
		return "mainUpdate.tiles";
	}
	
	@RequestMapping(value = "updateMainBbs.do", method = RequestMethod.POST)
	@ResponseBody
	public int updateMainBbs(BbsDto bbs) {
		return bbsService.updateBbs(bbs);
	}
}
