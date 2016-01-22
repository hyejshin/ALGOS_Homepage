<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="web.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="member" class="web.bean.Member" />
<%
		String update_id = request.getParameter("id");
		// 데이터베이스 커넥션 생성
		Connection conn = ConnectionContext.getConnection();

		// Statement 생성
		Statement stmt = conn.createStatement();		
		
		String strSQL = "SELECT * FROM member WHERE id='"+update_id+"'";
		ResultSet rs = stmt.executeQuery(strSQL);
		// DB에서 가져온 값을 mebmer bean에 저장
		if(rs.next()) {		
			member.setId(rs.getString("id"));	
			member.setPassword(rs.getString("password"));
		}
		rs.close();		
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인(삭제)</title>
<STYLE>
	@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	table {text-align: center}
	tr.head {background: pink; font-weight: bold; text-align: center}
	body { font-family: "Hanna";}
	h1 {color: darkturquoise;}
</STYLE>
</head>
<body>
<h1>비밀번호 확인(삭제)</h1>
	*비밀 번호 <font color="red">일치</font>시 <font color="red">회원정보삭제</font>창으로</font><br/>
	*비밀 번호 <font color="red">불일치</font>시 <font color="red">회원목록</font>창으로</font>
	<form id="my_form" action="index.jsp?contentPage=attend_fine/deleteCheckConfirm.jsp" method="post">
		<table width="600" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td colspan="2" height="39" align="center"><font size="+1">
				<b>비밀 번호 확인</b></font></td>
			</tr>
			<tr>
			  <td>ID</td>
			  <td align="left"><input type="text" name="id" size="10" value=<%=member.getId()%> ></td>
			  </tr>
			<tr>
				<td>비밀번호</td>
				<td align="left"><input type="password" name="password" size="10"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
	<a href="index.jsp?contentPage=attend_fine/memberlist.jsp">회원 목록 보기</a>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br>
</body>
</html>