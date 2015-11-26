<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="member" class="web.bean.Member" />
<jsp:setProperty name="member" property="*" />
<html>
<head>
<title>Welcome to ALGOS</title>
<style>
   /*body{
        position:relative;
    }*/
    .bod{
        border-radius: 5px 5px;
    }
    #content{
        background-color: aliceblue;
        
    }
  
/*body {background: url('images/bg.gif') repeat;} 원하는 이미지 또는 색깔 설정*/
</style>
</head>
<body>
    
	<table width="1040" align="center">
		<tr id="wrap">
			<!--header -->
			<td class=bod height="200" colspan="3" bgcolor="#4d4d4d"><jsp:include
					page="header.jsp" flush="false" /></td>
		</tr>
		<tr id="content">
			<!--왼쪽 사이드 메뉴 -->
			<td id="left" valign="top" width="165px" height=950px bgcolor="#FFF0F5">
				<!--bgcolor에 원하는 색깔 입력 --> <jsp:include page="sidemenu.jsp"
					flush="false" />
			</td>
			<!--메인 화면 -->
			<td valign="middle" height=950px name="content"><jsp:include
					page="home.jsp" flush="false" /></td>
			<!--오른쪽 사이드 메뉴 -->
			<td valign="top" width="160px" height=950px bgcolor="#FFF0F5"><jsp:include
					page="rightSide.jsp" flush="false" /></td>
		</tr>
		<tr id="footer">
			<!--footer -->
			<td colspan="3"><jsp:include page="footer.jsp" flush="false" />
			</td>
		</tr>
</body>
</html>