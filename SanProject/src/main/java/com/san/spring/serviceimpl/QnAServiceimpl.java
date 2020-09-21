package com.san.spring.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.san.spring.dao.QnADao;
import com.san.spring.dto.QnADto;
import com.san.spring.service.QnAService;

@Service
public class QnAServiceimpl implements QnAService {
	
	//@Autowired
	//private QnADao qnaDao;

	@Override
	public List<QnADto> allQnaBbsList(QnADto qnaDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getQnaBbsCount(QnADto qnaDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean addQnaBbs(QnADto qnaDto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public QnADto getQnaBbs(String seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean removeQnaBbs(String seq) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateQnaBbs(QnADto qnaDto) {
		// TODO Auto-generated method stub
		return false;
	}

}
