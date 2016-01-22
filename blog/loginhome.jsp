<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Welcome to ALGOS</title>

<style>

             @import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
    body{
        
        position:relative;
    }
    .bod{
        border-radius: 5px 5px;
    }
    #content{
        background-color: aliceblue;
        
    }
    form#loglog{
      
      background-width:500px;
      background-color:pink;
      font-family:'hanna';
      text-align:center;
      border:black 2px;
      width:400px;
    }
    
    h1#log{
     font-family:'hanna';
         
    }
    form#sign{
     height=10px;
     style:button;
     
    }
    form#subs{
     border:2px black;
    
    }
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
			<td id="left" valign="top" width="165px" height=1200px bgcolor="">
				<!--bgcolor에 원하는 색깔 입력 --> <jsp:include page="sidemenu.jsp"
					flush="false" />
			</td>
			<!--메인 화면 -->
			<td valign="middle" height=1200px name="content">
			<center><h1 id="log">로그인 PAGE</h1>
			</br>
			     <center><form id="loglog" action="./login.jsp" method="post" name="newsletter">
			     <h3>여기서 로그인 다시 해주세요:)</h3>
			     </br>
                      <table width=300px height=30px border='1' align=center>
                      <tr height=15px>
                        
                         <td><label for="id">아이디_ID</label></td> 
                         <td height=30px><input type="text" name="id"
                                id="fname" size=10 placeholder="아이디 입력" /> </td>
                        </tr>
                        </br>
                        <tr height=15px><td>
                         <label for="password">비&nbsp;밀&nbsp;번&nbsp;호 </label></td>
                         <td><input type="password" size=10
                          name="password" id="pass"
                                placeholder="********" /></td>
                        </tr>
                        
                        </table>
                        </br>
                         <input type="button" name="subscribe" id="subs" value="회원가입" 
                                	OnClick="window.location='index.jsp?contentPage=attend_fine/registerForm.jsp'">&nbsp;
                        
                                <input type="submit" name="subscribe" id="sign" value="로그인"/>
                                
                                
                        
                        </form>
                        </br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>
                        </br></br></br>
			</td>
			
			<!--오른쪽 사이드 메뉴 -->
			<td valign="top" width="160px" height=1200px bgcolor=""><jsp:include
					page="rightSide.jsp" flush="false" /></td>
		</tr>
		<tr id="footer">
			<!--footer -->
			<td colspan="3"><jsp:include page="footer.jsp" flush="false" />
			</td>
		</tr>
		</table>
</body>
</html>