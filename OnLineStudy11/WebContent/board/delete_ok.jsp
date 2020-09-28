<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*,com.sist.dao.*"%>
<%-- delete_ok.jsp : 데이터 받아서 처리만 하고 다른 jsp로 이동 (HTML을 사용 할 필요가 없다)--%>
<%
	//detail.jsp에서  데이터 두개(no,password) 게시물 번호, 비밀번호  전달
	//한글이 없다 => request.setCharaterEncoding()
	
	String no = request.getParameter("no");
	String pwd= request.getParameter("pwd");
	
	// DAO 연결 => 비밀번호가 같으면 (삭제), 비밀번호가 틀리면 삭제하지 않는다.
	// DAO을 연결 하려면 => SQL 문장 필요 (databoard-mapper.xml)
	// java.io ==> File클래스 => 업로드된 파일 삭제한다.
	DataBoardVO vo = DataBoardDAO.boardGetInfoData(Integer.parseInt(no));
	// 비밀번호 확인 => 삭제
	boolean bCheck=DataBoardDAO.boardDelete(Integer.parseInt(no), pwd);
	
	if(bCheck==true) //비밀번호 같다 => 게시물 삭제 => 이동 => list.jsp로 이동
	{
		// 처리 => 업로드된 파일을 삭제
		if(vo.getFilesize()>0) // filesize=0(업로드 없는 게시물) filesize>0(업로드 된 파일)
		{
			File dir=new File("c:\\download");
			// File은 2개를 포함
			// 1. 실제 file
			// 2. 폴더 directory
			File[] files=dir.listFiles(); // download안에 있는 모든 파일정보를 가지고 온다.
			for(File f:files)
			{
				if(f.getName().equals(vo.getFilename()))
				{
					f.delete();
					break;
				}
			}
		}
		response.sendRedirect("../main/main.jsp?mode=1");
	}
	else // 비밀번호가 다르다 (본인이 아니다)
	{
	%>
		<script>
		alert("비밀번호가 틀립니다\n다시 입력하세요!")
		history.back();
		</script>
	<%
	}
	
%>