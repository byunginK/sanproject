package com.san.spring.login;

import java.io.Serializable;

public class MemberDto implements Serializable {
	private String email;
	private String password;
	private String nickname;
	private String name;
	private int auth;
	private int withdrawal;
	private int marketing;
	private String filename;
	private String originfilename;
	
	public MemberDto() {
	
	}
	 
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	public int getWithdrawal() {
		return withdrawal;
	}
	public void setWithdrawal(int withdrawal) {
		this.withdrawal = withdrawal;
	}
	public int getMarketing() {
		return marketing;
	}
	public void setMarketing(int marketing) {
		this.marketing = marketing;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getOriginfilename() {
		return originfilename;
	}
	public void setOriginfilename(String originfilename) {
		this.originfilename = originfilename;
	}
	
	@Override
	public String toString() {
		return "MemberDto [email=" + email + ", password=" + password + ", nickname=" + nickname + ", name=" + name
				+ ", auth=" + auth + ", withdrawal=" + withdrawal + ", marketing=" + marketing + ", filename="
				+ filename + ", originfilename=" + originfilename + "]";
	}
	
	
}
