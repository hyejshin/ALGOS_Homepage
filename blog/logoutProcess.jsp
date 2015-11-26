<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 

<title>Welcome to ALGOS</title>
<style>
   /* body{
        position:relative;
    }*/
    .bod{
        border-radius: 5px 5px;
    }
    #content{
        background-color: aliceblue;
        
    }
</style>
</head>
<body>
<%
 session.invalidate(); //세션자체를 없애줌

 response.sendRedirect("./start.jsp");
 
%>
<table width="1040" align="center">
		<tr id="wrap">
			<!--header -->
			<td class=bod height="200" colspan="3" bgcolor="#4d4d4d"><jsp:include
					page="header.jsp" flush="false" /></td>
		</tr>
		<tr id="content">
			<!--왼쪽 사이드 메뉴 -->
			<td id="left" valign="top" width="165px" height=1200px bgcolor="">
				<!--bgcolor에 원하는 색깔 입력 --> <jsp:include page="sidemenu.jsp"
					flush="false" />
			</td>
			<!--메인 화면 -->
			<td valign="middle" height=1200px name="content"><jsp:include
					page="home.jsp" flush="false" /></td>
			<!--오른쪽 사이드 메뉴 -->
			<td valign="top" width="160px" height=1200px bgcolor=""><jsp:include
					page="rightSide.jsp" flush="false" /></td>
		</tr>
		<tr id="footer">
			<!--footer -->
			<td colspan="3"><jsp:include page="footer.jsp" flush="false" />
			</td>
		</tr>
</body>
</html> 