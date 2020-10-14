package com.san.spring.login;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

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

//	@Override
//	public String checkEmail(String email) {
//		return memberDao.check_email(email, null);
//	}

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
	public void check_nickname(String nickname, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(memberDao.check_nickname(nickname));
		out.close();	
	}

	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(memberDao.check_email(email));
		out.close();		
	}

	@Override
	public String checkEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String checkNickName(String nickname) {
		// TODO Auto-generated method stub
		return null;
	}

//	@Override
//	public String checkNickName(String nickname) {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
