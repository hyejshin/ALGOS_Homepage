<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<%@page import="web.util.ConnectionContext" %>
<jsp:useBean id="member" class="web.bean.Member" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> 게시판 </TITLE>

<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type='text/css'>
body{
  font-family:'hanna';
}
#guel{
   font-family:'AppleGothic';
 }

a:visit{
 text-dacoration:none;
}
a:link{
 text-decoration:none;
}
</style>

</HEAD>

<BODY>

<%
String num = request.getParameter("num"); 


String url = "jdbc:mysql://203.252.202.75:3306/algosdb";        
String id = "algosdbuser";                                       
String pw= "algos";  
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn = DriverManager.getConnection(url,id,pw);

PreparedStatement pstmt = null;
ResultSet rs = null;

try {
String strSQL = "SELECT * FROM presentdb WHERE num = ?";
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

<center><h1><b> 자료 보기 </b></h1></font>

<TABLE border='0' width='600px' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<TABLE border='0' width='600px'>
	<TR>
    		<TD align='left'>
      		<font size='4'> 작성자 : <%=name %></font>
    		</TD>
    		
    		<TD align=right>
      		<font size='4'>작성일: <%=writedate %>   조회수: <%=readcount %></font>
    		</TD>
    	</TR>
    	
    	<TR>
    		<TD align=left>
      		<font size='4'>파일이름 :<a href='./presentboard/file_down.jsp?num=<%=num %>'><%=filename %></a></font>
    		</TD>
    	</TR>
</TABLE>

<TABLE border='1' width='600px' height=20px>
	<TR bgcolor='pink'>
		<TD align='center'>
    		<font size='4'><b><%=title %></font>
		</TD>
	</TR>
</TABLE>

<TABLE border='1'  width='600px' height=100px >
	<TR bgcolor='white'>
		<TD><font size='4' color=''><%=contents %></font>
		</TD>
	</TR>
</TABLE>

<TABLE border='0' width='600px'>
	<TR>
    		<TD align='right'>
		<font size='2'></font>
    		</TD>
	</TR>
</TABLE>

<TABLE border='0' width='600px' cellpadding='0' cellspacing='0'>
  	<TR>
  		<TD><hr size='1' noshade>
  		</TD>
  	</TR>
</TABLE>

<TABLE border='0' width='600px'>
	<TR>
		<TD align='left'><font size=3>
			<a href="index.jsp?contentPage=./presentboard/modify_pass.jsp?num=<%=num %>">[수정하기]</a></font>
			<font size=3><a href="index.jsp?contentPage=./presentboard/delete_pass.jsp?num=<%=num %>">[삭제하기]</a></font>
		</TD>
		
		<TD align='right'>
			<!-- <a href="index.jsp?contentPage=./reply.jsp?num=">[답변하기]</a>-->
			<font size=3><a href="index.jsp?contentPage=./presentboard/write.jsp">[글쓰기]</a></font>
			<font size=3><a href="index.jsp?contentPage=./presentboard/listboard.jsp">[목록보기]</a></font>
 		</TD>
	</TR>
</TABLE>
</br>
<FORM Name='Plus' Action='./plus_input.jsp' Method='post'>

<TABLE id="guel" border='0' width='600px' cellpadding='0' cellspacing='0'>
<input type='hidden' name='num' value='<%=num %>'>
	<TR>
		<TD bgcolor='#C1FFC1'>
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
strSQL = "SELECT * FROM tblplus2 WHERE id = " + num;
rs = stmt.executeQuery(strSQL); 

while(rs.next()){ 
%>
<TABLE id="guel" border='0' width='600px' cellpadding='1' cellspacing='0' style="font-family:'hanna';">
	<TR bgcolor='#FFF8DC' cellpadding='1'>     
		 <TD>
		 <font size=3 color='black'>
		 	<b><%=rs.getString("name")%> :</b>
		 	<%=rs.getString("contents")%> 
		 	(<%=rs.getString("writedate")%>)
		 </font>
		 </TD>          
	</TR> 
</TABLE>   	
<%     
}
   %>

</FORM>

<%
strSQL = "UPDATE presentdb SET readcount=readcount+1 WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));
pstmt.executeUpdate();

}catch(SQLException e){
   	out.print("SQL에러 " + e.toString());
}catch(Exception ex){
   	out.print("JSP에러 " + ex.toString());
}finally{  
	rs.close();
	pstmt.close();
	conn.close();
}
%>

</BODY>
</HTML>
