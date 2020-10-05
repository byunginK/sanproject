package com.san.spring.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.san.spring.dao.CommentDao;
import com.san.spring.dto.CommentDto;
import com.san.spring.service.CommentService;

@Service
public class CommentServiceimpl implements CommentService {
	
	@Autowired
	private CommentDao commentDao;

	@Override
	public boolean addMainBbsComment(CommentDto commentDto) {
		System.out.println("Service - addMainBbsComment");
		return commentDao.addMainBbsComment(commentDto);
	}

	@Override
	public boolean addQnaBbsComment(CommentDto commentDto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addReply(CommentDto commentDto) {
		System.out.println("Service - addReply");
		return commentDao.addReply(commentDto);
	}

	@Override
	public boolean updatestep(CommentDto commentDto) {
		System.out.println("Service updatestep");
		return commentDao.updatestep(commentDto);
	}

	@Override
	public List<CommentDto> getCmtList(String post_number) {
		return commentDao.getCmtList(post_number);
	}

}
