package com.san.spring.login;

import javax.servlet.http.HttpServletResponse;

public interface MemberService {
	boolean addMember(MemberDto memberDto); // 계정 생성

	boolean editMember(MemberDto memberDto); // 계정 수정

	boolean deleteMember(String email, String password); // 계정 삭제

	boolean searchMember(String email, String nickname); // 비밀번호 찾기

	String checkEmail(String email); // email 중복확인

	String checkNickName(String nickname); // nickname 중복확인

	MemberDto login(MemberDto dto); // 로그인

	public void check_nickname(String nickname, HttpServletResponse response) throws Exception;

	public void check_email(String email, HttpServletResponse response) throws Exception;
}
