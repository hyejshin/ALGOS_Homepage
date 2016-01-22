<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<%@ page import="web.util.ConnectionContext" %>
<% request.setCharacterEncoding("utf-8"); %>

<HTML>
<HEAD>
<TITLE> 일정관리 </TITLE>

<script language="javascript">
<!--
function send(form)
{
form.submit();
}
-->
</script>

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

<center><font size='5'><b><%=year%>년 <%=month%>월 <%=day%>일 일정 내용</b>
        </font></p>

<TABLE border='0' width='800' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE> 
<br>

<FORM Name="calendar1" Method="post" Action="./calendar/edit_ok.jsp?&year=<%=year%>&month=<%=month%>&day=<%=day%>&no=<%=no%>">
<TABLE border='1' width='800' cellpadding='0' cellspacing='0'>
    	<TR>
       		<TD bgcolor='cccccc' width='100' height='30'><p align='center'>
		<input type='hidden' name='cp_type' value='input'>            
		<font size='2'><b>제 목</b></font></TD>
        	<TD bgcolor='ededed'>
        	<input type="text" name="title" maxlength="20" 
                size="38" value='<%=rs.getString("title")%>'> </TD>
    	</TR>
   	<TR>
        	<TD bgcolor='cccccc' width='100' height='30'><p align='center'>
        	<font size='2'><b>일 자</b></font></TD>
        	<TD bgcolor='ededed'>
        	<font size='2'><b><%=year%>년 <%=month%>월 <%=day%>일</b>
         	</font></TD>
   	</TR>
  	<TR>
        	<TD bgcolor='cccccc' width='100' height='30'><p align='center'>
        	<font size='2'><b>시 간</b></font></TD>
        	<TD bgcolor='ededed'>
        	<input type='text' size='5' maxlength='5' 
                name='s_time' value='<%=rs.getString("s_time")%>'> ▶  
        	<input type='text' size='5' maxlength='5' 
                name='e_time' value='<%=rs.getString("e_time")%>'>
        	</TD>
 	</TR>
 	<TR>
       		<TD bgcolor='cccccc' width='100' height='30'><p align='center'>
        	<font size='2'><b>장 소</b></font></TD>
        	<TD bgcolor='ededed'>
        	<input type="text" name="position" maxlength="40" 
                size="38" value='<%=rs.getString("position")%>'> </td>
    	</TR>
 	<TR>
        	<TD height='118' bgcolor='cccccc'><p align='center'>
        	<font size='2'><b>내 용</b></font></TD>
        	<TD height='118' bgcolor='ededed'><p>
        	<textarea name='content' rows='5' cols='70'><%=rs.getString("content")%></textarea> </TD>
    	</TR>
</TABLE>
<br>

<TABLE border='0' cellpadding='0' cellspacing='0' width='800'>  
    	<TR>  
    		<TD height='40' colspan='2'><p align='center'>
           	<input type='button' value='수정하기' OnClick="send(this.form)"> 
           	<input type='reset' value='돌아가기' OnClick="javascript:history.back()"></TD>
    	</TR>
</TABLE>
</FORM>

<%
rs.close();
stmt.close();
conn.close();
%>

</BODY>
</HTML> 
