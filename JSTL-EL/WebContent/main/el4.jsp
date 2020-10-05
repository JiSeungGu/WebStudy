<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<h1>JSTL/EL 을 이용한 구구단</h1>
	<table border=1 bordercolor=black>
		<tr>
			<c:forEach var="i" begin="2" end="9">
					<th>${i }단</th>
			</c:forEach>	
		</tr>
		<c:forEach var="i" begin="1" end="9">
			<tr>
				<c:forEach var="j" begin="2" end="9">
					<td>${i }*${j }=${i*j }</td>
				</c:forEach>
		</c:forEach>
	</table>
</body>
</html>