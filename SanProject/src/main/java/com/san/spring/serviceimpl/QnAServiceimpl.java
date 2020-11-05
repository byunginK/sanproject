package com.san.spring.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.san.spring.dao.QnADao;
import com.san.spring.dto.QnADto;
import com.san.spring.service.QnAService;

@Service
public class QnAServiceimpl implements QnAService {
	
	@Autowired
	private QnADao qnaDao;

	@Override
	public List<QnADto> allQnaBbsList(QnADto qnaDto) {
		return qnaDao.allQnaBbsList(qnaDto);
	}

	@Override
	public int getQnaBbsCount(QnADto qnaDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addQnaBbs(QnADto qnaDto) {
		return qnaDao.addQnaBbs(qnaDto);
	}

	@Override
	public QnADto getQnaBbs(int seq) {
		return qnaDao.getQnaBbs(seq);
	}

	@Override
	public int removeQnaBbs(int seq) {
		return qnaDao.removeQnaBbs(seq);
	}

	@Override
	public int updateQnaBbs(QnADto qnaDto) {
		return qnaDao.updateQnaBbs(qnaDto);
	}

}
