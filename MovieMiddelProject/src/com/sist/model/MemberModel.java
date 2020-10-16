package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;
/*
 * 	request ==> main.jsp
 * 	
 *  ** 파일이 include가 되면 request를 공유한다.
 */
public class MemberModel {
	@RequestMapping("member/join.do")
	public String member_join(HttpServletRequest request)
	{
		
		
	
		request.setAttribute("main_jsp", "../member/join.jsp");
		return "../main/main.jsp";
	}
}
