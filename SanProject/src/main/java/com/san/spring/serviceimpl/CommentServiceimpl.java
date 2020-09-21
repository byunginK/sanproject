package com.san.spring.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.san.spring.dao.CommentDao;
import com.san.spring.dto.CommentDto;
import com.san.spring.service.CommentService;

@Service
public class CommentServiceimpl implements CommentService {
	
	//@Autowired
	//private CommentDao commentDao;

	@Override
	public boolean addMainBbsComment(int post_number) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addQnaBbsComment(int post_number) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addReply(int post_number) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updatestep(CommentDto bbsDto) {
		// TODO Auto-generated method stub
		return false;
	}

}
