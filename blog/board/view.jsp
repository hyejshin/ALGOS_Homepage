<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="web.util.ConnectionContext"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
%>

<html>
<head>
<title>게시글 열람</title>
<style>
	td.head {background: pink; font-weight: bold; text-align: center;}
</style>
</head>
<body>
	게시글 보기
	<br />
<%
	String board = request.getParameter("board");
	String view_idx = request.getParameter("idx");
	String pageNum = request.getParameter("pageNum");

	//데이터베이스 커넥션 생성
	Connection conn = ConnectionContext.getConnection();
	// Statement 생성
	Statement stmt = conn.createStatement();
	String strSQL = "SELECT * FROM board where idx='"+view_idx+"'";  
	ResultSet rs = stmt.executeQuery(strSQL);
	rs.next();
	
	int visitor = rs.getInt("readCnt");
	visitor = visitor+1;
	
	String grade = rs.getString("grade");
	String accept = rs.getString("accept");
%>
	<table>
		<tr>
			<td class="head">학년</td>
			<td width="200"><%=rs.getString("grade")%></td>
			<td class="head">성공여부</td>
			<td><%=rs.getString("accept")%></td>
		<tr />
		<tr>
			<td class="head">제목</td>
			<td colspan="3"><%=rs.getString("subject")%></td>
		<tr />
        <tr>
			<td class="head">작성자</td>
			<td><%=rs.getString("name")%></td>
			
			<td class="head">작성날짜</td>
			<td><%=rs.getDate("writeDate")%></td>
		<tr />
		<tr>
			<td class="head">내용</td>
			<td colspan="3"><textarea name="content" rows="20" cols="60" readonly><%=rs.getString("content")%></textarea></td>
		</tr>
		<tr>
			<td colspan="4" width="399">
				<input type=button value="글쓰기" OnClick="window.location='index.jsp?contentPage=board/writeForm.jsp&board=<%=board%>'">
				<input type=button value="답글" OnClick="window.location='index.jsp?contentPage=board/reply.jsp?idx=<%=view_idx%>&accept=<%=accept%>&board=<%=board%>'">
				<input type=button value="목록" OnClick="window.location='index.jsp?contentPage=board/<%=board%>Boardlist.jsp?pageNum=<%=pageNum%>'">
				<input type=button value="수정" OnClick="window.location='index.jsp?contentPage=board/updateForm.jsp?idx=<%=view_idx%>&board=<%=board%>'">
				<input type=button value="삭제" OnClick="window.location='index.jsp?contentPage=board/delete.jsp?idx=<%=view_idx%>&pageNum=<%=pageNum%>&board=<%=board%>'">
      		</td>
      	</tr>
	</table>
<%
	rs.close();
	stmt.close();
	
	String sql = "UPDATE board SET readCnt='" + visitor + "'where idx='"+view_idx+"'";
	PreparedStatement pstmt = conn.prepareStatement(sql);				
	pstmt.executeUpdate();
	
%>
	
	
	<!--  댓글  -->
	<br>
	<form name='command' Action='index.jsp?contentPage=board/command.jsp?id=<%=view_idx%>&pageNum=<%=pageNum%>&board=<%=board%>' Method='post'>

	<table width='750'>
		<tr>
			<td width='100' class="head">작성자</td>
			<td><input type='text' size='12' name='name' ></td>
		</tr>
		<tr>
			<td class="head">댓글달기</td>
			<td><input type='text' size='62' name='command' >  <input type = 'Submit'  value = '댓글등록'></td>
		</tr>
	</table>
	</form>
<%
	stmt = conn.createStatement();
	strSQL = "SELECT * FROM boardCmd WHERE id = " + view_idx;
	rs = stmt.executeQuery(strSQL); 
	
	while(rs.next()){ 
	%>
	<table border='0' width='700' cellpadding='2' cellspacing='2'>
		<tr>     
			 <td class="head" width='100'><b><%=rs.getString("name")%></b></td>
			 <td><%=rs.getString("command")%></td>
			 <td width='150'><%=rs.getDate("writeDate")%></td>          
		</tr> 
		<% } %>
	</table>




</body>
</html>
