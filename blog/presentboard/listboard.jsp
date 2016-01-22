<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="web.util.ConnectionContext"%>
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
  color:skyblue;
}
a:link{
  text-decoration:none;

}
a:visit{
  text-decoration:none;

}

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

int listSize = 8;
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * listSize + 1;
int endRow = currentPage * listSize;
int lastRow = 0;
int i = 0;
String strSQL = "";

Class.forName("com.mysql.jdbc.Driver"); 
String url = "jdbc:mysql://203.252.202.75:3306/algosdb";        
String id = "algosdbuser";                                       
String pw= "algos";  

Connection conn = DriverManager.getConnection(url,id,pw);

Statement stmt = conn.createStatement();
ResultSet rs = null;

if (key==null || keyword==null){
	strSQL = "SELECT count(*) FROM presentdb";
}else{
	strSQL = "SELECT count(*) FROM presentdb WHERE " + key + " like '%" + keyword + "%'";
}
rs = stmt.executeQuery(strSQL);
rs.next();
lastRow = rs.getInt(1);

rs.close();
%>
<center><font size='4' weight=20px><b><h1>자&nbsp;료  게시판</h1> </b></font>
</br>
<TABLE border='1' cellspacing=2 cellpadding=3 width='700'>      

	<TR border='0' height=20px bgcolor='pink'>      
		<TD><font size=3><center><b>번호</b></center></font></TD>      
		<TD><font size=3><center><b>글 제목</b></center></font></TD>      
		<TD><font size=3><center><b>작성자</b></center></font></TD>      
		<TD><font size=3><center><b>작성일</b></center></font></TD>      
		<TD><font size=3><center><b>조회</b></center></font></TD>      
	</TR>   
	
<%
if(lastRow > 0) {
	if(key==null || keyword==null){
		strSQL = "SELECT * FROM presentdb WHERE num BETWEEN " + startRow + " and " + endRow; /*"ORDER BY num DESC";*/
		rs = stmt.executeQuery(strSQL);
	} else {
		strSQL = "SELECT * FROM presentdb WHERE " + key + " like '%" + keyword + "%' ORDER BY num DESC";
		rs = stmt.executeQuery(strSQL);
	}

	for (i = 1; i < listSize; i++){			
		while(rs.next()){

		int listnum = rs.getInt("num");
		String name = rs.getString("name");
		String email = rs.getString("email");
		String title = rs.getString("title");
		String writedate = rs.getString("writedate");
		int readcount = rs.getInt("readcount");
%>

	<TR height=20px bgcolor='white'>     
		<TD align=center><font size=3 color='black'><%=listnum %></font></TD>     
		<TD align=left>
			<a href="index.jsp?contentPage=./presentboard/write_output.jsp?num=<%=listnum %>">
			<font size=3 color="black"><%=title %></font></a>
		</TD>
		<TD align=center>    
			<a href="<%=email %>">
			<font size=3 color="black"><%=name %></font></a>     
		</TD>     
		<TD align=center><font size=3><%=writedate %></font>
		</TD>     
		<TD align=center><font size=3><%=readcount %></font>     
	</TR>  
	   	
<% 
		}    
	}	
%>

</TABLE>     
</br>
<TABLE border='0' width='700' cellpadding='0' cellspacing='0'>
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
		<font size=3><a href="index.jsp?contentPage=./presentboard/listboard.jsp?pageNum=<%=currentPage-1%>">[이전]</a></font>	
<%	
	}
	for(i=setPage; i<=lastPage; i++) {
		if (i == Integer.parseInt(pageNum)){
%>
		[<%=i%>]
<%		
		}else{
%>
		<font size=3><a href="index.jsp?contentPage=./presentboard/listboard.jsp?pageNum=<%=i%>">[<%=i%>]</a></font>
<%
		}
	}
	if(lastPage > currentPage) {
%>
		<font size=3><a href="index.jsp?contentPage=./presentboard/listboard.jsp?pageNum=<%=currentPage+1%>">[다음]</a></font>
<%
	}
}
%>  

<TABLE border='0' width='700' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='2' noshade>
		</TD>
 	</TR>
</TABLE>                    

<TABLE border=0 width=700>
	<TR>
		<TD align='center'>	
			<TABLE border='0' cellpadding='0' cellspacing='0'>
			<FORM Name='Form' Method='POST' Action='index.jsp?contentPage=./presentboard/listboard.jsp' OnSubmit='return Check()'>
			<input type='hidden' name='search' value='1'>
			<TR>
				<TD align='right'>
				<select name='key' style="background-color:cccccc;">
				<option value='title' selected><font size='3'>
                                                        글제목</font></option>
				<option value='contents'><font size='3'>
                                                        글내용</font></option>
				<option value='name'><font size='3'>
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
		<font size=3><a href="index.jsp?contentPage=./presentboard/write.jsp">[등록]</a></font>				
		</TD>
	</TR>
</TABLE>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
                  
</BODY>                     

</HTML>