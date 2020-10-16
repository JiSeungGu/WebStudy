<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/*
 * 
 	var
 	let
 	const : 상수형 변수 (변경 불가)
 */		
 var a=10;	   //전역 변수 
 window.onload =function(){
	if(a==10)
	{	
		let b=100;
		
	}	
	console.log("b="+b);
 }
 /*
 	처리 
 		= 연산자 
 		산술 연산자
 		
 		= 제어문 
 */
 window.onload=function(){
	 let a=10;
	 let b=3;
	 console.log("a+b="+(a+b));
	 
	 let aa="Hello ";
	 let bb="JavaScript!!";
	 console.log(aa+bb);
	 
	 let aaa="10";
	 let bbb=20;
	 console.log(aaa+bbb);
	 
	 
	 let aaaaa='A';
	 let bbbbb=10;
	 console.log(aaaaa+bbbbb);
 }
</script>
</head>
<body>

</body>
</html>