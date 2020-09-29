<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
 <%--
	자바 : 데이터를 가지고 온다
	데이터 => 출력
 --%>
 <%--
	
	게시판 목록 출력
	영화(Movie.jsp) : cookie
	로그인(login.jsp) : session
		freeboard : <jsp:~>
		databoard : 다운로드 , 업로드
		
	예매  : javascript => Ajax
	
 --%>
 
 <%
 	String strPage = request.getParameter("page");
 	//사용자가 전송(요청) => 요청한 데이터를 톰캣이 모든 데이터를 묶어서 request에 첨부)
	// 모든 데이터는 request를 통해서 들어온다.
	/*
		list.jsp?page=1 => request.getParameter("page"); => 1
		list.jsp		=> request.getParameter("page"); => null
		list.jsp?page=  => request.getParameter("page""); => " " | null이 아니라 공백
						if(strPage.equal(""))
		==========================================================================
			<input type=text name=name> : 입력값이 없는 경우(null이 아니고 "")
				
	*/
	if(strPage==null) // 처음에 한번은 사용자가 페이지 번호를 보낼 수 없다.  (list.jsp)
	{
		strPage="1"; //default => 반드시 첨부한다
					 //페이지 나누기 => 모든 JSP에 적용
					 //게시물		 => 15~20개
					 //그림 출력	 => 12~15개
	}
	int curpage=Integer.parseInt(strPage);
	// 현재 출력할 내용 가지고 오기 => 마이바티스에서 start , end 페이지 요청
	// 데이터를 보내줄때 여러개를 설정 (여러개의 값이 있는 경우 : Map, VO) => 값을 모아서 마이바티스로 전송
	/*
		~vo => vo에 있는 변수가 있는 경우
		Map => vo에 없는 변수가 있는 경우
	*/
	Map map = new HashMap();
	// Hashmap map = new HashMap();
	// map map = new HashMap();
	// Map ==> interface => Map 인터페이스를 구현한 클래스 => HashMap();
	// Map ==> HashMap(), HashTable()
	// List => ArrayList,Vector,LinkedList
	/*
		List => 인터페이스
		list list = new ArrayList() => 비동기화 (이미 저장되어 있는 데이터:오라클) 
		list list = new Vector() 	=> 동기화 (네트워크) 
		list list = new LinkedList()=> C언어 호환
	*/
	int rowSize=10;
	int start=(rowSize*curpage)-(rowSize-1); //rownum (오라클에서 지원하는 데이터컬럼 => 1)
	int end=rowSize*curpage;
	
	map.put("start", start);
	map.put("end", end);
	
	List<BoardVO> list = BoardDAO.freeBoardData(map);
	// 저장되어 있는 list의 값을 출력 => JSP가 하는 역할 (JSP:View)  
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<h1 class="text-center">자유 게시판</h1>
		<table class="talbe">
			<tr>
				<td>
					<a href="../main/main.jsp?mode=10" class="btn btn-sm btn-primary">새글</a>
					<%-- mode=10 이면 어떤 화면을 보여줄건지: main.jsp --%>
				</td>
			</tr>
		</table>
		<table class="table table-striped">
		<%--
			danger	: 빨간색
			success	: 녹색
			info	: 하늘색
			warning	: 주황색
			activ	: 회색
		 --%>
		 <tr class="danger">
		 	<%--
		 		정렬 : text-left(default)
		 			  text-center,text-right
		 	 --%>
		 	 <th class="text-center" width=10%>번호</th>
		 	 <th class="text-center" width=45%>이름</th>
		 	 <th class="text-center" width=15%>제목</th>
		 	 <th class="text-center" width=10%>작성일</th>
		 	 <th class="text-center" width=10%>조회수</th>
		 </tr>
		 	 <%-- 데이터 출력 --%>
		 	 <%
		 	 	for(BoardVO vo:list)
		 	 	{
		 	 %>
					 <tr>
					 	 <td class="text-center" width=10%><%=vo.getNo() %></td>
					 	 <td class="text-left" width=45%>
					 	 <a href="../main/main.jsp?mode=11&no=<%=vo.getNo() %>"><%=vo.getSubject() %></a></td>
					 	 <td class="text-center" width=15%><%=vo.getName() %></td>
					 	 <td class="text-center" width=20%><%=vo.getRegdate() %></td>
					 	 <td class="text-center" width=10%><%=vo.getHit() %></td>
					 </tr>		 			 	
		 	 <%
		 	 	}
		 	 	
		 	 %>
		</table>
	</div>
</body>
</html>

