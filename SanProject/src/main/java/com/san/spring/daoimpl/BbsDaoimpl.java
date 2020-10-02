package com.san.spring.daoimpl;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.san.spring.dao.BbsDao;
import com.san.spring.dto.BbsDto;
import com.san.spring.dto.BbsLikeDto;

@Repository
public class BbsDaoimpl implements BbsDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	
	@Override
	public List<BbsDto> allBbsList(BbsDto bbs) {
		return sqlSession.selectList("allBbsList",bbs);
	}

	@Override
	public int getBbsCount(BbsDto bbsDtd) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean addBbs(BbsDto bbsDto) {
		System.out.println("DaoImpl addBbs");
		int result = sqlSession.insert("addBbs", bbsDto);
		return result>0?true:false;
	}

	@Override
	public BbsDto getBbs(String seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean removeBbs(String seq) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateBbs(BbsDto bbsDto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addLike(BbsLikeDto bbsLike) {
		int result = sqlSession.insert("addLike", bbsLike);
		return result>0?true:false;
	}

	@Override
	public boolean updateLike(BbsLikeDto bbsLike) {
		int result = sqlSession.update("updateLike", bbsLike);
		return result>0?true:false;
	}

	@Override
	public int getLikeCount(int seq) {
		return sqlSession.selectOne("getLikeCount", seq);
	}

	@Override
	public BbsLikeDto checkLike(BbsLikeDto bbsLike) {
		return sqlSession.selectOne("checkLike", bbsLike);
		
	}

	@Override
	public int likeCount(int post_number) {
		return sqlSession.selectOne("likeCount", post_number);
	}


	
	
	

}
