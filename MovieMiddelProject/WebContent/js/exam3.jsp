<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	// 비교연산자
	var result='Java'==='Java'; // == , === 문자열 비교는 equals가 아니다.
	console.log(result);
	var res1='Java'>'Hello';
	console.log(res1);
	var res2='Java' !== 'Java'; // != , !==
	console.log(res2);
	
	// 논리 연산자 (&& || !)
	// 단항 연산자 (++ , --)
	let a=10;
	a++;
	console.log("a="+a)
	
	let aa=10
	let bb=++aa;
	console.log("aa="+aa);
	console.log("bb="+bb);
	
	//
}
</script>
</head>
<body>

</body>
</html>