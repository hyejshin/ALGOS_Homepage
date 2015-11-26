<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<%@page import="web.util.ConnectionContext" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> 사진게시판 </TITLE>

<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type='text/css'>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(http://fonts.googleapis.com/css?family=Londrina+Outline);
h1
{
  text-align:center;
  font-family: 'Londrina Outline', cursive;
}

body{
  font-family:'hanna';
  font-size:20px;
}
	
</style>

</HEAD>

<BODY>
<%
String num = request.getParameter("num"); 
String url = "jdbc:mysql://203.252.202.75:3306/algosdb";        
String id = "algosdbuser";                                       
String pw = "algos";   

Class.forName("com.mysql.jdbc.Driver"); 
Connection conn = DriverManager.getConnection(url, id, pw);

PreparedStatement pstmt = null;
ResultSet rs = null;

try {

String strSQL = "SELECT * FROM imgboard WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));

rs = pstmt.executeQuery();
rs.next();

String name = rs.getString("name");
String title = rs.getString("title");
String contents = rs.getString("contents").trim();
String writedate = rs.getString("writedate");
int readcount = rs.getInt("readcount");
String filename = rs.getString("filename");
%>


<center><h1><b>PHOTO board</b></h1>
<TABLE border='0' width='500px' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='2' noshade color=black>
		</TD>
 	</TR>
</TABLE>

<TABLE border='0' width='500px'>
  <TR>
   <TD align='left'>
    <font size='4'> 작성자 : <%=name %></font>
   </TD>
   <TD align=right>
     <font size='4'>작성일: <%=writedate %> &nbsp;조회수: <%=readcount %></font>
   </TD>
  </TR>
  <TR>
   <TD align='left'>
    <font size='4'> 파일이름 : <%=filename%></font>
   </TD>
  </TR>
</TABLE>
</br>
<TABLE border='1' cellspacing=3 cellpadding=3 width='500px'>
	<TR bgcolor='pink'>
		<TD align='center'>
    		<font size='4'><b><%=title %></font>
		</TD>
	</TR>
</TABLE>
<TABLE border='0' cellspacing=5 cellpadding=10 width='500px'>
	<TR bgcolor='white'>
		<TD align='center'>
		<img src="./image/<%=filename %>" width="300px" height="400px"></TD>
	</TR>
	<TR>
		<TD><font size='2' color=''><%=contents %></font>
		</TD>
	</TR>
</TABLE>

<TABLE border='0' width='500px'>
	<TR>
    		<TD align='right'>
		<font size='2'><br><font size='2'></font>
    		</TD>
	</TR>
</TABLE>

<TABLE border='0' width='500px' cellpadding='0' cellspacing='0'>
  	<TR>
  		<TD><hr size='2' noshade>
  		</TD>
  	</TR>
</TABLE>

<TABLE border='0' width='500px'>
	<TR>
		<TD align='left'>
            <a href="index.jsp?contentPage=./modify_pass.jsp?num=<%=num %>"><font size='3'>[수정하기]</font></a>
            <font size='3'><a href="index.jsp?contentPage=./delete_pass.jsp?num=<%=num %>">[삭제하기]</a></font>
		</TD>

		<TD align='right'>
            <font size='3'><a href="index.jsp?contentPage=./write.jsp">[사진등록]</a></font>
            <font size='3'><a href="index.jsp?contentPage=./listboard.jsp">[목록보기]</a></font>
 		</TD>
	</TR>
</TABLE>

<%
strSQL = "UPDATE imgboard SET readcount=readcount+1 WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));
pstmt.executeUpdate();

}catch(SQLException e){
   	out.print("SQL에러 " + e.toString());
}catch(Exception ex){
   	out.print("JSP에러 " + ex.toString());
}finally{  
}
%>
<FORM Name='Plus' Action='./plus_input2.jsp' Method='post'>

<TABLE border='0' width='500px' cellpadding='0' cellspacing='0'>
<input type='hidden' name='num' value='<%=num %>'>
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>작성자</b></center></font> 
		</TD>
		<TD>
			<p><input type='text' size='40' name='plus_name' ></p>
		</TD>
	</TR>
	<TR>
		<TD bgcolor='lightgreen'>
			<font size='2'><center><b>댓글달기</b></center></font>
		</TD>
		<TD>
         		<font size='2'>
         		<input type='text' size='40' name='plus_contents' >
         		</font>
      		</TD>
      		<TD>
      			<input Type = 'Submit'  Value = '댓글등록'>
      		</TD>
	</TR>
</TABLE>
</br>

<%
Statement stmt = conn.createStatement();
String strSQL = "SELECT * FROM tblplus WHERE id = " + num;
rs = stmt.executeQuery(strSQL); 

while(rs.next()){ 
%>
<TABLE border='0' width='500px' cellpadding='1' cellspacing='0'>
	<TR bgcolor='cccccc' cellpadding=1>     
		 <TD>
		 <font size=2 color='black'>
		 	<b><%=rs.getString("name")%> :</b>
		 	<%=rs.getString("contents")%> 
		 	(<%=rs.getString("writedate")%>)
		 </font>
		 </TD>          
	</TR> 
</TABLE>   	
<%     
}

rs.close();
stmt.close();
conn.close();
   %>

</FORM>
    
</br></br>

</BODY>
</HTML>
