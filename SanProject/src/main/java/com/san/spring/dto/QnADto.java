package com.san.spring.dto;

import java.io.Serializable;

public class QnADto extends CommentDto implements Serializable {

	private String title;
	
	//검색을 위한 field
	private String choice;
	private String searchWord;
	
	// paging을 위한 field
	private int pageNumber;
	private int recordCountPerPage = 10; // 1page에 10개의 글 
	private int start = 1;
	private int end = 10;
	
	public QnADto() {
		
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getChoice() {
		return choice;
	}

	public void setChoice(String choice) {
		this.choice = choice;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "QnADto [title=" + title + ", toString()=" + super.toString() + "]";
	}

	
	
	
	
}
