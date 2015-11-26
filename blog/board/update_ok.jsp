<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="web.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="web.bean.Board" />
<jsp:setProperty name="board" property="*" />
<%
	String update_idx = request.getParameter("idx");
	String boardn = request.getParameter("board");
	String input = request.getParameter("password");
	String password = "";
	
	Connection conn = ConnectionContext.getConnection();
	Statement stmt = conn.createStatement();
	String strSQL = "SELECT password FROM board WHERE idx="+update_idx;
	ResultSet rs = stmt.executeQuery(strSQL);
	if(rs.next()){
		password = rs.getString(1);
	}
	System.out.println(password);
	if(password.equals(input)) {
		String sql = "UPDATE board SET subject='" + board.getSubject() + "', name='" + board.getName() + 
				"', content='" + board.getContent()+"', grade='" + (boardn+"학년")+"', accept='" + board.getAccept()+
				"', content='" + board.getContent()+"'WHERE idx='"+update_idx+"'";   
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
	</style>
</head>
<body>
	게시글 수정 처리 완료 <br/>
	<table>
		<tr>
			<td class="head">학년</td>
			<td width="200"><%=boardn%>학년</td>
			<td class="head">성공여부</td>
			<td><jsp:getProperty name="board" property="accept" /></td>
		<tr />
		<tr>
			<td class="head">제목</td>
			<td colspan="3"><jsp:getProperty name="board" property="subject" /></td>
		<tr />
        <tr>
			<td class="head">작성자</td>
			<td><jsp:getProperty name="board" property="name" /></td>
			
			<td class="head">작성날짜</td>
			<td><jsp:getProperty name="board" property="writeDate" /></td>
		<tr />
		<tr>
			<td class="head">내용</td>
			<td colspan="3"><textarea name="content" rows="20" cols="60" readonly><jsp:getProperty name="board" property="content" /></textarea></td>
		</tr>
	</table>
<a href="index.jsp?contentPage=board/<%=boardn%>Boardlist.jsp">목록 보기</a>
</body>
</html>
