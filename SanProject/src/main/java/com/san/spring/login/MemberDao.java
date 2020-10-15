package com.san.spring.login;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public interface MemberDao {

	boolean addMember(MemberDto memberDto); // 계정 생성

	boolean editMember(MemberDto memberDto); // 계정 수정

	boolean deleteMember(String email, String password); // 계정 삭제

	boolean searchMember(String email, String nickname); // 비밀번호 찾기

//	String checkEmail(String email); // email 중복확인
//
//	String checkNickName(String nickname); // nickname 중복확인

	MemberDto login(MemberDto dto); // 로그인

    int check_nickname(String nickname) throws Exception;

	int check_email(String email) throws Exception;

}
