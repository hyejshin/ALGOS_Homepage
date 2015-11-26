    <%@ page contentType="text/html;charset=utf-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <head>        
    <title>header</title>
        <link href='http://fonts.googleapis.com/css?family=Londrina+Shadow' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Ubuntu+Mono:400,700' rel='stylesheet' type='text/css'>
    <style>
       @import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
        header {
            
        border-radius: 5px;
        height: 212px;
        margin: 0 auto;
        background-image: url(images/chalkboard.png);
        background-position:top;
    }

    /*@font-face {
        font-family: 'EraserRegular';
        src: url('EraserRegular-webfont.eot');
        src: local('☺'), url('EraserRegular-webfont.woff') format('woff'),
            url('EraserRegular-webfont.ttf') format('truetype');
        font-weight: normal;
        font-style: normal;
        
    }*/

    h2{
        font-family: 'Chelsea Market', cursive;
        font-weight: bold;
        clear: both;
        color:pink;
    }
       

    header h1, header h2 {
        margin: 0;
        padding: 0 0 0 30px;
        line-height: normal;
    }

    header h1 {
       font-family:'Londrina Shadow', cursive;
       color:white;
       font-size: 100px;
       float: left;
       padding-top: 20px;
    }
    header h1 #subti{
            font-family:'Hanna';
            font-size:28px;
        }

    #topMenu {
        margin-left: 10px;
        height: 30px; /* 메인 메뉴의 높이, 너비 */
        width: 850px;
    }

    #topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
        list-style-type: none; /* 메인 메뉴 안의 ul 내부의 목록 표시를 없애줌 */
        margin: 0px;
        padding: 0px;
    }
    /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
    #topMenu ul li {
        color: #14fce8; /* 글씨색 설정 */
        background-color: #4d4d4d;
        float: left;
        line-height: 30px; /* 텍스트 한 줄의 높이를 30px로 설정 */
        vertical-align: center; /* 세로 정렬을 가운데로 설정 */
        text-align: center;
        position: relative; /* 해당 li 태그 내부의 top/left 포지션 초기화 */
    }

    .menuLink, .submenuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
        text-decoration: none; /* a 태그의 꾸밈 효과 제거 */
        display: block; /* a 태그의 클릭 범위를 넓힘 */
        width: 150px; /* 기본 넓이를 150px로 설정 */
        font-size: 18px;
        font-weight: 400;
        font-family: 'Hanna';
        font-style: normal;
    }

    .menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
        color: white;
    }

    .topMenuLi:hover .menuLink { /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
        color: palegreen;
        background-color: #4d4d4d;
    }

    .submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */
        color: #2d2d2d;
        background-color: white;
        border: solid 1px black;
        margin-top: -1px; /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설덩 */
    }

    .submenu { /* 하위 메뉴 스타일 설정 */
        position: absolute;
        height: 0px;
        overflow: hidden; /* 실 내용이 높이보다 커지면 해당 내용 감춤 */
        transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정 */
    }
    /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
    .topMenuLi:hover .submenu {
        text-align: left;
        height: 200px; /* 높이를 93px로 설정 */
    }

    .submenuLink:hover { /* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정 */
        color: limegreen;
        font-weight: bold;
        background-color: #dddddd;
    }

    </style>

    </head>
    <body>
            <div id="total">
        <!--<img src="images/worldMap.JPG" width=1000px height=200px/>-->
        <!--이미지 변경 가능 -->
        <header id="head">
            <!-- header -->
            <h1 id="title">
                A&nbsp;L&nbsp;G&nbsp;O&nbsp;S<span id=subti>_OF computer sciecnce</span>
            </h1>
            <h2>Your Interesting Programming</h2>
        </header>
        <!-- end of header -->
        <nav id="topMenu">
            <ul>
                <li class="topMenuLi"><a class="menuLink" href="#">&nbsp; </a></li>
                <li>|</li>
                <li class="topMenuLi"><a class="menuLink" href="#">홈</a>
                    <ul class="submenu">
                        <li><a href="index.jsp?contentPage=home.jsp" class="submenuLink">메인</a></li>
                        <li><a href="index.jsp?contentPage=about.jsp" class="submenuLink">About</a></li>
                    </ul></li>
                <li>|</li>
                <li class="topMenuLi"><a class="menuLink" href="#">문제</a>
                    <ul class="submenu">
                        <li><a href="index.jsp?contentPage=./board/2Boardlist.jsp" class="submenuLink">2학년 게시판</a></li>
                        <li><a href="index.jsp?contentPage=./board/3Boardlist.jsp" class="submenuLink">3학년 게시판</a></li>
                        <li><a href="index.jsp?contentPage=./board/4Boardlist.jsp" class="submenuLink">4학년 게시판</a></li>
                       
                    </ul>
                </li>
                <li>|</li>
                <li class="topMenuLi"><a class="menuLink" href="#">자료</a>
                    <ul class="submenu">
                        <li><a href="index.jsp?contentPage=./presentboard/listboard.jsp" class="submenuLink">발표 자료</a></li>
                        <li><a href="index.jsp?contentPage=book.jsp" class="submenuLink">스터디 교재</a></li>
                        <li><a href="index.jsp?contentPage=usefulSite.jsp" class="submenuLink">유용 링크</a></li>
                        <li><a href="index.jsp?contentPage=./listboard.jsp" class="submenuLink">사진첩</a></li>
                    </ul></li>
                <li>|</li>
                <li class="topMenuLi"><a class="menuLink" href="#">관리</a>
                    <ul class="submenu">
                        <li><a href="index.jsp?contentPage=attend_fine/attendForm.jsp" class="submenuLink">출석 체크</a></li>
                        <li><a href="index.jsp?contentPage=attend_fine/fineManage.jsp" class="submenuLink">벌금 관리</a></li>
                        <li><a href="index.jsp?contentPage=main.jsp" class="submenuLink">일정 관리</a></li>
                    </ul></li>
                <li>|</li>
            </ul>
        </nav>
        </div>
            
           
    </body>
    </html>