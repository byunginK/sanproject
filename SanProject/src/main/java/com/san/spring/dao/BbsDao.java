package com.san.spring.dao;

import java.util.List;
import com.san.spring.dto.BbsDto;
import com.san.spring.dto.BbsLikeDto;

public interface BbsDao {
	

	List<BbsDto> allBbsList(BbsDto bbsDto); // 전제 게시글 list 
	int getBbsCount(BbsDto bbsDtd); // 페이징 수
	boolean addBbs(BbsDto bbsDto); // 게시글 생성
	BbsDto getBbs(String seq); // 게시글 상세 정보(1개)
	//boolean addreply(BbsDto bbsDto);
	//boolean updatestep(BbsDto bbsDto);
	boolean removeBbs(String seq); // 게시글 삭제
	int updateBbs(BbsDto bbsDto); // 게시글 수정
	
	int likeCount(int post_number);
	int getLikeCount(int seq); 	//게시물 좋아요 개수
	BbsLikeDto checkLike(BbsLikeDto bbsLike);// 좋아요를 눌렀는지 안눌렀는지 확인
	boolean addLike(BbsLikeDto bbsLike); // 좋아요 셍성
	boolean updateLike(BbsLikeDto bbsLike); // 좋아요 수정

}
