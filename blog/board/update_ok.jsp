<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="web.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");

	String update_idx = request.getParameter("idx");
	String boardn = request.getParameter("board");
	String input = request.getParameter("password");
	String password = "";
	
	String grade = request.getParameter("grade");
	String accept = request.getParameter("accept");
	String subject = request.getParameter("subject");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	// 데이터베이스 커넥션 생성
	String url = "jdbc:mysql://203.252.202.75:3306/algosdb";        
	String id = "algosdbuser";                                       
	String pw = "algos";     

	Class.forName("com.mysql.jdbc.Driver");  
	Connection conn = DriverManager.getConnection(url, id, pw);

	// Statement 생성
	Statement stmt = conn.createStatement();
	ResultSet rs = null;
			
	String strSQL = "SELECT password FROM board WHERE idx="+update_idx;
	rs = stmt.executeQuery(strSQL);
	if(rs.next()){
		password = rs.getString("password");
	}

	if(password.equals(input)) {
		String sql = "UPDATE board SET subject='" + subject + "', name='" + name + 
				"', content='" + content +"', grade='" + (boardn+"학년")+"', accept='" + accept +
				"', content='" + content +"'WHERE idx='"+update_idx+"'";   
		PreparedStatement pstmt = conn.prepareStatement(sql);				
		pstmt.executeUpdate();
		
	} else
		{%>
		<script language=javascript>
		 	self.window.alert("비밀번호를 틀렸습니다.");
			location.href="javascript:history.back()";
		</script>
	<%}
	
%>

<html>
<head>
	<title>수정 처리</title>
	<style>
		td.head {background: pink; font-weight: bold; text-align: center}
		h1 {color: skyblue;}
		a {text-align: center;}
		div#space {margin-bottom: 600px;}
	</style>
</head>
<body>
	<h1>게시글 수정 처리 완료</h1>
<a href="index.jsp?contentPage=board/<%=boardn%>Boardlist.jsp">목록 보기</a>
<div id="space"></div>
</body>
</html>