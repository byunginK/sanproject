package com.san.spring.service;

import java.util.List;

import com.san.spring.dto.QnADto;

public interface QnAService {
	List<QnADto> allQnaBbsList(QnADto qnaDto); // 전제 게시글 list 
	int getQnaBbsCount(QnADto qnaDto); // 페이징 수
	int addQnaBbs(QnADto qnaDto); // 게시글 생성
	QnADto getQnaBbs(int seq); // 게시글 상세 정보(1개)
	int removeQnaBbs(int seq); // 게시글 삭제
	int updateQnaBbs(QnADto qnaDto); // 게시글 수정
}
