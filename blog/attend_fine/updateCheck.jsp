<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="web.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@page import="java.util.*" %>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 일치 확인</title>
<STYLE>
	@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	table {text-align: center}
	tr.head {background: pink; font-weight: bold; text-align: center}
	body { font-family: "Hanna";}
	h1 {color: darkturquoise;}
</STYLE>
</head>
<body>
<h1>비밀번호 일치 확인</h1>
	*비밀 번호 <font color="red">일치</font>시 <font color="red">회원정보 수정</font>창으로</font><br/>
	*비밀 번호 <font color="red">불일치</font>시 <font color="red">회원목록</font>창으로</font>
	<form id="my_form" action="index.jsp?contentPage=attend_fine/updateCheckConfirm.jsp" method="post">
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
<br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>