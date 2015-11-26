<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="web.util.ConnectionContext"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");

	Connection conn = ConnectionContext.getConnection();
	try {
		PreparedStatement pstmt = conn
				.prepareStatement("INSERT INTO board(name,password,subject,content,writeDate,grade,accept)"
						+ " values (?,?,?,?,?,?,?)");
		pstmt.setString(1, request.getParameter("name"));
		pstmt.setString(2, request.getParameter("password"));
		pstmt.setString(3, request.getParameter("subject"));
		pstmt.setString(4, request.getParameter("content"));
		pstmt.setDate(5, new java.sql.Date((new Date()).getTime()));
		pstmt.setString(6, (request.getParameter("grade")+"학년"));
		pstmt.setString(7, request.getParameter("accept"));
		pstmt.executeUpdate();
	} catch(SQLException e) {
		out.println( e.toString() );
		}
	
	//현제 idx를 불러와서 pidx에 저장
	try {
		Statement stmt = conn.createStatement();
		String sql = "SELECT MAX(idx) FROM board";
		ResultSet rs = stmt.executeQuery(sql);

		int num=1;
		if(rs.next()){
			num=rs.getInt(1);
		}
		stmt.close();
		
		sql = "UPDATE board SET pidx='" + num + "'where idx='"+num+"'";
		PreparedStatement pstmt = conn.prepareStatement(sql);				
		pstmt.executeUpdate();
		
	} catch(SQLException e) {
		out.println( e.toString() );
		}
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시글 등록 처리</title>
<style>
	td.head {background: pink; font-weight: bold; text-align: center;}
</style>
</head>
<body>
	게시글 등록 처리 완료
	<br />
	<table>
		<tr>
			<td class="head">학년</td>
			<td width="200"><%=request.getParameter("grade")%>학년</td>
			<td class="head">성공여부</td>
			<td><%=request.getParameter("accept")%></td>
		<tr />
		<tr>
			<td class="head">제목</td>
			<td colspan="3"><%=request.getParameter("subject")%></td>
		<tr />
        <tr>
			<td class="head">작성자</td>
			<td><%=request.getParameter("name")%></td>
			
			<td class="head">작성날짜</td>
			<td><%= new Date() %></td>
		<tr />
		<tr>
			<td class="head">내용</td>
			<td colspan="3"><textarea name="content" rows="20" cols="60" readonly><%=request.getParameter("content")%></textarea></td>
		</tr>
	</table>
	<%String board = request.getParameter("board"); %>
<a href="index.jsp?contentPage=board/<%=board%>Boardlist.jsp?board=<%=board%>">게시글 목록 보기</a>
</body>
</html>
