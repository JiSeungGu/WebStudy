package com.sist.dao;

import java.io.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * @author 지승구
 *
 * 
 *         액션태그 : 자바문법을 태그형으로 제작 3가지 기억 1) <jsp:include page="첨부할 JSP파일명"> 2)
 *         <jsp:useBean id ="dao" class="MemberDAO">
 *         ====================================메모리 할당 => 자바 코드로 변환이 됐을때
 *         MemberDAO dao = new MemberDAO() ======= id === id가 객체명이 된다.
 * 
 *         3) <jsp:setProperty name ="객체명" property=""> ============
 *         ============ name: id명칭 property : 변수명 ==> setMethod에 값을 채워 준다.
 * 
 *         예) JSP => Bean, MyBatis => DTO , Spring => VO Bean = DTO = VO 는 동일한
 *         개념 => 영화 한개의 전체 정보 => 브라우저에 넘겨줄 목적으로 생성 => 기능이 두가지 읽기/쓰기 getter /
 *         setter public class MemberVO { private int no; private String name;
 *         //쓰기 public void Setno(int no) { this.no=no; } //읽기 => 저장된 값 읽기
 *         public int getno() { return no; } }
 * 
 *         vo => 메모리에 클래스를 저장 MemberVO vo = new MemberVO(); =>
 *         <jsp:useBean id="vo" class="MemberDAO"> useBean 메모리 할당할때 사용하는 형태 =>
 *         싱글턴 => HTML과 자바 코딩을 분리 <c:forEach> <c:if> <c:forTokenes> <% %> => 제거
 *         vo.setName("홍길동"),vo.setNo(1) =>
 *         <jsp:setProperty name="vo" property="no" value="1"> ==========
 *         <jsp:setProperty name="vo" property="name" value="홍길동">
 *
 *         setProperty => setXxx()에 값을 채워 준다. => 모든 setXx()에 전송된 값을 채워라
 *
 */
public class BoardDAO {
	public static SqlSessionFactory ssf;
	/*
	 * 마이바티스, 스프링 : XML을 읽기 때문에 XML이 틀릴경우 구동이 안됨 => id 주는 방법 [테이블 명]+id ex)
	 * databoardTotalPage freeboardTotalPage
	 */
	static {

		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");

			ssf = new SqlSessionFactoryBuilder().build(reader);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static List<BoardVO> freeBoardData(Map map) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		SqlSession session = null;

		try {
			session = ssf.openSession();

			list = session.selectList("freeboardListData", map);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}

//  <select id="freeboardTotalPage" resultType="int" >
	public static int freeboardTotalPage() {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();

			session.selectOne("freeboardTotalPage");

		} catch (Exception e) {
			// TODO: handle exception
		} finally {

		}

		return total;
	}

	// <insert id="freeboardInsert" parameterType="BoardVO">
	public static void freeBoardInsert(BoardVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);// insert하는 부분 commit해줘야함
			session.insert("freeBoardInsert", vo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}
	// <update id="freeboardHitIncrement" parameterType="int">
	// <select id="freeboardDetailData" resultType="BoardVO" parameterType="int" >

	public static BoardVO freeboardDetailData(int no) {

		BoardVO vo = new BoardVO();
		SqlSession session = null;
		try {
			// 연결 객체 얻기 (session=>Connection,PreparedStatement)
			session = ssf.openSession();
			session.update("freeboardHitIncrement", no);
			session.commit();
			vo = session.selectOne("freeboardDetailData", no);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return vo;
	}

	// 수정할 데이터를 읽어 온다 : board -mapper.xml에 이미 만들어진 SQL문장이 있는 경우 -> 재사용이 가능
	// <select id="freeboardDetailData" resultType="BoardVO" parameterType="int" >
	public static BoardVO freeboardUpdateData(int no) {
		BoardVO vo = new BoardVO();

		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("freeboardDetailData", no);

		} catch (Exception e) {

		} finally {
			if (session != null) {
				session.close();
			}
		}

		return vo;
	}

	// <select id="freeboardGetPassword" resultType="String" parameterType="int" >
	// <update id="freeboardUpdate" parameterType="BoardVO" >
	public static boolean freeBoardUpdate(BoardVO vo) {
		boolean bCheck = false;
		SqlSession session = null;

		try {
			//연결할 Connection객체를 받아 온다
			session=ssf.openSession();
			//  SQL문장 실행 요청 
			// 1. 비밀번호를 가지고 온다.
			System.out.println("vo.getNo"+vo.getNo());
			String db_pwd = session.selectOne("freeboardGetPassword",vo.getNo()); // no=> input type=hidden
			System.out.println(db_pwd);
			if(db_pwd.equals(vo.getPwd()))
			{
				bCheck=true;
				
				session.selectOne("freeboardUpdate",vo);
				
				session.commit();
			}
			else {
				bCheck=false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return bCheck;
	}
}
