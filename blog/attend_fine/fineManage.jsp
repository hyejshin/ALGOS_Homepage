<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="web.util.ConnectionContext"%>
<%@ page import="java.sql.*"%>
<%
	int lastRow = 0;
	int i = 0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>벌금관리</TITLE>
<STYLE>
	@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	table {text-align: center}
	tr.head {background: pink; font-weight: bold; text-align: center}
	body { font-family: "Hanna";}
	h1 {color: darkturquoise;}
</STYLE>
</HEAD>
<BODY>
	<H1>벌금 관리</H1>
	<H3>*벌금 규정</H3>
	 <H4>지각 : 1000원/결석 : 5000원</H4> 
	
		<table border="1" cellspacing="0" cellpadding="3" align="center">
				<tr> 
				    <td colspan="4" height="39" align="center">
				       <font size="+1" ><b>벌금 조회</b></font>
				    </td>
				</tr>
		<TR>
			<TD>아이디</TD>
			<TD>이름</TD>
			<TD>학년</TD>
			<TD>벌금</TD>
		</TR>
		<%
			try {
				// 데이터베이스 커넥션 생성
				//	Connection 
				Connection conn = ConnectionContext.getConnection();

				// Statement 생성
				//	Statement 
				Statement stmt = conn.createStatement();

				String strSQL = "SELECT count(*) FROM attend";
				ResultSet rs = stmt.executeQuery(strSQL);

				if (rs.next())
					lastRow = rs.getInt(1);
				rs.close();

				String year="";
				String month="";
				int fine = 0;
				// ResultSet에 레코드가 존재할 때
				if (lastRow > 0) {
					strSQL = "SELECT * FROM attend";
					rs = stmt.executeQuery(strSQL);
					for (i = 1; rs.next(); i++) {
						year = rs.getString("year");
						month = rs.getString("month");
						fine = rs.getInt("late")*1000 + rs.getInt("absence")*5000;
		%>
		<TR>
			<TD><input type="text" name="id" size="3" value="<%=rs.getString("id")%>" disabled></TD>
			<TD><input type="text" name="name" size="3" value="<%=rs.getString("name")%>" disabled></TD>
			<TD><input type="text" name="grade" size="3" value="<%=rs.getString("grade")%>" disabled></TD>
			<TD><%= fine %>원 </TD>
		</TR>

		<%
			}
					rs.close();
					stmt.close();
		%> 
		<p>최근 업데이트 날짜:<%= year %>년 <%= month %>월</p>

		<%		} else {
		%>
		<TR>
			<TD colspan="4">레코드 없음</TD>
		</TR>
		<%
			}

			} catch (SQLException ex) {
		%>
		<TR>
			<TD colspan="4">에러: <%=ex%>
			</TD>
		</TR>
		<%
			}
		%>
	</TABLE>
	<a href="index.jsp?contentPage=attend_fine/attendForm.jsp">출석 체크</a> &nbsp;&nbsp; <a href="index.jsp?contentPage=attend_fine/attendReset.jsp">초기화</a>
</BODY>
</HTML>