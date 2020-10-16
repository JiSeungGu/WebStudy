<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="../main/main.do">SIST Movie</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="../main/main.do">Home</a></li>
        <li><a href="#">로그인</a></li>
        <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="../member/join.do">회원가입</a></li>
          <%--
          		회원 가입 폼
          		1.아이디 중복 체크
          		2.우편번호 검색
          		3.
           --%>
          <li><a href="#">아이디 찾기</a></li>
          <li><a href="#">비밀번호 찾기</a></li>
        </ul>
      </li>  
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">영화
        <span class="caret"></span></a>
        <ul class="dropdown-menu" >
          <li><a href="../movie/total.do">전체 영화</a></li>
          <li><a href="../movie/real.do?cateno=1">현재 상영 영화</a></li>
          <%-- 상세보기  : 찜하기, Cookie, 댓글--%>
          <li><a href="../movie/sch.do?cateno=2">개봉 예정</a></li>
          <li><a href="../movie/box.do?cateno=3">박스 오 피 스</a></li>
        </ul>
      </li>	 
      	<%-- Ajax를 통해 예매 
      		 달력,
      	--%>
        <li><a href="../reserve/reserve.do">영화예매</a></li>
        
        
        <li><a href="../movie/news.do">영화뉴스</a></li>
        
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
        <%-- 블록별 처리 --%>
          <li><a href="#">공지 사항</a></li>
          <li><a href="#">자유 게시판</a></li>
          <li><a href="#">묻고 답하기</a></li>
        </ul>
      </li>
        <li><a href="#">마이페이지</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron text-center">
  <h1>영화 예매 사이트</h1> 
  <p>영화예매를 위한 MVC사이트 입니다.</p> 
  <form>
    <div class="input-group">
      <input type="email" class="form-control" size="50" placeholder="영화명 검색" required>
      <div class="input-group-btn">
        <button type="button" class="btn btn-danger">검색</button>
      </div>
    </div>
  </form>
</div>
</body>
</html>