package com.sist.dao;

import java.util.Date;

/*
 
NO      NOT NULL NUMBER         
NAME    NOT NULL VARCHAR2(34)   
SUBJECT NOT NULL VARCHAR2(1000) 
CONTENT NOT NULL CLOB           
PWD     NOT NULL VARCHAR2(10)   
REGDATE          DATE           
HIT              NUMBER      
	vo = 변수만 설정
		 =====
		 	= 읽기
		 	= 쓰기
 */
public class BoardVO {
	private int no;
	private String name;
	private String subject;
	private String content;
	private String pwd;
	private String regdate;
	private int hit;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
	
}
