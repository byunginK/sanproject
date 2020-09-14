package com.san.spring.dto;

import java.io.Serializable;

public class QnADto extends CommentDto implements Serializable {

	private String title;
	
	public QnADto() {
		
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "QnADto [title=" + title + ", toString()=" + super.toString() + "]";
	}

	
	
	
	
}
