<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>

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
	strSQL = "DELETE From presentdb WHERE num=?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	pstmt.executeUpdate();
	
	strSQL = "UPDATE presentdb SET num = num - 1 WHERE num > ?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	pstmt.executeUpdate();

	response.sendRedirect("index.jsp?contentPage=./presentboard/listboard.jsp");
}else{
	response.sendRedirect("index.jsp?contentPage=./presentboard/delete_pass.jsp?num=" + num);
}

rs.close();
pstmt.close();
conn.close();
%>
