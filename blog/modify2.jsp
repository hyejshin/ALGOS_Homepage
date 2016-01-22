<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<%@page import="web.util.ConnectionContext" %>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<HEAD>
<TITLE> 게시판 </TITLE>

<SCRIPT language="JavaScript">
function Check()
{
if (Modify.name.value.length < 1) {
	alert("작성자를 입력하세요.");
	Modify.name.focus(); 
        return false;
	}

if (Modify.pass.value.length < 1) {
	alert("비밀번호를 입력하세요.");
	Modify.pass.focus(); 
	return false;
	}

if (Modify.title.value.length < 1) {
	alert("글제목을 입력하세요.");
	Modify.title.focus(); 
	return false;
        }

if (Modify.contents.value.length < 1) {
	alert("글내용을 입력하세요.");
	Modify.contents.focus(); 
	return false;
        }

Modify.submit();
}

function list()
{
location.href = "index.jsp?contentPage=./listboard.jsp";
}

</SCRIPT>
<style type='text/css'>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
h1{
  font-family:'hanna';
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
String email = rs.getString("email");
String title = rs.getString("title");
String contents = rs.getString("contents").trim();
String writedate = rs.getString("writedate");
int readcount = rs.getInt("readcount");
%>
                   
<center><h1><b> 게시판 글수정 </b></h1>                 

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>
                 
<FORM Name='Modify' Action='./modify_output2.jsp' Method='POST' OnSubmit='return Check()'>
<input type='hidden' name='num' value='<%=num %>'>
      
<TABLE border='0' width='600'>
	<TR>
		<TD width='200' bgcolor='lightgreen'>
			<font size='2'><center><b>작성자</b></center></font> 
		</TD>
		<TD>
			<input type='text' size='12' name='name' value="<%=name %>"><font color=red size=2> * 필수</font> 
		</TD>
	</TR>

	<TR>
		<TD width='200' bgcolor='lightgreen'>
			<font size='2'><center><b>비밀번호</b></center></font>
		</TD>
		<TD>
			<p><input type='password' size='12' name='pass'><font color=red size=2>  * 필수</font></p>
		</TD>
	</TR>

	<TR>
		<TD width='200' bgcolor='lightgreen'>
			<font size='2'><center><b>E-mail</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='40' maxlength='50' name='email' value="<%=email %>"></font>
		</TD>
	</TR>
	
	<TR>
      		<TD colspan='2'>
         		<hr size='1' noshade>
      		</TD>
	</TR>

	<TR>
		<TD width='200' bgcolor='lightgreen'>
			<font size='2'><center><b>글 제목</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='70' maxlength='50' name='title' value="<%=title %>"></font>
		</TD>
	</TR>

	<TR>
		<TD bgcolor='lightgreen'>
			<font size='2'><center><b>글 내용</b></center></font>
		</TD>
		<TD>
         		<font size='2'>
         		<textarea cols='70' rows='15' wrap='virtual' name='contents'><%=contents %></textarea>
         		</font>
      		</TD>
	</TR>
	
	<TR>
		<TD colspan='2'><hr size='1' noshade></TD>
	</TR>

	<TR>
		<TD align='center' colspan='2' width='100%'>
		<TABLE>
			<TR>
				<TD width='200' align='center'>
					<input Type = 'Reset' Value = '다시 작성'>
				</TD>
				<TD width='200' align='center'>
					<input Type = 'Submit' Value = '수정완료'>
				</TD>
				<TD width='200' align='center'>
					<input Type = 'Button' Value = '목록' Name='Page' OnClick='list();'>
				</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
   
</TABLE>
</FORM>
<%
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
</br></br></br></br></br></br>
</BODY>
</HTML>


