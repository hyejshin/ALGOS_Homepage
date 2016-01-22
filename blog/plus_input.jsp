<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<%@page import="web.util.ConnectionContext" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
String num = request.getParameter("num");
String name = request.getParameter("plus_name");  
String contents = request.getParameter("plus_contents");
int num_plus = 0;

String url = "jdbc:mysql://203.252.202.75:3306/algosdb";        
String id = "algosdbuser";                                       
String pw = "algos";                                     

Class.forName("com.mysql.jdbc.Driver"); 

Connection conn = DriverManager.getConnection(url, id, pw);

Statement stmt = conn.createStatement();

String strSQL = "SELECT num FROM tblplus2 ORDER BY num DESC";
ResultSet rs = stmt.executeQuery(strSQL);

if(rs.wasNull())  
	num_plus = 1;
else {
    	strSQL = "SELECT Max(num) FROM tblplus2";
    	rs = stmt.executeQuery(strSQL);
    	rs.next();
    	num_plus = rs.getInt(1) + 1;
}

Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

strSQL ="INSERT INTO tblplus2 (num, id, name, contents, writedate)";
strSQL = strSQL +  "VALUES('" + num_plus + "', '" + num + "', '" + name + "',";
strSQL = strSQL +  "'" + contents + "', '" + indate + "')";
stmt.executeUpdate(strSQL);

stmt.close();
conn.close();

//response.sendRedirect("index.jsp?contentPage=./presentboard/write_output.jsp?num=" + num); 
%>
<script>
	var url = "index.jsp?contentPage=./presentboard/write_output.jsp?num="+ <%=num%>;
	window.location.assign(url);
</script>

