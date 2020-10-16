package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import com.sist.controller.RequestMapping;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

public class MovieModel {
	@RequestMapping("movie/real.do")
	public String movie_real(HttpServletRequest request)
	{
		String page = request.getParameter("page");
		if(page==null)
			page="1";

		String cateno=request.getParameter("cateno");
		if(cateno==null)
			cateno="1";
			
		//현재 페이지
		int curpage=Integer.parseInt(page);
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;

		// map에 저장
		Map map = new HashMap();
		map.put("cateno", cateno);
		map.put("start",start);
		map.put("end",end);
		
		//데이터 베이스 연결
		List<MovieVO> list = MovieDAO.movieListData(map);
		
		
		int totalpage = MovieDAO.movieTotalPage(Integer.parseInt(cateno));
		
		// JSP에서 필요한 데이터를 보내기 시작 
		
		// Request에 값을 채운다.
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		// include 파일 지정 
		request.setAttribute("main_jsp", "../movie/real.jsp");
		
		return "../main/main.jsp";
	}
	
	@RequestMapping("movie/sch.do")
	public String movie_sch(HttpServletRequest request)
	{
		String page = request.getParameter("page");
		if(page==null)
			page="1";

		String cateno=request.getParameter("cateno");
		if(cateno==null)
			cateno="2";
			
		//현재 페이지
		int curpage=Integer.parseInt(page);
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;

		// map에 저장
		Map map = new HashMap();
		map.put("cateno", cateno);
		map.put("start",start);
		map.put("end",end);
		
		//데이터 베이스 연결
		List<MovieVO> list = MovieDAO.movieListData(map);
		
		
		int totalpage = MovieDAO.movieTotalPage(Integer.parseInt(cateno));
		
		// JSP에서 필요한 데이터를 보내기 시작 
		
		// Request에 값을 채운다.
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);

		request.setAttribute("main_jsp", "../movie/sch.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("movie/box.do")
	public String movie_box(HttpServletRequest request)
	{

		String page = request.getParameter("page");
		if(page==null)
			page="1";

		String cateno=request.getParameter("cateno");
		if(cateno==null)
			cateno="3";
			
		//현재 페이지
		int curpage=Integer.parseInt(page);
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;

		// map에 저장
		Map map = new HashMap();
		map.put("cateno", cateno);
		map.put("start",start);
		map.put("end",end);
		
		//데이터 베이스 연결
		List<MovieVO> list = MovieDAO.movieListData(map);
		
		
		int totalpage = MovieDAO.movieTotalPage(Integer.parseInt(cateno));
		
		// JSP에서 필요한 데이터를 보내기 시작 
		
		// Request에 값을 채운다.
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		
		request.setAttribute("main_jsp", "../movie/box.jsp");
		return "../main/main.jsp";
	}	
	 @RequestMapping("movie/news.do")
	 public String movie_news(HttpServletRequest request)
	 {
		 String page=request.getParameter("page");
		 if(page==null)
			 page="1";
		 
		 int curpage= Integer.parseInt(page);

		 Map map = new HashMap();

		 int rowSize=20;
		 int start=(rowSize*curpage)-(rowSize-1);
		 int end= rowSize*curpage;
		 
		 map.put("start",start);
		 map.put("end",end);
		 
		 List<NewsVO> nList = MovieDAO.movieNewsData(map);
		 //총페이지
		 int totalpage=MovieDAO.newsTotalPage();
		 
		 request.setAttribute("curpage",curpage);
		 request.setAttribute("totalpage",totalpage);
		 request.setAttribute("nList", nList);
		 //include => news.jsp
		 request.setAttribute("main_jsp", "../movie/news.jsp");
		 return "../main/main.jsp";
	 }
	 
	 @RequestMapping("movie/total.do")
	 public String movie_total(HttpServletRequest request)
	 {
	 	 // 데이터 읽어서 => jsp로 전송하는
		 // 페이지
		 String page = request.getParameter("page");
		 if(page==null)
			 page="1";
		 
		 
		 int curpage=Integer.parseInt(page);
		 Map map = new HashMap();
		 int rowSize=12;
		 int start = (curpage*rowSize)-(rowSize-1);
		 int end = curpage*rowSize;
			
		 map.put("start",start);
		 map.put("end",end);
		 
		 List<MovieVO> list = MovieDAO.movieTotalData(map);
		 int totalpage=MovieDAO.movieTotalPage2();
		 
		 int BLOCK=5;
		 int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		 int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		 
		 if(endPage>totalpage)
		 {
			 endPage = totalpage;
		 }
		 
		 request.setAttribute("list",list);
		 request.setAttribute("curpage", curpage);
		 request.setAttribute("totalpage", totalpage);
		 request.setAttribute("BLOCK", BLOCK);
		 request.setAttribute("startPage", startPage);
		 request.setAttribute("endPage",endPage);
		 request.setAttribute("main_jsp","../movie/total.jsp");
	 	 return "../main/main.jsp";
	 }
	 @RequestMapping("movie/detail.do")
	 public String movie_detail(HttpServletRequest request)
	 {
		 //사용자가 보내준 데이터 읽기
		 String no=request.getParameter("no");
		 String page=request.getParameter("page");
		 String cateno=request.getParameter("cno");
		 if(page==null)
			 page="1";
		 			  
		 //상세보기 데이터 읽기
		 // DataBase 연결
		 request.setAttribute("","");
		 request.setAttribute("main_jsp", "../movie/detail.jsp");
		 return "../main/main.jsp";
	 }
}
