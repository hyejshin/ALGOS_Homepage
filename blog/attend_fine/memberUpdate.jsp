<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date" %>
<%@page import="java.util.*" %>
<%@ page import="web.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="web.bean.Member" />
<jsp:setProperty name="member" property="*" />
<%
	Connection conn = ConnectionContext.getConnection();
	String sql = "UPDATE member SET password='" + member.getPassword() + "', name='" + member.getName() + "', grade='" + member.getGrade() + "', email='" + member.getEmail() + "', phone='" + member.getPhone() + "' where id='"+member.getId()+"'";     
	PreparedStatement pstmt = conn.prepareStatement(sql);				
	pstmt.executeUpdate();
	
	sql = "UPDATE attend SET name='" + request.getParameter("name") + "', grade='" + request.getParameter("grade") + "' where id='"+member.getId()+"'";
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원 정보 수정 처리</title>
<STYLE>
	@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	table {text-align: center}
	tr.head {background: pink; font-weight: bold; text-align: center}
	body { font-family: "Hanna";}
	h1 {color: darkturquoise;}
</STYLE>
</head>
<body>
<h1>회원 정보 수정 처리</h1>
<table width="600" border="1" cellspacing="0" cellpadding="3" align="center">
<tr> 
    <td colspan="2" height="39" align="center">
       <font size="+1" ><b>회원 정보 수정 처리 완료</b></font></td>
</tr>
<tr>
    <td width="200">ID</td>
    <td><jsp:getProperty name="member" property="id" /></td>
</tr>
<tr>
    <td>이름</td>
    <td><jsp:getProperty name="member" property="name" /></td>
</tr>
<tr>
    <td>비밀번호</td>
    <td><jsp:getProperty name="member" property="password" /></td>
</tr>
<tr>
    <td>학년</td>
    <td><jsp:getProperty name="member" property="grade" /></td>
</tr>
<tr>    	
    <td>이메일</td>
    <td><jsp:getProperty name="member" property="email" /></td>
</tr>
<tr>
    <td>핸드폰번호</td>
    <td><jsp:getProperty name="member" property="phone" /></td>
</tr>
</table>
<a href="index.jsp?contentPage=attend_fine/memberlist.jsp">회원 목록 보기</a>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br>
</body>
</html>
