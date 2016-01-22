<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<%@ page import="web.util.ConnectionContext" %>
<% request.setCharacterEncoding("utf-8"); %>

<%

String url = "jdbc:mysql://203.252.202.75:3306/algosdb";        
String id = "algosdbuser";                                       
String pw= "algos";  
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn = DriverManager.getConnection(url,id,pw);

Statement stmt = conn.createStatement();

String strSQL = "DELETE FROM calendar WHERE no = " + request.getParameter("no");
stmt.executeUpdate(strSQL);

stmt.close();
conn.close();

response.sendRedirect("index.jsp?contentPage=./main.jsp");
%>	
