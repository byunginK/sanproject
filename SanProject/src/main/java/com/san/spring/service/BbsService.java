package com.san.spring.service;

import java.util.List;

import com.san.spring.dto.BbsDto;
import com.san.spring.dto.BbsLikeDto;

public interface BbsService {
	List<BbsDto> allBbsList(); // 전제 게시글 list 
	int getBbsCount(BbsDto bbsDtd); // 페이징 수
	boolean addBbs(BbsDto bbsDto); // 게시글 생성
	BbsDto getBbs(String seq); // 게시글 상세 정보(1개)
	boolean removeBbs(String seq); // 게시글 삭제
	boolean updateBbs(BbsDto bbsDto); // 게시글 수정
	
	boolean addLike(BbsLikeDto bbsLike); // 좋아요 셍성
	boolean updateLike(BbsLikeDto bbsLike); // 좋아요 수정
}
