<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import ="java.util.* "%>
    <%@page import="web.util.ConnectionContext" %>

<HTML>
<HEAD>
<TITLE>앨범 게시판</TITLE>
    <style>
     @import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
     h1{
      font-family:'hanna';
     }
     #pr{
      font-fmaily:'hanna';
      font-size:3;
     }
    </style>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
</HEAD>

<BODY>
<center><font weight=20><b><h1>사&nbsp;&nbsp;진 올리기</h1></b></font>                   
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<FORM Name='Write' Action="./write_input2.jsp" Method='POST' Enctype='multipart/form-data' OnSubmit='return Check()'>

<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>작성자</b></center></font> 
		</TD>
		<TD>
            <p><input type='text' size='12' name='name'><font color=red size=2>* 필수</font></p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>비밀번호</b></center></font>
		</TD>
		<TD>
            <p><input type='password' size='12' name='pass'><font color=red size=2>* 필수(게시물 수정, 삭제시 필요합니다.)</font></p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>E-mail</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='40' maxlength='50' name='email'></font>
		</TD>
	</TR>
	
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>사진</b></center></font>
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
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>글 제목</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='68' maxlength='50' name='title'></font>
		</TD>
	</TR>

	<TR>
		<TD bgcolor='cccccc'>
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
				<TD width='100' align='center'>
					<input Type = 'Reset' id="pr" Value = '다시 작성'>				</TD>
				<TD width='200' align='center'>
					<input Type = 'Submit' id="pr" Value = '사진 등록'>
				</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
   
</TABLE>

</FORM>

</BODY>
</HTML>