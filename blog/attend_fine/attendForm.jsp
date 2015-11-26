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
<TITLE>출석체크</TITLE>
<STYLE>
	@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	table {text-align: center}
	tr.head {background: pink; font-weight: bold; text-align: center;}
	body { font-family: "Hanna";}
	h1 {color: darkturquoise;}
</STYLE>
</HEAD>
<BODY>
<h1>출석체크</h1>
		<form action="index.jsp?contentPage=attend_fine/attend.jsp" method="post">
	<table border="1" cellspacing="0" cellpadding="3" align="center">
	<tr>
	<td colspan="4">
	<select name="year">
			<option value=2014>2014</option>
			<option>2015</option>
			<option>2016</option>
			<option>2017</option>
			<option>2018</option>
			<option>2019</option>
			<option>2020</option>
			<option>2021</option>
			<option>2022</option>
	</select>년 
	<select name="month">
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
			<option>6</option>
			<option>7</option>
			<option>8</option>
			<option>9</option>
			<option>10</option>
			<option>11</option>
			<option>12</option>
	</select>월 
	<select name="week">
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
	</select>주차
	</td>
</tr>

			
				<tr> 
				    <td colspan="4" height="39" align="center">
				       <font size="+1" ><b>출석체크</b></font></td>
				</tr>
				<TR>
					<TD>아이디</TD>
					<TD>이름</TD>
					<TD>학년</TD>
					<TD align=center>출결</TD>
				</TR>
				<%
					try {
						// 데이터베이스 커넥션 생성
						Connection conn = ConnectionContext.getConnection();

						// Statement 생성
						Statement stmt = conn.createStatement();
						
						// ReseltSet의 레코드 수를 lastRow 변수에 저장
						String strSQL = "SELECT count(*) FROM attend";
						ResultSet rs = stmt.executeQuery(strSQL);
						if (rs.next())
							lastRow = rs.getInt(1);
						rs.close();

						// ResultSet에 레코드가 존재할 때
						if (lastRow > 0) {
							strSQL = "SELECT * FROM attend";
							rs = stmt.executeQuery(strSQL);
							for (i = 1; rs.next(); i++) {
								String attendlabel = "attend_"+rs.getString("id");		
				%>
				<TR>
					<TD><input type="text" name="id" size="3" value="<%=rs.getString("id")%>" ></TD>
					<TD><input type="text" name="name" size="3" value="<%=rs.getString("name")%>" ></TD>
					<TD><input type="text" name="grade" size="3" value="<%=rs.getString("grade")%>" ></TD>
		
		 		<TD><input type="radio" name= "<%=attendlabel %>" value="1" checked>출석 
					<input type="radio" name= "<%=attendlabel %>" value="2">지각 
					<input type="radio" name= "<%=attendlabel %>" value="3">결석
				</TD>  
				</TR>

				<%
					}
							rs.close();
							stmt.close();
						} else {
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
				<tr>
					<td colspan="4" align="center"><input type="submit"	value="출석 등록"></td>
				</tr>
			</TABLE>
		</form>
</BODY>
</HTML>