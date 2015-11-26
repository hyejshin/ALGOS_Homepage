<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>

<%@ page import="web.util.ConnectionContext"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="attend" class="web.bean.Attend" />
<jsp:setProperty name="attend" property="*" />

<%
	int lastRow = 0;
	int i = 0;
%>

<%
	//member에서 멤버 리스트 가져오고 해당 멤버 이름, 출결 저장.
	Connection conn = ConnectionContext.getConnection();

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
	//		sql = "SELECT * FROM attend where name LIKE '" + rs.getString("name") + "', year LIKE '" + rs.getString("year") + "', month LIKE '"	+ rs.getString("month") + "'";
			String sql = "UPDATE attend SET year='" + attend.getYear() + "', month='" + attend.getMonth() + "' where id='" + rs.getString("id") + "'";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();

			String attendlabel = "attend_" + rs.getString("id");
			String label = request.getParameter(attendlabel);
 
	
			if (label.equals("1")) {
		//		attend.setAttendance(attend.getAttendance() + 1);
				sql = "UPDATE attend SET attendance='" + (rs.getInt("attendance")+1) + "' where id='" + rs.getString("id") + "'";
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();

			
			} else if (label.equals("2")) {
				sql = "UPDATE attend SET late='" + (rs.getInt("late")+1) + "' where id='" + rs.getString("id") + "'";
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();

			} else if (label.equals("3")) {	
				sql = "UPDATE attend SET Absence='" + (rs.getInt("absence")+1) + "' where id='" + rs.getString("id") + "'";
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
			}
		}
		rs.close();
		stmt.close();
	}
%>

<HTML>
<HEAD>
<TITLE>출석 체크 확인</TITLE>
<STYLE>
	@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	table {text-align: center}
	tr.head {background: pink; font-weight: bold; text-align: center}
	body { font-family: "Hanna";}
	h1 {color: darkturquoise;}
</STYLE>
</HEAD>
<BODY>
<H1>출석 체크 확인</H1>
	<table border="1" cellspacing="0" cellpadding="3" align="center">
	<tr>
	<td colspan="6">
		<%=request.getParameter("year")%>년
		<%=request.getParameter("month")%>월
		<%=request.getParameter("week")%>주차
	</td>
	</tr>
		
				<tr> 
				    <td colspan="6" height="39" align="center">
				       <font size="+1" ><b>출석 체크 확인</b></font></td>
				</tr>
		<TR>
			<TD rowspan="2">아이디</TD>
			<TD rowspan="2">이름</TD>
			<TD rowspan="2">학년</TD>
			<TD colspan="3" align=center>출결</TD>
		</TR>
		<TR>
		<TD>출석</TD>
		<TD>지각</TD>
		<TD>결석</TD>
		</TR>
		<%
			try {
				// 데이터베이스 커넥션 생성
				//	Connection 
				conn = ConnectionContext.getConnection();

				// Statement 생성
				//	Statement 
				stmt = conn.createStatement();

				strSQL = "SELECT count(*) FROM attend";
				rs = stmt.executeQuery(strSQL);

				if (rs.next())
					lastRow = rs.getInt(1);
				rs.close();

				// ResultSet에 레코드가 존재할 때
				if (lastRow > 0) {
					strSQL = "SELECT * FROM attend";
					rs = stmt.executeQuery(strSQL);
					for (i = 1; rs.next(); i++) {
						//		attendlabel = "attend_"+rs.getString("name"); 	out.println(attendlabel);
		%>
		<TR>
			<TD><input type="text" name="id" size="3" value="<%=rs.getString("id")%>" disabled></TD>
			<TD><input type="text" name="name" size="3" value="<%=rs.getString("name")%>" disabled></TD>
			<TD><input type="text" name="grade" size="3" value="<%=rs.getString("grade")%>" disabled></TD>
				<TD><%=rs.getInt("attendance")%>번</TD>
				 <TD><%=rs.getInt("late")%>번 </TD>
				<TD><%=rs.getInt("absence")%>번 </TD>
			
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
	</TABLE>
	<a href=index.jsp?contentPage=attend_fine/attendForm.jsp>출석 체크</a>
</BODY>
</HTML>