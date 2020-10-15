package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;

public class MovieModel {
	@RequestMapping("movie/real.do")
	public String movie_real(HttpServletRequest request)
	{
		request.setAttribute("msg", "현재상영영화"); // DB
		
		request.setAttribute("main_jsp", "../movie/real.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("movie/sch.do")
	public String movie_sch(HttpServletRequest request)
	{
		request.setAttribute("msg", "개봉예정영화");
		request.setAttribute("main_jsp", "../movie/real.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("movie/box.do")
	public String movie_box(HttpServletRequest request)
	{
		request.setAttribute("msg", "박스오피스");
		request.setAttribute("main_jsp", "../movie/real.jsp");
		return "../main/main.jsp";
	}
}
