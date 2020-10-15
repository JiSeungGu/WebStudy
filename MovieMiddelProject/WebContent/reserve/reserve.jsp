<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/*
 *  내장 객체 : 태그 추가,내용변경 ==> 동적 ===> DOM프로그램 
    => window => 브라우저(창==>핍압)
     window.open()
    => document => 브라우저 안에 출력 부분
       => document.write() : 브라우저에 출력
       => console.log() => debug
    => form
       => input타입의 데이터를 읽거나 
    => history
       => back()
    ========
    태그를 제어 : selector
    
    jquery(라이브러리),javascript
    =============
       메모리에 저장이 된 상태 => 제어할 수 있다
       ===============
          window.onload=funtion(){}
          ==============
             $(funtion){
             
             }
 */
</script>
</head>
<body>
	<div style="height:30px"></div>
	<div class="row">			
	<div class="container-fluid">
	<table class="table">
			<tr>
				<td width=15% height=500 class="danger">
				<table class="table">
				<caption class="text-center"><h3>영화정보</h3></caption>
				
				</table>
				</td>
				<td width=15% height=500 class="warning"></td>
				<td width=40% height=500 class="info"></td>
				<td width=30% height=700 class="success" rowspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" height=200 class="active"></td>
				<td width=15% height=200 ></td>
			</tr>
	</table>	
	</div>		
	</div>		
</body>			
</html>			