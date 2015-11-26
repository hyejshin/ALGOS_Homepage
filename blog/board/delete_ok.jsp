<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="web.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
<%
	String board = request.getParameter("board");
	String delete_idx = request.getParameter("idx");
	String pageNum = request.getParameter("pageNum");
	String input = request.getParameter("input");
	String password = "";
	
	Connection conn = ConnectionContext.getConnection();
	try{
		Statement stmt = conn.createStatement();
		String strSQL = "SELECT password FROM board WHERE idx="+delete_idx;
		ResultSet rs = stmt.executeQuery(strSQL);
		if(rs.next()){
			password = rs.getString(1);
		}
		if(password.equals(input)) {
			//해당글 지우기
			String sql = "delete from board where idx='"+delete_idx+"'";     
			PreparedStatement pstmt = conn.prepareStatement(sql);				
			pstmt.executeUpdate();
			
			//답글 지우기
			sql = "SELECT * FROM board WHERE pidx="+delete_idx;
			rs = pstmt.executeQuery(sql);
			for(int i=1; rs.next(); i++){
				sql = "delete from board where pidx='"+delete_idx+"'";     
				pstmt = conn.prepareStatement(sql);				
				pstmt.executeUpdate();
			}
		} else{%>
			<script language=javascript>
			 self.window.alert("비밀번호를 틀렸습니다.");
			location.href="javascript:history.back()";
			</script>
		<%}
	} catch(SQLException e) {
		out.println( e.toString() );
		}
%>
<script>


</script>

</head>
<body>
  
<h1>게시글 삭제 완료 </h1>
<a href="index.jsp?contentPage=board/<%=board%>Boardlist.jsp?">게시글 목록 보기</a>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>