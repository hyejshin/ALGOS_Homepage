<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="web.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 삭제</title>
<STYLE>
	@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	table {text-align: center}
	tr.head {background: pink; font-weight: bold; text-align: center}
	body { font-family: "Hanna";}
	h1 {color: darkturquoise;}
</STYLE>
</head>
<body>
<%
	String update_id = request.getParameter("id");

	Connection conn = ConnectionContext.getConnection();
	String sql = "delete from member where id='"+update_id+"'";     
	PreparedStatement pstmt = conn.prepareStatement(sql);				
	pstmt.executeUpdate();
	
	sql = "delete from attend where id='"+update_id+"'";     
	pstmt = conn.prepareStatement(sql);				
	pstmt.executeUpdate();
%>   
<h1>회원정보 삭제 완료 </h1>
<a href="index.jsp?contentPage=attend_fine/memberlist.jsp">회원 목록 보기</a>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>