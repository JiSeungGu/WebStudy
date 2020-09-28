<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
<%--	View(화면 출력만 한다)
		DAO안에 있는 메소드 호출 => 데이터를 가지고 온다.
		HTML,JavaScript =>  오라클 연결이 불가능
			
 --%>
 <%
 	// 1. main.jsp를 통해서 전달된 no라는 변수를 가지고 온다.
 	String no =request.getParameter("no");
	DataBoardVO vo=DataBoardDAO.boardDetailData(Integer.parseInt(no));
	
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<h1 class="text-center">내용 보기</h1>
			<table class="table table-striped">
				<tr>
					<th class="text-center danger" width=20%>번호</th>
					<td class="text-center" width=30%><%=vo.getNo() %></td>
					<th class="text-center danger" width=20%>작성일</th>
					<td class="text-center" width=30%><%=vo.getDbday() %></td>
				</tr>
				
				<tr>
					<th class="text-center danger" width=20%>이름</th>
					<td class="text-center" width=30%><%=vo.getName() %></td>
					<th class="text-center danger" width=20%>조회수</th>
					<td class="text-center" width=30%><%=vo.getHit() %></td>
				</tr>
				
				<tr>
					<th class="text-center danger" width=20%>제목</th>
					<td colspan="3"><%=vo.getSubject() %></td>
				</tr>
				
				<%
					if(vo.getFilesize()>0) //업로드된 파일이 존재하면!! 
					{
				%>
						<tr>
							<th class="text-center danger" width=20%>첨부파일</th>
							<td colspan="3">
								<%-- * 다운로드 * 
									board와 관련 => board폴더 => download.jsp
									현재 상태
										=> detail.jsp 는 board가 아니라 main에있다
								--%>
								 <a href="../board/download.jsp?fn=<%=vo.getFilename()%>"><%=vo.getFilename() %></a>(<%=vo.getFilesize() %>Bytes)
							</td>
						</tr>		
				<%		
					}
				%>
				<tr>
					<td colspan="4" class="text-left" valign="top" height=200>
					<%-- 한줄 문자열 --%>
					<pre style="white-space: pre-wrap;background-color:white; border:none"><%=vo.getContent() %></pre>
					</td>
				</tr>
				<tr>
         <td colspan="4" class="text-right">
           <%-- ../main/main.jsp?mode=6 --%>
           <%-- ../board/update.jsp --%>
           <a href="../main/main.jsp?mode=6&no=<%=vo.getNo() %>" class="btn btn-xs btn-primary">수정</a>
           <%-- ../board/delete.jsp --%>
           <a href="../main/main.jsp?mode=5&no=<%=vo.getNo() %>" class="btn btn-xs btn-success">삭제</a>
           <%-- ../board/list.jsp --%>
           <a href="../main/main.jsp?mode=1" class="btn btn-xs btn-danger">목록</a>
         </td>
				</tr>
			</table>
	</div>
</body>
</html>