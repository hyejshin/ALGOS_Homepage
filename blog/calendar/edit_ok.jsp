<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<%@ page import="web.util.ConnectionContext" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
String s_time = request.getParameter("s_time");
String e_time = request.getParameter("e_time");
String title = request.getParameter("title");
String position = request.getParameter("position");
String content = request.getParameter("content");
String no = request.getParameter("no");
String year = request.getParameter("year");
String month = request.getParameter("month");


String url = "jdbc:mysql://203.252.202.75:3306/algosdb";        
String id = "algosdbuser";                                       
String pw= "algos";  
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn = DriverManager.getConnection(url,id,pw);

Statement stmt = conn.createStatement();

String strSQL = "UPDATE calendar SET title='" + title + "', position='" + position + "',";
strSQL = strSQL + " content='" + content + "',s_time='" + s_time + "',e_time='" + e_time + "' WHERE no=" + no;

stmt.executeUpdate(strSQL);

stmt.close();
conn.close();

int imonth = Integer.parseInt(month);

response.sendRedirect ("index.jsp?contentPage=./calendar/main.jsp?&year=" + year + "&month=" + (imonth - 1));
%>	
