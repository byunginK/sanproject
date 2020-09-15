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
	public int checkid(String id) {
		int result = Integer.parseInt(memberDao.checkId(id));
		return result;
	}

	@Override
	public MemberDto login(MemberDto dto) {
		return memberDao.login(dto);
	}

}
