<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="web.util.ConnectionContext"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> 게시판 </TITLE>

<SCRIPT language="JavaScript">
function Check()
{
if (Form.keyword.value.length < 1) {
	alert("검색어를 입력하세요.");
	Form.keyword.focus(); 
         return false;
	}
}
</SCRIPT>

<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type='text/css'>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
body{
 font-family:'hanna';
}
h1{
  color: #FF6A6A;
}
<!--
	/*a:hover{font-family:"";color:black;text-decoration:underline;}*/
-->
</style>

</HEAD>
<BODY>

<%
String key = request.getParameter("key");
String keyword = request.getParameter("keyword");

String pageNum = request.getParameter("pageNum");
if(pageNum == null){
	pageNum = "1";	
}

int listSize = 9;
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * listSize + 1;
int endRow = startRow + listSize - 1;
int lastRow = 0;
int i = 0;

String url = "jdbc:mysql://203.252.202.75:3306/algosdb";        
String id = "algosdbuser";                                       
String pw = "algos";     
String strSQL="";

Class.forName("com.mysql.jdbc.Driver");  
Connection conn = DriverManager.getConnection(url, id, pw);

Statement stmt = conn.createStatement();
ResultSet rs = null;

if (key==null || keyword==null){
	strSQL = "SELECT count(*) FROM imgboard";
}else{
	strSQL = "SELECT count(*) FROM imgboard WHERE " +key+ "like '%$keyword%'";
}
rs = stmt.executeQuery(strSQL);
rs.next();
lastRow = rs.getInt(1);

rs.close();
%>
</br>
<center><font size='3'><b><h1>앨 &nbsp;범&nbsp;&nbsp; 게시판</h1> </b></font>
</br>                               
<center><TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='2' noshade>
		</TD>
 	</TR>
</TABLE>    

<TABLE border='0' cellspacing=1 cellpadding=2 width='600'>             
	
<%
if(lastRow > 0) {
	if(key==null || keyword==null){
		strSQL = "SELECT * FROM imgboard WHERE num BETWEEN " + startRow + " and " + endRow;
		rs = stmt.executeQuery(strSQL);
	} else {
		strSQL = "SELECT * FROM imgboard WHERE " + key + " like '%" + keyword + "%'";
		rs = stmt.executeQuery(strSQL);
	}
		
	for (i = 0; i < listSize; i++){	
		int j = 0;
%>
<TR>
<%
		for(j = 0; j < 3; j++){		
			if(rs.next()){

			int listnum = rs.getInt("num");
			String title = rs.getString("title");
			String writedate = rs.getString("writedate");
			String filename = rs.getString("filename");
%>
			<TD>
	
			<TABLE border='2' bgcolor='#F5F5DC'>
			<TR>
				<TD align=center width='170'>    
				<font size=2 color="black">
                                    <%=title %></font> 
				</TD>  
			</TR>
			<TR> 
				<TD align=center>
					<a href="index.jsp?contentPage=./write_output.jsp?num=<%=listnum%>">
					<img src="./image/<%=filename %>" width="160" height="160">
				</TD>  
			</TR>
			<TR>
				<TD align=center>
                                    	<font size=2><%=writedate %>
                                    	</font>
				</TD> 
			</TR>
			</TABLE> 
	
		</TD>   
<% 
			}else{
			break;	
		}
		}
		i = i + j;  
%>
		</TR>
<%  
	}	
%>
</TABLE>
</center>
</br></br>
<TABLE border='0' width='600px' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='2' noshade>
		</TD>
 	</TR>
</TABLE>                   
<%
rs.close();
stmt.close();
conn.close();
}

if(lastRow > 0) {
	int setPage = 1;
	int lastPage = 0;
	if(lastRow % listSize == 0)
		lastPage = lastRow / listSize;
	else
		lastPage = lastRow / listSize + 1;

	if(currentPage > 1) {
%>
		<a href="index.jsp?contentPage=listboard.jsp?pageNum=<%=currentPage-1%>" align=center>[이전]</a>	
<%	
	}
	for(i=setPage; i<=lastPage; i++) {
		if (i == Integer.parseInt(pageNum)){
%>
		[<%=i%>]
<%		
		}else{
%>
		<a href="index.jsp?contentPage=listboard.jsp?pageNum=<%=i%>" align=center>[<%=i%>]</a>
<%
		}
	}
	if(lastPage > currentPage) {
%>
		<a href="index.jsp?contentPage=listboard.jsp?pageNum=<%=currentPage+1%>" align=center>[다음]</a>
<%
	}
}
%>  

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='2' noshade>
		</TD>
 	</TR>
</TABLE>                    
</br></br>
<TABLE border=0 width=600>
	<TR>
		<TD align='center'>	
			<TABLE border='0' cellpadding='0' cellspacing='0'>
			<FORM Name='Form' Method='POST' Action='index.jsp?contentPage=listboard.jsp' OnSubmit='return Check()'>
			<input type='hidden' name='search' value='1'>
			<TR>
				<TD align='right'>
				<select name='key' style="background-color:cccccc;">
				<option value='title' selected><font size='2'>
                                                        글제목</font></option>
				<option value='contents'><font size='2'>
                                                        글내용</font></option>
				<option value='name'><font size='2'>
                                                        작성자</font></option>
				</select>
				</TD>
				<TD align='left'>
					<input type='text' name='keyword'
                                                   value='' size='20' maxlength='30'>
					<input type='submit' value='검색'>
				</td>
			  </TR>
			  </FORM>
			  </TABLE> 
		</TD>

		<TD align='right'>		
		<a href="index.jsp?contentPage=write.jsp">[등록]</a>				
		</TD>
	</TR>
</TABLE>
                  
</BODY>                     
<br><br><br>
</HTML>