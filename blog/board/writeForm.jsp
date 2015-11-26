<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시글 작성 폼</title>
<style type="text/css">
	h2 {text-align: center;}
	table {margin: 0px auto;}
	td.head {background: pink; font-weight: bold; text-align: center;}
	#button {text-align: center;}
</style>
<script>
	function check(){
		var fr = document.getElementById("my_form");
		if(fr.title.value<1){
			alert("제목을 입력하세요.");
			fr.title.focus();
			return false;
		}
		if(fr.content.value<1){
			alert("내용을 입력하세요.");
			fr.content.focus();
			return false;
		}
		if(fr.grade.value=="none"){
			alert("학년을 선택 하세요.");
			fr.grade.focus();
			return false;
		}
		if(fr.accept.value=="none"){
			alert("성공여부를 선택하세요.");
			fr.accept.focus();
			return false;
		}
		if(fr.password.value<1){
			alert("비밀번호를 입력하세요.");
			fr.password.focus();
			return false;
		}
		return true;
	}
</script>
<% 
	request.setCharacterEncoding("utf-8");
	String board = request.getParameter("board");
%>
</head>
<body>
<h2>게시글 등록</h2><br>
	<form id="my_form" action="index.jsp?contentPage=board/write_ok.jsp?board=<%=board%>" method="post" onsubmit="return check();">
	<table width="750">
        <tr><td class="head">카테고리</td>
            <td><select name="grade"><option value="none">학년선택</option><option value="2">2학년</option>
                <option value="3">3학년</option><option value="4">4학년</option>
                </select>
                <select name="accept"><option value="none">Accept여부선택</option>
                <option value="accept">Accept</option><option value="unaccept">Unaccept</option>
                </select></td><tr/>
		<tr><td class="head">제목</td><td><input type="text" name="subject" size="60"></td><tr/>
        <tr><td class="head">작성자</td><td><input type="text" name="name" size="20"></td><tr/>
        <tr><td class="head">비밀번호</td><td><input type="password" name="password" size="20"></td><tr/>
		<tr><td class="head">내용</td><td><textarea name="content" rows="20" cols="60"></textarea></td></tr>
	</table>
	<hr width="650">
	<div id="button"><input type="reset" value="다시작성"> &nbsp; &nbsp;
	<input type="submit" value="등록">
	</form>
</body>
</html>
