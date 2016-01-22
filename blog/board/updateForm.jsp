<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="web.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>게시글 수정 폼</title>
	<style>
		td.head {background: pink; font-weight: bold; text-align: center;}
		h1 {text-align: center; color: skyblue;}
		div#space {margin-bottom: 200px;}
	</style>
</head>
<%
	request.setCharacterEncoding("utf-8");

	String boardn = request.getParameter("board"); 

	String update_idx = request.getParameter("idx");

	// 데이터베이스 커넥션 생성
	String url = "jdbc:mysql://203.252.202.75:3306/algosdb";        
	String id = "algosdbuser";                                       
	String pw = "algos";     

	Class.forName("com.mysql.jdbc.Driver");  
	Connection conn = DriverManager.getConnection(url, id, pw);

	// Statement 생성
	Statement stmt = conn.createStatement();
	ResultSet rs = null;	
	
	String strSQL = "SELECT * FROM board WHERE idx='"+update_idx+"'";
	rs = stmt.executeQuery(strSQL);
	rs.next();
%>
<script language=javascript>
	function goback(){
		location.href="javascript:history.back()";
	}
</script>

<body>
<h1>게시글수정</h1>
<form action="index.jsp?contentPage=board/update_ok.jsp?idx=<%=update_idx%>&board=<%=boardn%>" method="post">
	<table width="750">
        <tr><td class="head">학년</td>
            <td><select name="grade"><option value=<%=rs.getString("grade")%>><%=rs.getString("grade")%></option><option value='2학년'>2학년</option>
                <option value='3학년'>3학년</option><option value='4학년'>4학년</option>
                </select></td>
                <td class="head" width="100">성공여부</td>
                <td><select name="accept"><option value=<%=rs.getString("accept")%>><%=rs.getString("accept")%></option>
                <option value='Accept'>Accept</option><option value='Unaccept'>Unaccept</option>
                </select></td><tr/>
		<tr><td class="head">제목</td><td colspan="3"><input type="text" name="subject" size="60" value=<%=rs.getString("subject")%>></td><tr/>
        <tr><td class="head">작성자</td><td colspan="3"><input type="text" name="name" size="20" value=<%=rs.getString("name")%>></td><tr/>
        <tr><td class="head">비밀번호</td><td colspan="3"><input type="password" name="password" size="20"></td><tr/>
		<tr><td class="head">내용</td><td colspan="3"><textarea name="content" rows="20" cols="60"><%=rs.getString("content")%></textarea></td></tr>
		<tr>
		  <td colspan="4" align="center">
		  <input type="hidden" name="idx" value=<%=request.getParameter("idx") %>>
		  <input type="submit" value="수정완료">
		  <input type="button" value="작성취소" onClick="goback();">
		  </td>
		</tr>
	</table>
</form>
<%
	rs.close();
	stmt.close();
%>
<div id="space"></div>
</body>
</html>
