<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="web.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="board" class="web.bean.Board" />
<%
	request.setCharacterEncoding("utf-8");

		String boardn = request.getParameter("board"); 

		String update_idx = request.getParameter("idx");
		// 데이터베이스 커넥션 생성
		Connection conn = ConnectionContext.getConnection();
		
		// Statement 생성
		Statement stmt = conn.createStatement();		
		
		String strSQL = "SELECT * FROM board WHERE idx='"+update_idx+"'";
		ResultSet rs = stmt.executeQuery(strSQL);
		// DB에서 가져온 값을 mebmer bean에 저장
		if(rs.next()) {			
			board.setSubject(rs.getString("subject"));	
			board.setName(rs.getString("name"));	
			board.setContent(rs.getString("content"));
			board.setGrade(rs.getString("grade"));	
			board.setAccept(rs.getString("accept"));	
		}
	
		rs.close();		
%>
<html>
<head>
	<title>게시글 수정 폼</title>
	<style>
		td.head {background: pink; font-weight: bold; text-align: center;}
	</style>
</head>
<body>
게시글수정
<form action="index.jsp?contentPage=board/update_ok.jsp?idx=<%=update_idx%>&board=<%=boardn%>" method="post">
	<table width="750">
        <tr><td class="head">학년</td>
            <td><select name="grade"><option value=<%=board.getGrade()%>><%=board.getGrade()%></option><option value='2학년'>2학년</option>
                <option value='3학년'>3학년</option><option value='4학년'>4학년</option>
                </select></td>
                <td class="head" width="100">성공여부</td>
                <td><select name="accept"><option value=<%=board.getAccept()%>><%=board.getAccept()%></option>
                <option value='Accept'>Accept</option><option value='Unaccept'>Unaccept</option>
                </select></td><tr/>
		<tr><td class="head">제목</td><td colspan="3"><input type="text" name="subject" size="60" value=<%=board.getSubject()%>></td><tr/>
        <tr><td class="head">작성자</td><td colspan="3"><input type="text" name="name" size="20" value=<%=board.getName()%>></td><tr/>
        <tr><td class="head">비밀번호</td><td colspan="3"><input type="password" name="password" size="20"></td><tr/>
		<tr><td class="head">내용</td><td colspan="3"><textarea name="content" rows="20" cols="60"><%=board.getContent()%></textarea></td></tr>
		<tr>
		  <td colspan="4" align="center">
		  <input type="hidden" name="idx" value=<%=request.getParameter("idx") %>>
		  <input type="submit" value="수정완료">
		  <input type="reset" value="작성취소">
		  </td>
		</tr>
	</table>
	</form>
</body>
</html>
