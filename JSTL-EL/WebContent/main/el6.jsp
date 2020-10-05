<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% 
   Date date=new Date();
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
   String today=sdf.format(date);
%>
<%--오늘 날짜 저장 --%>
<c:set var="today" value="<%=today %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>EL연산자 사용: + - *</h1>
 5+5=${5+5}<br>
 5-"5"=${5-"5"}<br><%--자동으로 Integer.parseInt처리 --%>
 null*5=${null*5}<br><%--null은 0으로 인식 --%>
 
 <h1>/ %</h1>
 5/2=${5/2}<br> <%--정수/정수=실수 --%>
 5 div 2=${5 div 2 }<br>
 5%2=${5%2 }<br>
 5 mod 2=${5 mod 2 }
 
 <h1>1~10사이 짝수출력</h1>
 <c:forEach var="i" begin="1" end="10">
  <c:if test="${i%2==0}">
     ${i}&nbsp;
  </c:if>
 </c:forEach>
 
 <h1>EL 문자열 비교</h1>
  <c:if test="${today=='2020-10-05' }"> <%--test:조건을 저장하는 속성 --%>
     <font color="red"><b>오늘입니다!</b></font>
  </c:if>
  <c:if test="${today!='2020-10-05' }"> <%--else태그가 없음=>choose태그 사용 --%>
     <font color="red"><b>오늘이 아닙니다.</b></font>
  </c:if><br>
 
 <!-- 다중if문, 선택if문 --> 
  <c:choose>
   <c:when test="${today eq '2020-10-05'}">
   <font color="red"><b>오늘입니다!</b></font>
   </c:when>
   <c:otherwise>
     <font color="red"><b>오늘이 아닙니다.</b></font>   
   </c:otherwise>
  </c:choose> 
    
</body>
</html>