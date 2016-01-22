<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<%@ page import="web.util.ConnectionContext" %>
<% request.setCharacterEncoding("utf-8"); %>

<HTML>
<HEAD>
<TITLE> 일정 관리 </TITLE>
</HEAD>
<BODY>

<META http-equiv="Content-Type" content="text/html; charset=utf=8">
<style type='text/css'>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
body{
 font-family:'hanna';
}

</style>

<%
// Calendar클래스의 인스턴스 cal 생성
java.util.Calendar cal = java.util.Calendar.getInstance();

// JSP 기본객체 request.getParameter를 사용하여 url로 부터 year, month정보를 로드
String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");

// 날짜를 저장하는 변수 year, month, date에 오늘 날짜를 설정
int year = cal.get(java.util.Calendar.YEAR);
int month = cal.get(java.util.Calendar.MONTH);
int date = cal.get(java.util.Calendar.DATE);

// url을 통해 읽어온 표시하고자 하는 날짜의 정보를 설정
if(strYear != null)
{
  	year = Integer.parseInt(strYear);
	month = Integer.parseInt(strMonth);
}

cal.set(year, month, 1);

int startDay = cal.getMinimum(java.util.Calendar.DATE);
// 표시하고자 하는 달의 마지막 날짜를 설정
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
// 표시하고자 하는 달의 시작 날짜의 요일을 설정
int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
int newLine = 0;
int j = 0;
%>

<center><font size='5'><b><h1> 일정 관리 </h1></b></font>
<br>

<TABLE width="600" border="0" cellspacing="0" cellpadding="0">
	<TR> 
   	   	<TD> 
        	<%--표시하고자 하는 날짜의 년, 월 정보를 전달--%>
        	<a href="index.jsp?contentPage=./main.jsp?year=<%=year-1%>&month=<%=month%>">◀</a>
        	<STRONG><%=year%>년 </STRONG> <a href="index.jsp?contentPage=./main.jsp?year=<%=year+1%>&month=<%=month%>">▶</a>  
      		</TD>
      		<TD>
        	<DIV align="center">
        	<a href="index.jsp?contentPage=./main.jsp?year=<%=year%>&month=<%=month - 1%>">◀</a>  
        	<STRONG><%=month + 1%>월 </STRONG><a href="index.jsp?contentPage=./main.jsp?year=<%=year%>&month=<%=month + 1%>">▶</a> 
        	</DIV>
      		</TD>
      		<TD> 
        	<DIV align="right">
        	<a href="index.jsp?contentPage=./main.jsp"></a><STRONG><%=year + "-" + (month + 1) + "-" + date%></STRONG>
        	</DIV>
      		</TD> 
    	</TR>
</TABLE>
<BR>

<TABLE width="600" border="1" cellspacing="0" cellpadding="0">
    	<TR> 
      		<TD width='14%' height='34'align='center' bgcolor='lightgreen'> 
        	<DIV align="center"><font color="red">일</font></DIV>
     		</TD>
      		<TD width='14%' height='34'align='center' bgcolor='lightgreen'> 
        	<DIV align="center">월</DIV>
      		</TD>
      		<TD width='14%' height='34'align='center' bgcolor='lightgreen'> 
        	<DIV align="center">화</DIV>
      		</TD>
      		<TD width='14%' height='34'align='center' bgcolor='lightgreen'> 
        	<DIV align="center">수</DIV>
      		</TD>
      		<TD width='14%' height='34'align='center' bgcolor='lightgreen'> 
        	<DIV align="center">목</DIV>
      		</TD>
      		<TD width='14%' height='34'align='center' bgcolor='lightgreen'> 
        		<DIV align="center">금</DIV>
      		</TD>
      		<TD width='14%' height='34'align='center' bgcolor='lightgreen'> 
        		<DIV align="center"><font color="blue">토</DIV>
      		</TD>
    	</TR>
