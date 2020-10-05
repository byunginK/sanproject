package com.san.spring.dto;

import java.io.Serializable;

public class CommentDto implements Serializable {
	private int post_number;
	private String email;
	private int main_post_number;
	private String content;
	private int step;
	private int ref;
	private int del;
	private String wdate;
	private String nickname;

	public CommentDto() {

	}

	public CommentDto(String email, int main_post_number, String content) {
		super();
		this.email = email;
		this.main_post_number = main_post_number;
		this.content = content;
	}

	public int getPost_number() {
		return post_number;
	}

	public void setPost_number(int post_number) {
		this.post_number = post_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getMain_post_number() {
		return main_post_number;
	}

	public void setMain_post_number(int main_post_number) {
		this.main_post_number = main_post_number;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "CommentDto [post_number=" + post_number + ", email=" + email + ", main_post_number=" + main_post_number
				+ ", content=" + content + ", step=" + step + ", ref=" + ref + ", del=" + del + ", wdate=" + wdate
				+ ", nickname=" + nickname + "]";
	}

	

}
