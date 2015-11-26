<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="web.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="web.bean.Member" />
<jsp:setProperty name="member" property="*" />
<html>
<head>
        <link href='http://fonts.googleapis.com/css?family=Original+Surfer'
            rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Chelsea+Market'
            rel='stylesheet' type='text/css'>
            <link href='http://fonts.googleapis.com/css?family=Ubuntu+Mono:400,700' rel='stylesheet' type='text/css'>
    
      
        <meta charset="UTF-8">
        <title>로그인 완료</title>
        <style>
             @import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
        aside {
            margin:0 auto;
            
            text-decoration: none;
            float: right;
            display: block;
            position: relative;
            font-size: 14px;
        }

        #right {
            text-decoration: none;
           
        }

        aside h3 {
            line-height: 35px;
            color: black;
            font-size: 18px;
            font-family: 'Original Surfer', cursive AppleGothic;
            /*text-transform: uppercase;*/
            height: 20px;
            padding-left: 10px;
        }

        aside#right h3 {

            color: #587EC7;
        }

        .box {
            margin-left: 3px;
            width:180px;
            padding: 2px 5px 5px 5px;

        }
            .box h3{
                text-align: center;
                font-family:'hanna';
                font-size:20px;
            }
            #log{
                font-family: 'Chelsea Market', cursive;
            }
                

        .inner{
            font-family: 'Chelsea Market', cursive;
            
            
            overflow:hidden;
            border-radius: 5px;
            border-radius: 5px;
              border: 2px solid #587EC7;
            padding: 5px;
            margin-top: 5px;
            margin-bottom: 5px;
        }
            .site{
                
                font-family: 'Chelsea Market', cursive;
            margin-left: 2px;
            margin-right: 2px;
            overflow:hidden;
            border-radius: 5px;
            border-radius: 5px;
            border: 2px solid #587EC7;
    
            
            padding: 5px;
            margin-top: 5px;
            margin-bottom: 5px;
        }

        .aligncenter, div.aligncenter {
            display: block;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }
        .link{
            margin-left: auto;
            margin-right: auto;
            border:2px;
            display:inline-block;
            margin:auto;
        }
        .link h4{
            text-align: center;
            font-family: 'Hanna';
        }
        .link a{
            border-color: white;
                text-align: center;
        }
            

        /* subscribe form */
        form#newsletter {
            background-color:deepskyblue;
            margin: auto 0;
            padding: 10px 10px;
            width: 145px;
        }

        .inner label{
                font-family: 'AppleGothic';
        }
        form#newsletter label {
            font-family: 'hanna';
            display: block;
            font-weight: bold;
            letter-spacing: -0.025em;
            margin: 0 0 2px 5px;
            text-align: left;
        }
        h4{
          font-family: 'hanna';
        }

        form#newsletter input#fname, form#newsletter input#emailaddy {
            -moz-border-radius-bottomleft: 5px;
            -moz-border-radius-bottomright: 5px;
            -moz-border-radius-topleft: 5px;
            -moz-border-radius-topright: 5px;
            background-color: #eaeaea;
             border: 2px solid #cacaca;
            width:100px;
            margin: 0 0 15px;
            padding: 3px 3px;

        }

        form#newsletter input#subscribe, input#signin {
            
            -moz-border-radius-bottomleft: 5px;
            -moz-border-radius-bottomright: 5px;
            -moz-border-radius-topleft: 5px;
            -moz-border-radius-topright: 5px;
            background-color: white;
            border: 1px solid;
            border-color: blue;
            margin-top: 5px;
            width:65px;
            color: darkblue;
            font-family: AppleGothic;
            font-weight: bold;
            padding: 5px 5px;
        }
        #subscribe:hover{
                background-color: black;
            }
            
            
        </style>
        </head>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String pass = "";
	
	
	Connection conn = ConnectionContext.getConnection();
	try{
		Statement stmt = conn.createStatement();
		String strSQL = "SELECT * FROM member WHERE id = " + id;
		ResultSet rs = stmt.executeQuery(strSQL);
		if(rs.next()){
			pass = rs.getString("password");
		}
		if(password.equals(pass)) {
			String username = rs.getString("name");
			String userid = rs.getString("id");
			session.setAttribute("login", "yes");
			session.setAttribute("username", username);
			session.setAttribute("userid", userid);
			//response.sendRedirect("./login.jsp");
			
		} 
		else{%>
			<script language=javascript>
			 self.window.alert("비밀번호가 틀렸습니다.");
			location.href="javascript:history.back()";
			//history.go(-1);   
			</script>
		<%}
	} catch(SQLException e) {
		out.println( e.toString() );
		}
%>

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
				<jsp:include page="sidemenu.jsp"
					flush="false" />
			</td>
			<!--메인 화면 -->
			<td valign="middle" height=1200px name="content"><jsp:include
					page="home.jsp" flush="false" /></td>
			<!--오른쪽 사이드 메뉴 -->
			<td valign="top" width="160px" height=1200px bgcolor="">
			<aside id="right">
                <div class="box">

                    <h3 id="log">HELLO_LOGIN</h3>

                    <div class="inner">
                        <form id="newsletter" action="./logoutProcess.jsp" method="post" name="newsletter">
                        <label for="id">아이디_ID</label>
                        <h4><%=id%>님 환영합니다.</h4>
                            <input type="button" name="subscribe" id="subscribe" value="회원가입" 
                                	OnClick="window.location='index.jsp?contentPage=attend_fine/registerForm.jsp'">&nbsp;
                            <input type="submit" name="subscribe" size=6 id="signin" value="로그아웃"/>
                        </form>
                    </div>
                </div>
                <div class="box">
                    <h3> <span id="log">Random</span>&nbsp;발표자 &nabla;</h3>
                    <div class="inner">
                        <label for="fname">오늘의 발표자는 몇 명?</label> 
                        <input type="text" name="fname" id="fname" size=6 placeholder="수 입력" />
                        <p>
                        <label for="fname">발표자 범위 선택</label>
                        
                        <select class="select" size=2 width=50px>
                            <option selected>전체</option>
                            <option>2학년</option>
                            <option>3학년</option>
                            <option>4학년</optio>
        </select>
                    </p>
                        
                    </div>
                </div>
                <!-- .box -->
                <div class="box">
                    <h3 id="log">FOR STUDYING</h3>
                    <div class="site">
                        <div class="link">
                            <a href="http://183.106.113.109/"><img src="images/home/dovelet.png" alt="" width=155px height=50px /></a>
                            <h4>알고리즘 트레이닝 CLICK!</h4>
                        </div>
                        <div class="link">
                            <a href="http://acm.kaist.ac.kr/phpBB3/portal.php"><img src="images/home/icpc.jpg" alt="" width=155px height=100px/></a>
                                <h4>ACM_icpc 대회 CLICK!</h4>
                        </div>
                        <div class="link">
                            <a href="https://www.acmicpc.net/"><img src="images/home/bak.jpg" alt=""width=155px height=50px/></a>
                            <h4>최백준 온라인 CLICK!</h4>
                        </div>

                    </div>
                </div>
            </aside>
                <!-- .box -->
			</td>
		</tr>
		<tr id="footer">
			<!--footer -->
			<td colspan="3"><jsp:include page="footer.jsp" flush="false" />
			</td>
		</tr>

</body>
</html>