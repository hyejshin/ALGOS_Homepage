<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
String num = request.getParameter("num"); 
String pass = request.getParameter("pass"); 

String url = "jdbc:mysql://203.252.202.75:3306/algosdb";        
String id = "algosdbuser";                                       
String pw = "algos";                                   

Class.forName("com.mysql.jdbc.Driver"); 
Connection conn = DriverManager.getConnection(url, id, pw);

PreparedStatement pstmt = null;
ResultSet rs = null;

String strSQL = "SELECT pass FROM imgboard WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));

rs = pstmt.executeQuery();
rs.next();

String goodpass = rs.getString("pass").trim();
if (pass.equals(goodpass)){
	strSQL = "DELETE From imgboard WHERE num=?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	pstmt.executeUpdate();
	
	strSQL = "UPDATE imgboard SET num = num - 1 WHERE num > ?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	pstmt.executeUpdate();

	response.sendRedirect("index.jsp?contentPage=./listboard.jsp");
}
else{
	response.sendRedirect("index.jsp?contentPage=./delete_pass.jsp?num=" + num);
}

rs.close();
pstmt.close();
conn.close();
%>
