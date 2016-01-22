<%@ page contentType="application; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.text.*"%>
<%@ page import="web.util.ConnectionContext"%>
<%
String num = request.getParameter("num"); 


String url = "jdbc:mysql://203.252.202.75:3306/algosdb";        
String id = "algosdbuser";                                       
String pw= "algos";  
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn = DriverManager.getConnection(url,id,pw);
Statement stmt = conn.createStatement();
	
ResultSet rs = stmt.executeQuery("SELECT filename FROM presentdb WHERE num =" + num);
rs.next();

String filename = rs.getString("filename");
String filename2 = new String(filename.getBytes("KSC5601"),"8859_1");
File file = new File("/blog/filestorage"+filename);
byte b[] = new byte[(int)file.length()];
response.setHeader("Content-Disposition", "attachment;filename=" + filename2 + ";");
               
if (file.isFile())
{
	BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
	int read = 0;
	while ((read = fin.read(b)) != -1){
		outs.write(b,0,read);
	}
	outs.close();
	fin.close();
}
%>
