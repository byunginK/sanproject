package com.san.spring.dto;

import java.io.Serializable;

public abstract class CommentDto implements Serializable {
	private int post_number;
	private String email;
	private int main_post_number;
	private String contetn;
	private int step;
	private int ref;
	private int del;
	private String wdate;
	
	public CommentDto() {
	
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
	public String getContetn() {
		return contetn;
	}
	public void setContetn(String contetn) {
		this.contetn = contetn;
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
	
	@Override
	public String toString() {
		return "CommentDto [post_number=" + post_number + ", email=" + email + ", main_post_number=" + main_post_number
				+ ", contetn=" + contetn + ", step=" + step + ", ref=" + ref + ", del=" + del + ", wdate=" + wdate
				+ "]";
	}
	
}
