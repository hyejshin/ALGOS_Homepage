<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
    
   <title>왼쪽 side 메뉴</title>
</head>
<body>

<div id='cssmenu'>
<ul>
   <li class='active'><a href='#'><span>Home</span></a>
    <ul>
         <li><a href="index.jsp?contentPage=home.jsp"><span>MAIN</span></a></li>
         <li class='last'><a href="index.jsp?contentPage=about.jsp"><span>ABOUT</span></a></li>
      </ul>
    </li>
   <li class='has-sub'><a href='#'><span>PROBLEM</span></a>
      <ul>
         <li><a href='index.jsp?contentPage=./board/2Boardlist.jsp'><span>2학년</span></a></li>
          
         <li><a href='index.jsp?contentPage=board/3Boardlist.jsp'><span>3학년</span></a></li>
         <li class='last'><a href='index.jsp?contentPage=./board/4Boardlist.jsp'><span>4학년</span></a></li>
      </ul>
   </li>
   <li class='has-sub'><a href='#'><span>SOURCE</span></a>
      <ul>
         <li><a href="index.jsp?contentPage=./presentboard/listboard.jsp"><span>발표자료</span></a></li>
         <li><a href="index.jsp?contentPage=book.jsp"><span>STUDY 교재</span></a></li>
         <li><a href="index.jsp?contentPage=usefulSite.jsp"><span>유용 링크</span></a></li>
         <li class='last'><a href="index.jsp?contentPage=listboard.jsp"><span>사진첩</span></a></li>
      </ul>
   </li>
   <li class='last'><a href='#'><span>ADMIN</span></a>
    <ul>
         <li><a href="index.jsp?contentPage=attend_fine/attendForm.jsp"><span>출석관리</span></a></li>
         <li><a href="index.jsp?contentPage=attend_fine/fineManage.jsp"><span>벌금관리</span></a></li>
         <li class='last'><a href="index.jsp?contentPage=./main.jsp"><span>일정관리</span></a></li>
        
    </ul>
   </li>
</div>

</body>
<html>
