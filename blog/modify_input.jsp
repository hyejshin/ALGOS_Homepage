<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="web.util.ConnectionContext"%>
<%
String num = request.getParameter("num"); 
String pass = request.getParameter("pass"); 

String url = "jdbc:mysql://203.252.202.75:3306/algosdb";        
String id = "algosdbuser";                                       
String pw= "algos";  
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn = DriverManager.getConnection(url,id,pw);

PreparedStatement pstmt = null;
ResultSet rs = null;

String strSQL = "SELECT pass FROM presentdb WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));

rs = pstmt.executeQuery();
rs.next();

String goodpass = rs.getString("pass").trim();
if (pass.equals(goodpass)){
	response.sendRedirect("index.jsp?contentPage=./modify.jsp?num=" + num);
}else{
	response.sendRedirect("index.jsp?contentPage=./modify_pass.jsp?num=" + num);	
}

rs.close();
pstmt.close();
conn.close();
%>
