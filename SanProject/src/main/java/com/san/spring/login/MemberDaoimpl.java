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
	public String checkEmail(String email) {
		return sqlSession.selectOne("checkId", email);
	}

	@Override
	public MemberDto login(MemberDto dto) {
		return sqlSession.selectOne("login", dto);
	}

	@Override
	public boolean editMember(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteMember(String email, String password) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean searchMember(String email, String nickname) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public String checkNickName(String nickname) {
		// TODO Auto-generated method stub
		return null;
	}



}
