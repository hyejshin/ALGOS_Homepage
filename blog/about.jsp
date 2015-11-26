<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <head>
    <meta charset="UTF-8">

    <style>
        @import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

    h1 {
        color: green;
        font-family: 'Hanna';
        font-weight: bold;
        font-size: 250%;
        text-align: center;
        margin: 20px;
    }
        
    h3 {
        color: gray;
        font-family: 'Hanna';
        font-weight: bold;
        font-size: 100%;
        text-align: center;
    }
    div.poster {
        text-align: center;
        float: left;
        width: 170px;
        margin: 5px;
        padding: 20px 10px;
    }

    div.acm {
        text-align: center;
        float: right;
        height:100px;
        width: 160px;
        margin: 5px;
        padding: 5px;
    }
	
    .content {
        border: 2px solid gray;
        border-radius: 5px 5px;
        margin: 5px;
        padding: 5px;
        height:250px;
    }
    .content#second {
        height:200px;
	}

    .content p:nth-child(1) {
        color: green;
        
        font-weight: bold;
        font-size: 20px;

        font-family: 'Hanna';
        text-align: center;
    }
	.content p:nth-child(2){
        text-align:justify;
        padding-right: 20px;
    }
    img {
        
        border: 2px solid;
        border-color: lavenderblush;
    }
    
    #since{
    	font-family: 'Hanna';
    }
    </style>
    </head>
    <body>
        <h1>About</h1>

        <div>
            <div class="poster">
                <div class="picture">
                    <img src="images/home/poster1.JPG" height=200px />
                    <!-- <img src="images/acm_team.JPG" height=100/>   -->
                </div>
            </div>
            <div class="content">
                <p>알고스_ALGOS 는 어떤 동아리일까?</p>
                <p id="pg">ALGOS 동아리는 2010년에 설립되어 ACM-ICPC 프로그래밍 대회를 위해 알고리즘 스터디와 함께 다양한
                    문제들을 풀고 의논하는 동아리입니다. 이상규 교수님 지도 하에 매주 스터디를 통해 대회를 준비하고 있습니다.
                    매년 여름방학마다 대학생연함에서 주최하는 전국대학생프로그래밍 대회와 함께 10월에는 실전 대회인 ACM_ICPC 대회를 나갑니다. 
                대회에 나가는 만큼 학생들이 열정을 가지고 동아리 활동에 참여하고 있답니다^^</p>
        </div>
        <br />
        <br />
        <div>
            <div class="acm">
                <div class="picture">
                    <img src="images/home/icpc_logo.JPG" width=130 height=180px />
                    <!-- 	<img src="images/acm_contest.JPG" height=150/>  -->
                </div>
            </div>
            <div class="content" id="second">
                <p>ACM-ICPC는 어떤 대회인가요?</p>
                <p>
                    <a href="http://icpc.baylor.edu/">ACM-ICPC</a>는 대학생들이 팀을 이루어 프로그래밍
                    능력을 겨루는 대회로서, 컴퓨터 분야의 유명한 학회인 ACM이 주관하고 있습니다. 이 대회에서, 대학생 3명으로 구성된 각
                    팀 들은 제한시간동안 얼마나 많은 문제를 풀 수 있는가를 놓고 경쟁하게 됩니다.
                </p>
            </div>
        </div>
        	
        <div>
            <h5>★ 주요 일정<h5>
            <p>- 매주 수요일 7pm: 회의+스터디 및 문제 발표</p>
            <p>- 8월 전대프연 대회 참가</p>
            <p>- 10월 ACM-ICPC 예선 대회 참가</p>
        </div>
        <br />
        <div id="since">
            <h5>ALGOS since 2010 </h5>
            <!-- <p>- 2010년 Algos 설립 </p> -->
        </div>
        <br />
    </body>