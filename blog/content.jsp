<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<%@ page import="web.util.ConnectionContext" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> 일정관리 </TITLE>

<script language="javascript">

function send(form)
{
	form.submit();
}

function send1(no)
{
	ans = confirm(" 정말 삭제하시겠습니까?");
	if(ans==true){
		location.href="./del.jsp?&no="+no
	} else {
		return false;
	} 
}

</script>
<style type='text/css'>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
h1{
  font-family:'hanna';
}
</style>
</HEAD>

<BODY>

<%
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String no = request.getParameter("no");
        

String url = "jdbc:mysql://203.252.202.75:3306/algosdb";        
String id = "algosdbuser";                                       
String pw= "algos";  
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn = DriverManager.getConnection(url,id,pw);

Statement stmt = conn.createStatement();

String strSQL = "SELECT * FROM calendar WHERE no=" + no;
ResultSet rs = stmt.executeQuery(strSQL);

rs.next();       
%>

<center><h1><%=year%>년 <%=month%>월 <%=day%><span>일 일정 내용</span></h1>

<br>

<FORM Name='calendar1' method='post' action='index.jsp?contentPage=./edit.jsp?&year=<%=year%>&month=<%=month%>&day=<%=day%>&no=<%=no%>'>
<TABLE border='1' width='500' cellpadding='2' cellspacing='3'>
    	<TR border='0'>
        	<TD bgcolor='lightgreen' width='100' height='10px'><p align='center'>
		<input type='hidden' name='cp_type' value='input'>            
		<font size='2'><b>제 목</b></font></TD>
        	<TD bgcolor='white'>
        	<font size='2'><b><%=rs.getString("title")%></TD>
    	</TR>
    	<TR border='0'>
        	<TD bgcolor='lightgreen' width='100' height='10px'><p align='center'>
        	<font size='2'><b>일 자</b></font></TD>
        	<TD bgcolor='white'>
        	<font size='2'>
         	<b><%=year%>년 <%=month%>월 <%=day%>일</b></font></TD>
    	</TR>
    	<TR border=0>
        	<TD bgcolor='lightgreen' width='100' height='10px'><p align='center'>
        	<font size='2'><b>시 간</b></font></TD>
        	<TD bgcolor='white'>
        	<font size='2'><b><%=rs.getString("s_time")%> ▶ <%=rs.getString("e_time")%></TD>
    	</TR>
    	<TR border=0>
        	<TD bgcolor='lightgreen' width='100' height='30px'><p align='center'>
        	<font size='2'><b>장 소</b></font></TD>
        	<TD bgcolor='white'>
        	<font size='2'><b><%=rs.getString("position")%></TD>
    	</TR>
    	<TR border=0>
        	<TD height='118' bgcolor='pink'><p align='center'>
        	<font size='2'><b>내 용</b></font></TD>
        	<TD height='118' bgcolor='white'><p>
		<font size='2'><b><%=rs.getString("content")%> </TD>
    	</TR>
</TABLE>
<br>

<TABLE border='0' cellpadding='0' cellspacing='0' width='700'>  
    	<TR>    
        	<TD height='40' colspan='2'><p align='center'>
            	<input type='button' value='일정수정' onclick='send(this.form)'>
            	<input type='button' value='일정삭제' onclick="send1('<%=no%>')">
            	<input type='reset' value='돌아가기' onclick='javascript:history.back()'>
                  </TD>
    	</TR>
</TABLE>
</FORM>
</br></br></br></br></br></br></br></br>

<%
rs.close();
stmt.close();
conn.close();
%>
</body>
</html>
