<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 내부 script-->
<!-- 외부 script => 확장은 .js 
	<script src="파일명"	
-->
<script type="text/javascript">
/*
 	변수 :
 		=======================
 		var	 :ESS사용 하는 변수=> 사용 범위
 		let	 :ESS사용 변수	   => 지역 변수({} 끝나면 )
 		const:ESG사용	   => 데이터 변경이 불가능 (상수형 변수)
 		======================= 자동 지정 변수
 		int a=10;
 		var a=10;
 		
 		
 		=====> let a=10    ==> int 
 			   let a="aaa" ==> String
 			   let a=10.5  ==> double
 			   let a=[]	   ==> Array ==> 데이터 첨부 ==> [10,"Hello",10.5,{}]
 			   let a={}    ==> 객체 (JSON) => 자바스크립트 데이터 표현법
 		
 
 window.onload=function(){
	 	var a = "<center><h1>Hello JavaScript</h1></center>";
	 	// 화면에 출력
	 	document.write(a);
	 	a=10; // 처음으로 형변환
	 	document.write(a);
}
 			  */
 			  
// 화살표 함수
/*
 * 화살표 함수 => function. return 제거

 window.onload=()=>{
	 let a="Hello JavaScript";
	 a="Hello2";
	 console.log(a);
	 const b = "JavaScript"; //const는 final과 같다 값을 변경 할 수 없다.
	 b="Jquery"
	 console.log(b);
 }
 */
</script>
</head>
<body>

</body>
</html>