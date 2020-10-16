<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row1{
   margin: 0px auto;
   width:800px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function postfind() 
{
   new daum.Postcode({
      oncomplete:function(data)
      {
         $('#post').val(data.zonecode);
         $('#addr1').val(data.address);
         
      }
   }).open();
}
</script>
</head>
<body>
 <div style="height:30px"></div>
 <div class="row row1">
 <h1 class="text-center">회원가입</h1>
  <table class="table">
    <tr>
     <th class="text-right danger" width="15%">아이디</th>
     <td width="85%">
       <input type="text" name=id class="input-sm" size=15>
       <input type=button value="중복체크" class="btn btn-sm btn-primary">
     </td>
    </tr>
    <tr>
     <th class="text-right danger" width="15%">비밀번호</th>
     <td width="85%">
       <input type=password name=pwd class="input-sm" size=15>
       &nbsp;재입력:<input type=password name=pwd1 class="input-sm" size=15>
     </td>
    </tr>
    <tr>
     <th class="text-right danger" width="15%">이름</th>
     <td width="85%">
       <input type="text" name=name class="input-sm" size=15>
     </td>
    </tr>
     <tr>
     <th class="text-right danger" width="15%">이메일</th>
     <td width="85%">
       <input type="text" name=email class="input-sm" size=45>
     </td>
    </tr>
    <tr>
     <th class="text-right danger" width="15%">생년월일</th>
     <td width="85%">
       <input type=date name=birthday class="input-sm" size=25>
     </td>
    </tr>
     <tr>
     <th class="text-right danger" width="15%">우편번호</th>
     <td width="85%">
       <input type=text name=post class="input-sm" size=7 readonly>
       <input type=button value="우편번호" class="btn btn-sm btn-primary" onclick="postfind()"> 
     </td>
    </tr>
    <tr>
     <th class="text-right danger" width="15%">주소</th>
     <td width="85%">
       <input type=text name=addr1 class="input-sm" size=45 readonly id=addr1>
     </td>
    </tr>
    <tr>
     <th class="text-right danger" width="15%">상세주소</th>
     <td width="85%">
       <input type=text name=addr2 class="input-sm" size=45>
     </td>
    </tr>
    <tr>
     <th class="text-right danger" width="15%">전화번호</th>
     <td width="85%">
        <select name=tel1>
          <option>010</option>
          <option>011</option>
          <option>017</option>
        </select>
       <input type=text name=addr2 class="input-sm" size=15>
     </td>
    </tr>
    <tr>
     <th class="text-right danger" width="15%">소개</th>
     <td width="85%">
     <textarea rows="8" cols="55" name="content"></textarea>
     </td>
    </tr>
     <tr>
       <td colspan="2" class="text-center">
         <input type=button value="회원가입" class="btn btn-sm btn-danger">
         <input type=button value="취소" class="btn btn-sm btn-warning"
         onclick="javascripy:history.back()">
         
       </td>
     </tr>
  </table>
 </div>
</body>
</html>