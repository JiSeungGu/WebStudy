<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	List<String> list=new ArrayList<String>();
	list.add("지승구");
	list.add("안치훈");
	list.add("이동은");
	
	List<Integer> list_int=new ArrayList<Integer>();
	list_int.add(30);
	list_int.add(25);
	list_int.add(33);
	
%>
<c:set var="names" value="<%=list %>"/>
<c:set var="ages" value="<%=list_int %>"/>
<%--
     홍길동(30
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="name" items="${names }" varStatus="s">
	${s.index }${name }(${ages[s.index]})<br>
</c:forEach>
</body>
</html>