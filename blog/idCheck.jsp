<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="web.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="member" class="web.bean.Member" />
<%
		String id = request.getParameter("id");

		// 데이터베이스 커넥션 생성
		Connection conn = ConnectionContext.getConnection();

		// Statement 생성
		Statement stmt = conn.createStatement();		
		
		String strSQL = "SELECT * FROM member WHERE id='"+id+"'";
		ResultSet rs = stmt.executeQuery(strSQL);
		// DB에서 가져온 값을 mebmer bean에 저장
 %>
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 체크</title>
<STYLE>
	@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	table {text-align: center}
	tr.head {background: pink; font-weight: bold; text-align: center}
	body { font-family: "Hanna";}
	h1 {color: darkturquoise;}
</STYLE>
<script>
	function checkClose(id){
		window.close();
		open.writeForm.password.focus();
	}
</script>
</head>
<body>
	<form>
	<%
	if(rs.next()){
	%>
	<h2 align="center"> <%=id %>는 이미  <font color="red">사용중</font>입니다.<br/>
	다시 입력하세요.<br/>
		<input type="button" value="돌아가기" onClick="javascript:checkClose('<%=id%>')" ></h2>
	<%
	}else{
	%>
		<h2 align="center"><%=id %> 사용 <font color="red">가능</font><br/>
		<input type="button" value="현재 아이디 선택" onClick="javascript:checkClose('<%=id%>')" ></h2>
	<%
	}
	%>
	
	</form>
</body>
</html>