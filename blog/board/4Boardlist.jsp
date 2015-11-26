<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="web.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	// paginator
	String pageNum = request.getParameter("pageNum");

	if(pageNum == null){
		pageNum = "1";
	}

	int listSize = 10;
	int currentPage = Integer.parseInt(pageNum);
	int nextPage = currentPage + 1;
	int startRow = (currentPage - 1) * listSize + 1;
	int endRow = currentPage * listSize;
	int lastRow = 0;
	int i = 0;
	int num[] = {0};
	int row = startRow;
%>

<HTML>
<HEAD>
<TITLE> 게시판 </TITLE>
<STYLE>
	@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	table {text-align: center}
	tr.head {background: pink; font-weight: bold; text-align: center;}
	body { font-family: "Hanna";}
	h1 {color: darkturquoise;}
</STYLE>
</HEAD>
<BODY>
<H1>4학년 문제 게시판</H1>
    
<a href="index.jsp?contentPage=./board/writeForm.jsp?board=4">글등록</a>
<TABLE align=center border="1" width=700>
<TR class="head">
	<TD> 글 번호 </TD>
	<TD width=200px> 글 제목 </TD>
	<TD> 작성자 </TD>
	<TD> 작성일 </TD>
	<TD> 조회수 </TD>
	<TD> 댓글수 </TD>
</TR>
<%
	try{
		// 데이터베이스 커넥션 생성
		Connection conn = ConnectionContext.getConnection();

		// Statement 생성
		Statement stmt = conn.createStatement();
		
		// ReseltSet의 레코드 수를 lastRow 변수에 저장
		String strSQL = "SELECT count(*) FROM board WHERE grade='4학년'";
		ResultSet rs = stmt.executeQuery(strSQL);
		if(rs.next())
			lastRow = rs.getInt(1);
		rs.close();
		
		// ResultSet에 레코드가 존재할 때
		if(lastRow > 0) {
			strSQL = "SELECT * FROM board WHERE grade='4학년' order by pidx DESC";
			rs = stmt.executeQuery(strSQL);
			int number = lastRow;
			for(i=1;rs.next(); i++){
				if(i >= startRow && i <=endRow){
%>
				<TR>
					<TD><%=number%></TD>
					<TD align="left"><%if(rs.getInt("indent")==1){
							%>&nbsp;<img src='./board/reply_icon.gif' /><%
						}%>
					<a href=index.jsp?contentPage=./board/view.jsp?idx=<%=rs.getInt("idx")%>&pageNum=<%=pageNum%>&board=4><%=rs.getString("subject")%></a></TD>
					<TD><%=rs.getString("name") %></TD>
					<TD><%=rs.getDate("writeDate") %></TD>
					<TD><%=rs.getInt("readCnt") %></TD>
					<TD><%=rs.getInt("commandCnt") %></TD>
				</TR>
<%						number--;
				}
			}
			rs.close();
			stmt.close();
		}
		else
		{
%>
<TR>
	<TD colspan="4"> 레코드 없음 </TD>
</TR>
<%
		}

	}catch(SQLException ex){ 
%>
<TR>
	<TD colspan="4"> 에러: <%=ex %> </TD>
</TR>
<%
	}
%>

</TABLE>
<%
	if(lastRow > 0) {
		// 페이지가 넘어갈 때 넘겨줄 파라미터
		int setPage = 1;
		
		// 마지막 페이지의 번호를 저장
		int lastPage = 0;
		if(lastRow % listSize == 0)
			lastPage = lastRow / listSize;
		else
			lastPage = lastRow / listSize + 1;
		
		if(currentPage > 1) {
%>
		<a href="index.jsp?contentPage=./board/4Boardlist.jsp?pageNum=<%=currentPage-1%>">[이전]</a>
<%
		}
		// 레코드 수에 따라 쪽번호를 매긴다.	
		while(setPage <= lastPage) {
%>
				<a href="index.jsp?contentPage=./board/4Boardlist.jsp?pageNum=<%=setPage%>">[<%=setPage%>]</a>
<%
			setPage = setPage + 1;
		}
	
		// 현재 쪽번호에 따라 다음 쪽의 번호를 파라메터로 넘겨준다.
		if(lastPage > currentPage) {
%>
		<a href="index.jsp?contentPage./board/4Boardlist.jsp?pageNum=<%=currentPage+1%>">[다음]</a>
<%
		}
	}
%>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br>
</BODY>
</HTML>