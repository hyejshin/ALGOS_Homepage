<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="web.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="member" class="web.bean.Member" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>회원가입 입력</title>
	<STYLE>
	@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	table {text-align: center}
	tr.head {background: pink; font-weight: bold; text-align: center}
	body { font-family: "Hanna";}
	h1 {color: darkturquoise;}
</STYLE>
	<script>
/*	function check_id(){
		var fr = document.getElementById("my_form");
		if(fr.id.value.length==0){
			alert("입력된 아이디가 없습니다.");
			fr.id.focus();
		}else
		{
			var uid = fr.id.value;  */
			// 데이터베이스 커넥션 생성
	<% /*	Connection conn = ConnectionContext.getConnection();
			// Statement 생성
			Statement stmt = conn.createStatement();
			
			String strSQL = "SELECT * FROM member WHERE id='"+id+"'";
			ResultSet rs = stmt.executeQuery(strSQL); 
			
			if(rs.next()){   */ %>
			//	alert("이미 사용중인 아이디 입니다.다시 입력하세요.");
		<%// }else{  %>
		//		alert("사용 가능한 아이디입니다.");
			
		<%//	} %>
			
	//	}
//	} 
	
	
	function check_id(){
		var fr = document.getElementById("my_form");
		if(fr.id.value.length==0){
			alert("입력된 아이디가 없습니다.");
			fr.id.focus();
		}else
			window.open("./idCheck.jsp?id="+fr.id.value,"width=50, height=20");
		
	} 
	function check_pwd() {
        var fr = document.getElementById("my_form");
        if (fr.password.value != fr.password2.value) {
            alert('password가 일치하지 않습니다.');
            fr.password2.value = "";
        }
    }
	
	function check() {
		 var fr = document.getElementById("my_form");
           if (fr.id.value.length == 0) {
               alert('아이디를 입력하세요.');
               fr.id.focus();
               return false;
           }
           
           if (fr.password.value.length == 0) {
               alert('비밀번호를 입력하세요.');
               fr.password.focus();
               return false;
           }
           if (fr.password2.value.length == 0) {
               alert('비밀번호 확인을 입력하세요.');
               fr.password2.focus();
               return false;
           }
           
           if (fr.password.value!=fr.password2.value) {
               alert('비밀번호 확인을 다시 입력하세요.');
               fr.password2.focus();
               return false;
           }
           
           if (fr.name.value.length == 0) {
               alert('이름을 입력하세요.');
               fr.name.focus();
               return false;
           }
           
           if (fr.grade.value.length == 0) {
               alert('학년을 선택하세요.');
               fr.grade.focus();
               return false;
           }
           
           if (fr.email.value.length == 0) {
               alert('이메일을 입력하세요.');
               fr.email.focus();
               return false;
           }

           if (fr.phone.value.length == 0) {
               alert('핸드폰 번호를 입력하세요.');
               fr.phone.focus();
               return false;
           }
	}
	</script>
	
</head>
<body>
<h1>회원 가입 입력</h1>
<form id="my_form" action="index.jsp?contentPage=attend_fine/register.jsp" method="post">
<table width="600" border="1" cellspacing="0" cellpadding="3" align="center">
<tr> 
    <td colspan="2" height="39" align="center">
       <font size="+1" ><b>회원가입</b></font></td>
</tr>
<tr>
  <td>ID</td>
  <td align=left><input type="text" name="id" size="15" ><input type="button" value="ID중복확인" onclick="return check_id()"></td>
</tr>
<tr>
  <td>비밀번호</td>
  <td align=left><input type="password" name="password" size="10"></td>
</tr>
<tr>
  <td>비밀번호 확인</td>
  <td align=left><input type="password" name="password2" size="10" onblur="check_pwd()"></td>
</tr>
<tr>
  <td>이름</td>
  <td colspan="3" align=left><input type="text" name="name" size="15"></td>
</tr>
<tr>
  <td>학년</td>
  <td colspan="3" align=left><input type="text" name="grade" size="2">학년</td>
</tr>
<tr>
  <td>이메일</td>
  <td colspan="3" align=left><input type="text" name="email" size="30"></td>
</tr>
<tr>
  <td>핸드폰번호</td>
  <td colspan="3" align=left><input type="text" name="phone" size="30"></td>
</tr>
<tr>
  <td colspan="4" align="center">
  <input type="submit" value="회원가입" onclick="return check()">
  <input type="reset" value="취소하기">
  </td>
</tr>
</table>
<a href="index.jsp?contentPage=attend_fine/memberlist.jsp">회원 목록 보기</a>
</form>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br>
</body>
</html>
