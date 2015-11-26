<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="web.util.ConnectionContext"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
	String update_idx = request.getParameter("idx");
	String board = request.getParameter("board");

	try {	
		Connection conn = ConnectionContext.getConnection();	
		PreparedStatement pstmt = conn
				.prepareStatement("INSERT INTO board(pidx,name,password,subject,content,writeDate,grade,accept,indent)"
						+ " values (?,?,?,?,?,?,?,?,?)");
		pstmt.setInt(1, Integer.parseInt(update_idx));
		pstmt.setString(2, request.getParameter("name"));
		pstmt.setString(3, request.getParameter("password"));
		pstmt.setString(4, request.getParameter("subject"));
		pstmt.setString(5, request.getParameter("content"));
		pstmt.setDate(6, new java.sql.Date((new Date()).getTime()));
		pstmt.setString(7, (request.getParameter("grade")+"학년"));
		pstmt.setString(8, request.getParameter("accept"));
		pstmt.setInt(9, 1);
		pstmt.executeUpdate();
	} catch(SQLException e) {
		out.println( e.toString() );
		}
		
%>

<html>
<head>
<title>게시글 등록 처리</title>
<style>
	td.head {background: pink; font-weight: bold; text-align: center}
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
<a href="index.jsp?contentPage=board/<%=board%>Boardlist.jsp">게시글 목록 보기</a>
</body>
</html>
