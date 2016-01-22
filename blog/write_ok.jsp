<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<%@ page import="web.util.ConnectionContext" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String s_time = request.getParameter("s_hour") + ":" + request.getParameter("s_minute");
String e_time = request.getParameter("s_hour1") + ":" + request.getParameter("s_minute1");
String title = request.getParameter("title");
String position = request.getParameter("position");
String content = request.getParameter("content");


String url = "jdbc:mysql://203.252.202.75:3306/algosdb";        
String id = "algosdbuser";                                       
String pw= "algos";  
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn = DriverManager.getConnection(url,id,pw);

Statement stmt = conn.createStatement();

String strSQL = "INSERT INTO calendar (year,month,day,title,s_time,e_time,position,content) VALUES('";
strSQL = strSQL + year + "','";
strSQL = strSQL + month + "','";
strSQL = strSQL + day + "','";
strSQL = strSQL + title + "','";
strSQL = strSQL + s_time + "','";
strSQL = strSQL + e_time + "','";
strSQL = strSQL + position + "','";
strSQL = strSQL + content + "')";

stmt.executeUpdate(strSQL);

stmt.close();
conn.close();

int imonth = Integer.parseInt(month);

response.sendRedirect("index.jsp?contentPage=./main.jsp?year=" + year + "&month=" + (imonth - 1));
%>
