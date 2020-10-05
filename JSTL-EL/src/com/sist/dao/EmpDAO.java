package com.sist.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmpDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@211.238.142.183:1521:XE";
	//드라이버 등록
	
	public EmpDAO() {
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch (Exception e) {
		System.out.println(e.getMessage());
		}
		
	}
	  public void getConnection()
	  {
		  try
		  {
			  conn=DriverManager.getConnection(URL,"hr","happy");
		  }catch(Exception ex) {}
	  }
	public void disConnection() {
		try {
			if(ps!=null)
				ps.close();
			if(conn!=null)
				conn.close();
		}catch (Exception e) {}
	}
	// Mybatis => Config.xml
	// 데이터 처리 => emp-mapper.xml에 존재 (SQL) => PreparedStatement
	/*
	 *	저장 방법
	 *	List(interface) => 자신이 생성이 불가능 => 인터페이스를 구현하고 있는 클래스를 이용해서 메모리 할당.
	 * ======
	 * 	 |
	 * 	ArrayList(비동기 => 데이터베이스 연결시)
	 *  Vector(동기화 => 네트워크 사용자 정보)
	 *  LinkedList(C 언어와 호환)
	 *  => 순서가 존재
	 *  => 중복된 데이터를 저장 
	 *  상위클래스  [변수명] = new 하위클래스 (Vector, ArrayList, LinkedList)
	 *  
	 *  set (interface)
	 *   |
	 *  TreeSet
	 *  HashSet
	 *  => 순서가 없다
	 *  => 중복된 데이터를 사용할 수 없다.(사용 빈도가 낮다)
	 *  
	 *  Map (interface)
	 *   |
	 *  HashMap => Hashtable의 단점을 보완
	 *  Hashtable 
	 *  => 키와 값을 나눠서 저장
	 *  => 키는 중복이 없고 값은 중복이 가능
	 *  => 클래스를 미리 메모리할당을 하고 키를 이용해서 할당된 주소를 찾아서 사용(Spring)
	 *  => 웹에서 사용되는 request,response,session,cookie ==> Map방식을 이용 (키, 값)
	 *  
	 *  =====================> Collection FrameWork : 데이터를 모아서 처리하기 쉽게 제공 
	 *  						=라이브러리 => 표준화
	 */
	public List<EmpVO> empListData()
	{
		List<EmpVO> list = new ArrayList<EmpVO>(); //순서가 필요, 데이터를 중복
		try {
		// 예외처리 => 비정상 종료를 방지하는 프로그램 	
			getConnection();
			
			String sql="SELECT empno,ename,job,TO_CHAR(hiredate,'YYYY-MM-DD'),sal,dname,loc "
					+ "FROM emp,dept "
					+ "WHERE emp.deptno=dept.deptno";
			ps=conn.prepareStatement(sql);
			
			ResultSet rs= ps.executeQuery();
			while(rs.next())
			{
				EmpVO vo=new EmpVO();
				vo.setEmpno(rs.getInt(1));
				vo.setEname(rs.getString(2));
				vo.setJob(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setSal(rs.getInt(5));
				vo.setDname(rs.getString(6));
				vo.setLoc(rs.getString(7));
				
				list.add(vo);
			}
			rs.close();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			disConnection();
		}
		return list;
	}
}
