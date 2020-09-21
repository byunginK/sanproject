package com.san.spring.dao;

import com.san.spring.dto.BbsDto;
import com.san.spring.dto.CommentDto;
import com.san.spring.dto.QnADto;

public interface CommentDao {
	boolean addMainBbsComment(int post_number); // 메인 게시글 댓글 생성
	boolean addQnaBbsComment(int post_number); // QnA 게시글 댓글 생성
	boolean addReply(int post_number); // 댓글에 대한 답글 생성
	boolean updatestep(CommentDto bbsDto); // 댓글에 대한 답글 생성시 step update
	
}
