package com.san.spring.dto;

import java.io.Serializable;

public class BbsLikeDto implements Serializable {
	private int like_number;
	private String email;
	private int main_post_number;
	private int like_count;
	
	public BbsLikeDto() {
	
	}
	
	public int getLike_number() {
		return like_number;
	}


	public void setLike_number(int like_number) {
		this.like_number = like_number;
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


	public int getLike_count() {
		return like_count;
	}


	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}


	@Override
	public String toString() {
		return "BbsLikeDto [like_number=" + like_number + ", email=" + email + ", main_post_number=" + main_post_number
				+ ", like_count=" + like_count + "]";
	}
	
	
}
