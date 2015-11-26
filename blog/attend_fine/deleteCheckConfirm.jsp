<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="web.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@page import="java.util.*" %>
<jsp:useBean id="member" class="web.bean.Member" />
<%
		String update_id = request.getParameter("id");
		String password = request.getParameter("password");

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
		
		String nextpage = null;
 %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>업데이트 진행 여부 결정</title>
<STYLE>
	@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	table {text-align: center}
	tr.head {background: pink; font-weight: bold; text-align: center}
	body { font-family: "Hanna";}
	h1 {color: darkturquoise;}
</STYLE>
</head>
<body>
<h1>삭제 가능 여부</h1>
<% if(member.getPassword().equals(password)){ %>
			<%=update_id %>의 비밀번호와 일치합니다.<br/>
			<a href="index.jsp?contentPage=attend_fine/memberDelete.jsp?id=<%=update_id %>">삭제하기</a>
	<% 	}else{  %>
			<%=update_id %>의 비밀번호와 일치하지 않습니다.<br/>
			<a href="index.jsp?contentPage=attend_fine/memberlist.jsp">돌아가기</a>
	<%	}%>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>