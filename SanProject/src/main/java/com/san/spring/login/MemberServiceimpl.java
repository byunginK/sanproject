package com.san.spring.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceimpl implements MemberService {

	@Autowired
	MemberDao memberDao;

	@Override
	public boolean addMember(MemberDto dto) {
		return memberDao.addMember(dto);
	}

	@Override
	public String checkEmail(String email) {
		return memberDao.checkEmail(email);
	}

	@Override
	public MemberDto login(MemberDto dto) {
		return memberDao.login(dto);
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
