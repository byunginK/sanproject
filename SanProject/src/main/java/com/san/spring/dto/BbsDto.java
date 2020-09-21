package com.san.spring.dto;

import java.io.Serializable;

public class BbsDto implements Serializable {
	private int post_number;
	private String email;
	private String content;
	private String location;
	private int auth_check;
	private String imgname;
	private String originfilename;
	private String wdate;
	// 검색을 위한 field
	private String choice;
	private String searchWord;

	// paging을 위한 field
	private int pageNumber;
	private int recordCountPerPage = 1; // 1page에 1개의 사진
	private int start = 1;
	private int end = 10;

	public BbsDto() {

	}

	public int getPost_Number() {
		return post_number;
	}

	public void setPost_Number(int post_number) {
		this.post_number = post_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getAuth_check() {
		return auth_check;
	}

	public void setAuth_check(int auth_check) {
		this.auth_check = auth_check;
	}

	public String getImgname() {
		return imgname;
	}

	public void setImgname(String imgname) {
		this.imgname = imgname;
	}

	public String getOriginfilename() {
		return originfilename;
	}

	public void setOriginfilename(String originfilename) {
		this.originfilename = originfilename;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getPost_number() {
		return post_number;
	}

	public void setPost_number(int post_number) {
		this.post_number = post_number;
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
		return "BbsDto [post_number=" + post_number + ", email=" + email + ", content=" + content + ", location="
				+ location + ", auth_check=" + auth_check + ", imgname=" + imgname + ", originfilename="
				+ originfilename + ", wdate=" + wdate + "]";
	}

}
