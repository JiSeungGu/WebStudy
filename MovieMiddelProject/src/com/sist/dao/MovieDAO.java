package com.sist.dao;

import java.util.*;
import com.sist.vo.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class MovieDAO {
	private static SqlSessionFactory ssf;
	static 
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	/*
	 	<select id="movieListData" resultType="MovieVO" parameterType="hashmap"> 
			SELECT no,poster,title,num 
			FROM (SELECT no,poster,title,rownum as num 
			FROM (SELECT no,poster,title 
			FROM daum_movie ODER BY score DESC)) 
			WHERE num BETWEEN #{start} AND #{end} 
		</select> 
		<select id="movieTotalPage" resultType="int" parameterType="int">
			SELECT CEIL(COUNT(*)/12.0) FROM daum_movie
			WHERE cateno = #{cateno}
		</select>
	 */
	public static List<MovieVO> movieListData(Map map)
	{
		SqlSession session = ssf.openSession();
		List<MovieVO> list = session.selectList("movieListData",map);
		session.close(); //반환
		
		return list;
	}
	public static int movieTotalPage(int cateno)
	{
		SqlSession session = ssf.openSession();
		int total=session.selectOne("movieTotalPage",cateno);
		session.close();
		return total;
	}
	/*
 	<!-- 영화 뉴스 -->
	<select id="movieNewsData" resultType="NewsVO" parameterType="hashmap">
	<!-- Class.forname("com.sist.vo.NewsVO") 
		private String title;
		private String poster;
		private String link;
		private String content;
		private String author;
	-->
	SELECT title,poster,link,content,author,num
	FROM (SELECT title,poster,link,content,author,rownum as num
	FROM (SELECT title,poster,link,content,author 
	FROM daum_News)))
	WHERE num BETWEEN #{start} and #{end} 
</select>
 */
	
//DAO ==> Model (List=> Controller => jsp)
public static List<NewsVO> movieNewsData(Map map)
{
	SqlSession session = ssf.openSession();
	List<NewsVO> list = session.selectList("movieNewsData",map);
	session.close();
	return list;
}

public static int newsTotalPage()
{
	SqlSession session = ssf.openSession();
	int total=session.selectOne("newsTotalPage");
	session.close();
	return total;
}

}
