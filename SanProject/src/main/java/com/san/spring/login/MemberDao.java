package com.san.spring.login;

public interface MemberDao {
	boolean addMember(MemberDto dto);
	String checkId(String id);
	MemberDto login(MemberDto dto);
}
