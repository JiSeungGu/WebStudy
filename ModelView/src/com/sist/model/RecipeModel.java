package com.sist.model;

import com.sist.dao.*;

import sun.reflect.generics.visitor.Reifier;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

public class RecipeModel {
	public void recipeListData(HttpServletRequest request) //사용자가 보낸 데이터는 모두 request에 있다
	{
		//request에는 사용자의 요청정보를 가지고있음
		// 사용자가 요청한 페이지를 받는다.
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		
		//데이터 읽기
		int curpage=Integer.parseInt(page);
		Map map = new HashMap();
		int rowSize=20;
		int start=(rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start",start);
		map.put("end",end);
		
		List<RecipeVO> list = RecipeDAO.recipeListData(map);
		for(RecipeVO vo:list)
		{
			String str=vo.getTitle();
			if(str.length()>15)
			{
				str=str.substring(0,15);
				str+="...";
			}
			vo.setTitle(str);
		}
		//총페이지 
		int totalpage=RecipeDAO.recipeTotalPage();
		
		//JSP로 받은 결과값 전송
		request.setAttribute("list",list);
		request.setAttribute("curpage",curpage);
		request.setAttribute("totalpage",totalpage);
		
		List<ChefVO> cList=RecipeDAO.chefRecipeCount();
		request.setAttribute("cList",cList);
	}
	
	public void chefListData(HttpServletRequest request)
	{
		String page=request.getParameter("page");
		if(page==null)
		{
			page="1";
		}
		// 현재 페이지
		int curpage =Integer.parseInt(page);
		// 현재 페이지 출력할 데이터 읽기
		
		Map map = new HashMap();
		int rowSize=50;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		map.put("start",start);
		map.put("end",end);
		List<ChefVO> list=RecipeDAO.chefListData(map); 
		
		// 총페이지
    	int totalpage=RecipeDAO.chefTotalPage();
    	// curpage,totalpage,list => JSP
    	
    	request.setAttribute("list", list);
    	request.setAttribute("curpage", curpage);// 현재 페이지
    	request.setAttribute("totalpage", totalpage);// 총페이지
    	
    	List<ChefVO> cList=RecipeDAO.chefRecipeCount();
    	request.setAttribute("cList", cList);
    	
    	
    }
    // chef => 레시피 목록 출력 
    public void chefRecipeData(HttpServletRequest request)
    {
    	// 사용자 요청한 => chef명을 읽어 온다 
    	String chef_name=request.getParameter("chef_name");
    	List<RecipeVO> list=RecipeDAO.chefRecipeData(chef_name);
    	// JSP로 전송 => list에 있는 내용만 출력 
    	request.setAttribute("list", list);
    }
}

