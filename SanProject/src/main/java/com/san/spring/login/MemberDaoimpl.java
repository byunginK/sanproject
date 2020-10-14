package com.san.spring.login;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoimpl implements MemberDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	// 아이디 중복 검사(AJAX)
	@Override
	public int check_nickname(String nickname) throws Exception {
		return sqlSession.selectOne("check_nickname", nickname);

	}

	// 이메일 중복 검사(AJAX)
	@Override
	public int check_email(String email) throws Exception {
		return sqlSession.selectOne("check_email", email);

	}

	@Override
	public boolean addMember(MemberDto dto) {
		System.out.println("memberImpl");
		int result = sqlSession.insert("addMember", dto);
		return result > 0 ? true : false;
	}

//	@Override
//	public String checkEmail(String email) {
//		System.out.println("memberImpl");
//		return sqlSession.selectOne("checkId", email);
//	}

	@Override
	public MemberDto login(MemberDto dto) {
		System.out.println("memberImpl");
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

//	@Override
//	public String checkNickName(String nickname) {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
