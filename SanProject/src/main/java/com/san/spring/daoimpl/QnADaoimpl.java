package com.san.spring.daoimpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.san.spring.dao.QnADao;
import com.san.spring.dto.QnADto;

@Repository
public class QnADaoimpl implements QnADao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<QnADto> allQnaBbsList(QnADto qnaDto) {
		return sqlSession.selectList("allQnaBbsList");
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
