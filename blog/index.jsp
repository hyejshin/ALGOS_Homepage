<%@ page contentType="text/html;charset=utf-8"%>
<% String contentPage = request.getParameter("contentPage"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Welcome to ALGOS</title>
<style>
    .bod{
        border-radius: 10px 10px;
    }
    #content{
        background-color: aliceblue;
    }
/*body {background: url('images/bg.gif') repeat;} 원하는 이미지 또는 색깔 설정*/
</style>
</head>
<body>
    
	<table width=1080px align="center">
		<tr id="wrap">
			<!--header -->
			<td class=bod height="200" colspan="3" bgcolor="#4d4d4d"><jsp:include
					page="header.jsp" flush="false" /></td>
		</tr>
		<tr id="content">
			<!--왼쪽 사이드 메뉴 -->
			<td valign="top" width="160px" height=900px bgcolor="lavenderblush">
				<!--bgcolor에 원하는 색깔 입력 --> <jsp:include page="sidemenu.jsp"
					flush="false" />
			</td>
			<!--메인 화면 -->
			<td valign="middle" width=760px height=900px name="content"><jsp:include
					page="<%=contentPage%>" flush="false" /></td>
			<!--오른쪽 사이드 메뉴 -->
			<td valign="top" width="160px" height=900px bgcolor="lavenderblush">
			<jsp:include
					page="rightSide.jsp" flush="false" /></td>
		</tr>
		<tr id="footer">
			<!--footer -->
			<td colspan="3"><jsp:include page="footer.jsp" flush="false" />
			</td>
		</tr>
</body>
</html>