<%
for(int index = 1; index < start ; index++ )
{
  	out.print("<TD>&nbsp;</TD>");
  	newLine++;
}

for(int index = 1; index <= endDay; index++)
{
  	String color = (newLine == 0)?"RED":"BLACK";
  	// 날짜를 1씩 증가시키면서 테이블을 생성하여 달력을 완성
%>
      <TD width='30px' height='70' align='left' valign='top'>
	  	<font size='2'><b><a href="index.jsp?contentPage=./calendar/write.jsp?year=<%=year%>&month=<%=month+1%>&day=<%=index%>">
	  	<font color = <%=color %>><%=index%></a>
	  
<%
Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://203.252.202.75:3306/algosdb";        
String id = "algosdbuser";                                       
String pw = "algos";   


	Connection conn = DriverManager.getConnection(url,id,pw);

	Statement stmt = conn.createStatement();

	String strSQL = "SELECT * FROM calendar WHERE year='" + year + "'and month='" + (month + 1) + "' and day='" + index +"'";
	ResultSet rs = stmt.executeQuery(strSQL);  		
  			
while (rs.next()){
%>
<a href=index.jsp?contentPage=./content.jsp?year=<%=year%>&month=<%=month+1%>&day=<%=index%>&no=<%=rs.getInt("no")%> 
   onMouseOver='toggle(document.all.<%="HideShow" + j%>);'
   onMouseOut='toggle(document.all.<%="HideShow" + j%>);'>▶ 
<%	
	String strTitle = rs.getString("title");
	out.println(strTitle);
%>

</a><br>
                        
<DIV id='<%= "HideShow" + j%>'style="visibility:hidden;
position: absolute;left:369px; top:400px; width:200px; 
                                height:74px; z-index:1"> 
  					
<TABLE height='100' width='200' border='1' cellspacing='1' bgcolor='cccccc'>	
	<TR> 
		<TD colspan='2' bgcolor='cccccc' align='center' height='25'>
		<font size='2'><b>상세정보</b></TD>
	</TR>
	<TR> 
		<TD width='20%'  height='25' bgcolor='cccccc' align='center'>
		<font size='2'><b>제 목</b></TD>
		<TD bgcolor='cccccc'><font size='2'>
		<b><%=strTitle%></b></TD>

	</TR>
	<TR> 
		<TD width='20%'  height='25' bgcolor='cccccc' align='center'>
		<font size='2'><b>시 간</b></TD>
		<TD bgcolor='cccccc'><font size='2'>
		<b><%=rs.getString("s_time")%>~<%=rs.getString("e_time")%></b></TD>	
	</TR>
	<TR> 
		<TD width='20%'  height='25' bgcolor='cccccc' align='center'>
		<font size='2'><b>장 소</b></TD>
		<TD bgcolor='cccccc'><font size='2'>
		<b><%=rs.getString("position")%></b></TD>
	</TR>
	<TR> 
		<TD width='20%'  height='25' bgcolor='cccccc' align='center'>
		<font size='2'><b>내 용</b></TD>
		<TD bgcolor='cccccc'><font size='2'>
		<b><%=rs.getString("content")%></b></TD>
	</TR>
</TABLE></DIV>
  			
<%
j = j+1;		
}
%>

	  
<%
newLine++;

if(newLine == 7){
	out.print("</TR>");
if(index <= endDay){
	out.print("<TR>");
}
newLine=0;
}
}

while(newLine > 0 && newLine < 7)
{
	out.print("<TD>&nbsp;</TD>");
	newLine++;
}
%>
</TABLE>
  
<SCRIPT LANGUAGE="JavaScript">
<!--
function toggle(e) {
   if(e.style.visibility=="hidden") {
      e.style.top = event.y;
      e.style.left = event.x;
      e.style.visibility="visible";
     }
     else
     {
       e.style.visibility="hidden";
     }
}
-->
</SCRIPT>
</br></br></br>
</BODY>
</HTML>
