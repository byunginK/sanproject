package com.san.spring.login;

public interface MemberService {
	boolean addMember(MemberDto dto);
	int checkid(String id);
	MemberDto login(MemberDto dto);
}
