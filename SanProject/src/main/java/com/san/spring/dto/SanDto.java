package com.san.spring.dto;

import java.io.Serializable;

public class SanDto implements Serializable {
	private int post_number;
	private String name;
	private int height;
	private String course;
	private String info;
	private String transport;
	private String location;
	private String imgname;
 	private String originfilename;
 	
 	public SanDto() {
	
	}
 	
	public int getPost_number() {
		return post_number;
	}
	public void setPost_number(int post_number) {
		this.post_number = post_number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getTransport() {
		return transport;
	}
	public void setTransport(String transport) {
		this.transport = transport;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
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
	
	@Override
	public String toString() {
		return "SanDto [post_number=" + post_number + ", name=" + name + ", height=" + height + ", course=" + course
				+ ", info=" + info + ", transport=" + transport + ", location=" + location + ", imgname=" + imgname
				+ ", originfilename=" + originfilename + "]";
	}
 	
 	
}
