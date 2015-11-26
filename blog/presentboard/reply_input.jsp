<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<%@page import="web.util.ConnectionContext" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
int num   = Integer.parseInt(request.getParameter("num")); 
String name   = request.getParameter("name");  
String pass   = request.getParameter("pass"); 
String email  = request.getParameter("email");
String title  = request.getParameter("title");
String contents  = request.getParameter("contents");


String url = "jdbc:mysql://203.252.202.75:3306/algosdb";        
String id = "algosdbuser";                                       
String pw= "algos";  
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn = DriverManager.getConnection(url,id,pw);

PreparedStatement pstmt1 = null, pstmt2 = null;
	
	
Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

String strSQL = "UPDATE presentdb SET num=num + 1 WHERE num = " + num + " OR num > " + num;
pstmt1 = conn.prepareStatement(strSQL);
pstmt1.executeUpdate();
	
strSQL ="INSERT INTO presentdb(num, name, pass, email, title, contents, writedate, readcount)";
strSQL = strSQL + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
pstmt2 = conn.prepareStatement(strSQL);
pstmt2.setInt(1, num);
pstmt2.setString(2, name);
pstmt2.setString(3, pass);
pstmt2.setString(4, email);
pstmt2.setString(5, title);
pstmt2.setString(6, contents);
pstmt2.setString(7, indate);
pstmt2.setInt(8, 0);
pstmt2.executeUpdate();

pstmt1.close();                	
pstmt2.close();
conn.close();

response.sendRedirect("index.jsp?contentPage=./presentboard/listboard.jsp"); 
%>
