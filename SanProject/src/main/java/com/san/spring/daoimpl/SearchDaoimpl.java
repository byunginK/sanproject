package com.san.spring.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.san.spring.dao.SearchDao;
import com.san.spring.dto.BbsDto;

@Repository
public class SearchDaoimpl implements SearchDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<BbsDto> getSearchList(HashMap<String, Object> map) {
		return sqlSession.selectList("getSearchList", map);
	}

}
