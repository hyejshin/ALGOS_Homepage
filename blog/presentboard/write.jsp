<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<HEAD>
<TITLE>게시판</TITLE>

<SCRIPT language="JavaScript">
function Check()
{
if (Write.name.value.length < 1) {
	alert("작성자를 입력하세요.");
	Write.name.focus(); 
        return false;
	}

if (Write.pass.value.length < 1) {
	alert("비밀번호를 입력하세요.");
	Write.pass.focus(); 
	return false;
	}

if (Write.title.value.length < 1) {
	alert("제목을 입력하세요.");
	Write.write_title.focus(); 
	return false;
        }

if (Write.contents.value.length < 1) {
	alert("내용을 입력하세요.");
	Write.content.focus(); 
	return false;
        }
Write.submit();
}


</SCRIPT>
<style type='text/css'>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
#guel2{
  font-family:'hanna';
}
h1{
 font-family:'hanna'; 
}
  
</style>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
</HEAD>

<BODY>

<center><h1><b> 게시판 글쓰기</b><h1></h1></font>                   

<FORM Name='Write' Action='./write_input.jsp' Method='POST' Enctype='multipart/form-data' OnSubmit='return Check()'>

<TABLE border='0' width='600' cellpadding='4' cellspacing='4'>
	<TR>
		<TD width='200' bgcolor='lightgreen'>
			<font size='2'><center><b>작성자</b></center></font> 
		</TD>
		<TD>
			<p><input type='text' size='12' name='name' > <font size=1 color=red> * 필수</font></p>
		</TD>
	</TR>

	<TR>
		<TD width='200px' bgcolor='lightgreen'>
			<font size='2'><center><b>비밀번호</b></center></font>
		</TD>
		<TD>
			<p><input type='password' size='12' name='pass'><font size=1 color=red>* 필수</font></p>
		</TD>
	</TR>

	<TR>
		<TD width='200' bgcolor='lightgreen'>
			<font size='2'><center><b>E-mail</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='40' maxlength='50' name='email'></font>
		</TD>
	</TR>
	
	<TR>
		<TD width='200' bgcolor='lightgreen'>
			<font size='2'><center><b>파일 첨부</b></center></font>
		</TD>
		<TD>
			<font size='2'>
            <input type="file" name="userFile">
            </font>
		</TD>
	</TR>
	
	<TR>
      		<TD colspan='2'>
         		<hr size='1' noshade>
      		</TD>
	</TR>

	<TR>
		<TD width='200' bgcolor='lightgreen'>
			<font size='2'><center><b>글 제목</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='68' maxlength='50' name='title'></font>
		</TD>
	</TR>

	<TR>
		<TD width='200' bgcolor='lightgreen'>
			<font size='2'><center><b>글 내용</b></center></font>
		</TD>
		<TD>
         		<font size='2'>
         		<textarea cols='70' rows='15' wrap='virtual' name='contents' ></textarea>
         		</font>
      		</TD>
	</TR>

	<TR>
      		<TD colspan='2'>
         		<hr size='1' noshade>
      		</TD>
	</TR>

	<TR>
		<TD align='center' colspan='2' width='100%'>
		<TABLE>
			<TR>
				<TD id="guel2" width='100' align='center'>
					<input Type = 'Reset' Value = '다시 작성'>
				</TD>
				<TD id="guel2" width='200' align='center'>
					<input Type = 'Submit' Value = '글 등록'>
				</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
   
</TABLE>

</FORM>
</br></br></br></br>
</BODY>
</HTML>