    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
        <link href='http://fonts.googleapis.com/css?family=Luckiest+Guy' rel='stylesheet' type='text/css'>
    <style>
        @import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
    body {
        margin: 0px;
    }

    h1#bookstore {
        padding-top: 20px;
        padding-bottom: 0;
        font-family: 'Luckiest Guy', cursive;
        color:limegreen;
        font-weight:1px;
        font-size: 300%;
        text-align: center;
        margin-right:27px;
        margin-left:8px;
    }
        #bin{
            padding:0px;
            font-size: 20px;
            text-align: center;
            font-family: 'Jeju Hallasan', serif;
        }

    div.book {
        border-radius: 10px 10px;
        float: left;
        border:2px;
        border-color:darkred;
        width: 190px;
        text-align: center;
        border-style: solid;
        border-width: 5px;
        margin: 5px;
        padding: 5px;
    }
    </style>
    </head>
    <body>
        <h1 id="bookstore">ALGOS LIBRARY:)</h1></br>
        <h4 id="bin">우리 동아리에서 사용하는 다양한 교재들을 소개합니다:)</h4>
        <div class="book">
            <!-- 열혈강의자료구조 -->
            <div class="picture">
                <img src="images/book/dataStructure.JPG" height=250 />
            </div>
            <div class="description">
                저자: 윤성우 <br>출판사:오렌지미디어<br>출판일: 2009.09.15<br>
            </div>
        </div>
        <div class="book">
            <!-- 뇌를자극하는알고리즘 -->
            <div class="picture">
                <img src="images/book/brain.JPG" height=250 />
            </div>
            <div class="description">
                저자: 박상현 <br>출판사: 한빛미디어<br>출판일: 2012.01.18<br>
            </div>
        </div>
        <div class="book">
            <!-- 알고리즘문제해결전략 -->
            <div class="picture">
                <img src="images/book/solve.JPG" height=250 />
            </div>
            <div class="description">
                저자: 구종만 <br>출판사: 인사이트<br>출판일: 2012.11.01<br>
            </div>
        </div>
        <div class="book">
            <!-- 문제로풀어보는알고리즘 -->
            <div class="picture">
                <img src="images/book/problem.JPG" height=250 />
            </div>
            <div class="description">
                저자: 황인욱,김용혁 <br>출판사: 인사이트<br>출판일: 2012.07.24<br>
            </div>
        </div>
        <div class="book">
            <!-- 정보올림피아드 알고리즘1 -->
            <div class="picture">
                <img src="images/book/algorithm1.JPG" height=250 />
            </div>
            <div class="description">
                저자: 하성욱 <br>출판사: 좋은땅<br>출판일: 2008.07.30<br>
            </div>
        </div>
        <div class="book">
            <!-- 정보올림피아드 알고리즘2 -->
            <div class="picture">
                <img src="images/book/algorithm2.JPG" height=250 />
            </div>
            <div class="description">
                저자: 하성욱 <br>출판사: 좋은땅<br>출판일: 2008.10.01<br>
            </div>
        </div>
        <div class="book">
            <!-- 알고리즘트레이닝북 -->
            <div class="picture">
                <img src="images/book/training.JPG" height=250 />
            </div>
            <div class="description">
                저자:스티븐스키에나 <br>출판사: 한빛미디어<br>출판일: 2004.07.16<br>
            </div>
        </div>
        <div class="book">
            <!-- 탑코더 -->
            <div class="picture">
                <img src="images/book/topcoder.JPG" height=250 />
            </div>
            <div class="description">
                저자:타카하시나오히로 <br>출판사: 한빛미디어<br>출판일: 2013.11.01<br>
            </div>
        </div>
        <div class="book">
            <!-- 탑코더 -->
            <div class="picture">
                <img src="images/book/stl.JPG" height=250 />
            </div>
            <div class="description">
                저자: 공동환 <br>출판사: 한빛미디어<br>출판일: 2012.04.02<br>
            </div>
        </div>
    </body>