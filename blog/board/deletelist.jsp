<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="web.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
</head>
<body>
<%
	String delete_idx = request.getParameter("idx");

	Connection conn = ConnectionContext.getConnection();
	String sql = "delete from board where idx='"+delete_idx+"'";     
	PreparedStatement pstmt = conn.prepareStatement(sql);				
	pstmt.executeUpdate();
%>   
<h1>게시글 삭제 완료 </h1>

<a href="index.jsp?contentPage=./board/boardlist.jsp">게시글 목록 보기</a>
</body>
</html>