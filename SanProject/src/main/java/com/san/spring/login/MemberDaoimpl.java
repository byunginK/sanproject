package com.san.spring.login;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoimpl implements MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	

	@Override
	public boolean addMember(MemberDto dto) {
		int result = sqlSession.insert("addMember", dto);
		return result>0?true:false;
	}

	@Override
	public String checkId(String id) {
		return sqlSession.selectOne("checkId", id);
	}

	@Override
	public MemberDto login(MemberDto dto) {
		return sqlSession.selectOne("login", dto);
	}

}
