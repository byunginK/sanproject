package com.san.spring.service;

import java.util.List;

import com.san.spring.dto.BbsDto;
import com.san.spring.dto.BbsLikeDto;

public interface BbsService {
	List<BbsDto> allBbsList(BbsDto bbs); // 전제 게시글 list 
	int getBbsCount(BbsDto bbsDtd); // 페이징 수
	boolean addBbs(BbsDto bbsDto); // 게시글 생성
	BbsDto getBbs(String seq); // 게시글 상세 정보(1개)
	boolean removeBbs(String seq); // 게시글 삭제
	boolean updateBbs(BbsDto bbsDto); // 게시글 수정
	
	int likeCount(int post_number);
	int checkLike(BbsLikeDto bbsLike); // 좋아요를 눌렀는지 안눌렀는지 확인 /좋아요 셍성/ 좋아요 수정
	int getLikeCount(int seq); 	//게시물 좋아요 개수
}
