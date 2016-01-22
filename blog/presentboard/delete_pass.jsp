<%@ page language="java" contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>

<HTML>
<HEAD>
<TITLE> 게시판 삭제 </TITLE>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
<style type='text/css'>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
h3{
 font-family:'hanna';
}
body{
 font-family:'hanna'; 
}


</style>
</HEAD>

<BODY>

<%
String num = request.getParameter("num");
%>

<center><h3><b>비밀번호 확인</b></h3>                                                

<TABLE border='0' width='400px' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>                 

<Form Action='./delete_input.jsp' Method='post'>                 
<input type='hidden' name='num' value='<%=num%>'>

<TABLE border='0'  width='400px'  align='center'>
 	<TR>
         	<TD align='center'>
            		<font size=2><B>비밀번호</B></font>
	 	</TD>
	 	<TD>
            		<input type='password' name='pass' size=20 maxlength=20>
            		<input type='submit' value=' 확 인 ' style='background-color:cccccc; font-weight:bolder'>
	 	</TD>
      	</TR>
</TABLE>
                                   
<TABLE border='0' width='400px' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>                    

<center><a href="index.jsp?contentPage=./presentboard/listboard.jsp">[목록보기]</a></center>      

</FORM>
</br></br></br></br>
</BODY>
</HTML>