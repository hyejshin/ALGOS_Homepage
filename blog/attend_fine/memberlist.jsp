<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="web.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> 회원 목록 </TITLE>
<STYLE>
	@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	table {text-align: center}
	tr.head {background: pink; font-weight: bold; text-align: center}
	body { font-family: "Hanna";}
	h1 {color: darkturquoise;}
</STYLE>
</HEAD>
<BODY>
<H1>회원 목록</H1>
<a href="index.jsp?contentPage=attend_fine/registerForm.jsp">회원추가</a>
<table  border="1" cellspacing="0" cellpadding="3" align="center">
<tr> 
    <td colspan="7" height="39" align="center">
       <font size="+1" ><b>회원 관리 화면</b></font></td>
</tr>
<TR>
	<TD> 아이디 </TD>
	<TD> 이름 </TD>
	<TD> 학년 </TD>
	<TD> 이메일 </TD>
	<TD> 핸드폰번호 </TD>
	<TD> 가입날짜 </TD>
	<TD> 관리 </TD>	
</TR>
<%
	try{
		// 데이터베이스 커넥션 생성
		Connection conn = ConnectionContext.getConnection();

		// Statement 생성
		Statement stmt = conn.createStatement();
		
		// ReseltSet의 레코드 수를 lastRow 변수에 저장
		String strSQL = "SELECT count(*) FROM member";
		ResultSet rs = stmt.executeQuery(strSQL);
		if(rs.next())
			lastRow = rs.getInt(1);
		rs.close();
		
		// ResultSet에 레코드가 존재할 때
		if(lastRow > 0) {
			strSQL = "SELECT * FROM member";
			rs = stmt.executeQuery(strSQL);				
			for(i=1;rs.next(); i++){
				if(i >= startRow && i <=endRow){
%>
				<TR>
					<TD><%=rs.getString("id") %></TD>
					<TD><%=rs.getString("name") %></TD>
					<TD><%=rs.getString("grade") %></TD>
					<TD><%=rs.getString("email") %></TD>
					<TD><%=rs.getString("phone") %></TD>					
					<TD><%=rs.getDate("registerDate") %></TD>
					<TD><a href=index.jsp?contentPage=attend_fine/updateCheck.jsp?id=<%=rs.getString("id")%>>수정</a> 
					<a href=index.jsp?contentPage=attend_fine/deleteCheck.jsp?id=<%=rs.getString("id")%>>삭제</a></TD>
				</TR>
<%						row++;
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
		<a href="index.jsp?contentPage=attend_fine/memberlist.jsp?pageNum=<%=currentPage-1%>">[이전]</a>
<%
		}
		// 레코드 수에 따라 쪽번호를 매긴다.	
		while(setPage <= lastPage) {
%>
		<a href="index.jsp?contentPage=attend_fine/memberlist.jsp?pageNum=<%=setPage%>">[<%=setPage%>]</a>
<%
			setPage = setPage + 1;
		}
	
		// 현재 쪽번호에 따라 다음 쪽의 번호를 파라메터로 넘겨준다.
		if(lastPage > currentPage) {
%>
		<a href="index.jsp?contentPage=attend_fine/memberlist.jsp?pageNum=<%=currentPage+1%>">[다음]</a>
<%
		}
	}
%>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br>
</BODY>
</HTML>