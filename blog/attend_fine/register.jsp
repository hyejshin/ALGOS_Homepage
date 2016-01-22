<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="web.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%
    request.setCharacterEncoding("utf-8");
%>

<!--<jsp:useBean id="member" class="web.bean.Member" />
<jsp:setProperty name="member" property="*" />
<jsp:setProperty name="member" property="registerDate" value="<%= new Date() %>" /> -->

<%
	Connection conn = ConnectionContext.getConnection();
	PreparedStatement pstmt = conn.prepareStatement("INSERT INTO member(id,name,password,grade,email,phone,registerDate)"+ " values (?,?,?,?,?,?,?)");				
	pstmt.setString(1, member.getId());
	pstmt.setString(2, member.getName());
	pstmt.setString(3, member.getPassword());
	pstmt.setString(4, member.getGrade());
	pstmt.setString(5, member.getEmail());
	pstmt.setString(6, member.getPhone());
	pstmt.setDate(7, new java.sql.Date(member.getRegisterDate().getTime()));
	pstmt.executeUpdate();  
%>

<!--<jsp:useBean id="attend" class="web.bean.Attend" />
<jsp:setProperty name="attend" property="*" />  -->

<%
//	Connection conn = ConnectionContext.getConnection();
	pstmt = conn.prepareStatement("INSERT INTO attend(id,name,grade)"+ " values (?,?,?)");				
	pstmt.setString(1, request.getParameter("id"));
	pstmt.setString(2, request.getParameter("name"));
	pstmt.setString(3, request.getParameter("grade"));
	pstmt.executeUpdate(); 
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>가입 처리</title>
<STYLE>
	@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	table {text-align: center}
	tr.head {background: pink; font-weight: bold; text-align: center}
	body { font-family: "Hanna";}
	h1 {color: darkturquoise;}
</STYLE>
</head>
<body>
<h1>가입 처리</h1>
<table width="600" border="1" cellspacing="0" cellpadding="3">
<tr> 
    <td colspan="2" height="39" align="center">
       <font size="+1" ><b>회원 가입 처리 완료</b></font></td>
</tr>
<tr>
    <td>ID</td>
    <td align="left"><jsp:getProperty name="member" property="id" /></td>
</tr>
<tr>
    <td>이름</td>
    <td align="left"><jsp:getProperty name="member" property="name" /></td>
</tr>
<tr>    	
    <td>학년</td>
    <td align="left"><jsp:getProperty name="member" property="grade" /></td>
</tr>
<tr>    	
    <td>이메일</td>
    <td align="left"><jsp:getProperty name="member" property="email" /></td>
</tr>
<tr>    	
    <td>핸드폰번호</td>
    <td align="left"><jsp:getProperty name="member" property="phone" /></td>
</tr>
<tr>
    <td>가입일시</td>
    <td align="left"><jsp:getProperty name="member" property="registerDate" /></td>
</tr>
</table>
<a href="index.jsp?contentPage=attend_fine/registerForm.jsp">회원가입하기</a> &nbsp;&nbsp;<a href="index.jsp?contentPage=attend_fine/memberlist.jsp">회원 목록 보기</a>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br>
</body>
</html>
