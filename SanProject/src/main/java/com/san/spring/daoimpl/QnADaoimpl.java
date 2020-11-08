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
		return sqlSession.selectList("allQnaBbsList",qnaDto);
	}

	@Override
	public int getQnaBbsCount() {
		return sqlSession.selectOne("getQnaBbsCount");
	}

	@Override
	public int addQnaBbs(QnADto qnaDto) {
		return sqlSession.insert("addQnaBbs", qnaDto);
	}

	@Override
	public QnADto getQnaBbs(int seq) {
		return sqlSession.selectOne("getQnaBbs", seq);
	}

	@Override
	public int removeQnaBbs(int seq) {
		return sqlSession.update("removeQnaBbs", seq);
	}

	@Override
	public int updateQnaBbs(QnADto qnaDto) {
		return sqlSession.update("updateQnaBbs", qnaDto);
	}

}
