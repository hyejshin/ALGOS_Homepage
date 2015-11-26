<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="web.util.ConnectionContext"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시글 삭제</title>
<style>
	td.head {background: pink; font-weight: bold; text-align: center}
</style>
<script>
	function check(){
		var fr = document.getElementById("my_form");
		if(fr.input.value<1){
			alert("비밀번호를 입력하세요.");
			fr.input.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	게시글 삭제
	<br />
<%
	String view_idx = request.getParameter("idx");
	String pageNum = request.getParameter("pageNum");
	String board = request.getParameter("board");

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
	<form id="my_form" action="index.jsp?contentPage=board/delete_ok.jsp?board=<%=board%>" method="post" onsubmit="return check();">
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
				<input type="hidden" name="idx" value="<%=view_idx%>">
				<input type="hidden" name="pageNum" value="<%=pageNum%>">
				비밀번호: <input type="text" name="input">
				<input type="submit" value="확인">
      		</td>
      	</tr>
	</table>
	</form>
<%
	rs.close();
	stmt.close();
	
	String sql = "UPDATE board SET readCnt='" + visitor + "'where idx='"+view_idx+"'";
	PreparedStatement pstmt = conn.prepareStatement(sql);				
	pstmt.executeUpdate();
	
%>





</body>
</html>
