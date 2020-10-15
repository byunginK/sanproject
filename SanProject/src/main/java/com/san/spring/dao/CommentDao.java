package com.san.spring.dao;

import java.util.List;

import com.san.spring.dto.CommentDto;

public interface CommentDao {
	boolean addMainBbsComment(CommentDto commentDto); // 메인 게시글 댓글 생성
	boolean addQnaBbsComment(CommentDto commentDto); // QnA 게시글 댓글 생성
	boolean addReply(CommentDto commentDto); // 댓글에 대한 답글 생성
	boolean updatestep(CommentDto commentDto); // 댓글에 대한 답글 생성시 step update
	boolean removeComment(CommentDto commentDto); // 댓글 삭제
	
	List<CommentDto> getCmtList(String post_number);
	
}
