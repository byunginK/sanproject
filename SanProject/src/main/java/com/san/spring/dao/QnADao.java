package com.san.spring.dao;

import java.util.List;
import com.san.spring.dto.QnADto;

public interface QnADao {

	List<QnADto> allQnaBbsList(QnADto qnaDto); // 전제 게시글 list 
	int getQnaBbsCount(QnADto qnaDto); // 페이징 수
	boolean addQnaBbs(QnADto qnaDto); // 게시글 생성
	QnADto getQnaBbs(String seq); // 게시글 상세 정보(1개)
	boolean removeQnaBbs(String seq); // 게시글 삭제
	boolean updateQnaBbs(QnADto qnaDto); // 게시글 수정
}
