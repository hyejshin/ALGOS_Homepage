<%@page contentType="text/html;charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<%@page import="web.util.ConnectionContext" %>
<%@page import="com.oreilly.servlet.MultipartRequest, 
com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*, java.io.*" %>

<%
String realFolder = "";
String saveFolder = "/blog/image";
String encType = "UTF-8";

int sizeLimit = 10 * 1024 * 1024;
String savePath=application.getRealPath("/blog/image");
ServletContext context = getServletContext();
realFolder = context.getRealPath(saveFolder);


MultipartRequest multi = null;
multi = new MultipartRequest( request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());


String userName = multi.getParameter("userName");
String fileName = multi.getFilesystemName("userFile");
String originFileName = multi.getOriginalFileName("userFile");

File file = multi.getFile("userFile");


String name   = multi.getParameter("name");  
String pass   = multi.getParameter("pass"); 
String email  = multi.getParameter("email");
String title  = multi.getParameter("title");
String contents  = multi.getParameter("contents");

String url = "jdbc:mysql://203.252.202.75:3306/algosdb";        
String id = "algosdbuser";                                       
String pw = "algos";                                     

Class.forName("com.mysql.jdbc.Driver"); 


Connection conn = DriverManager.getConnection(url, id, pw);

Statement stmt = conn.createStatement();
	
	
Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

String strSQL = "SELECT Max(num) FROM imgboard";
ResultSet rs = stmt.executeQuery(strSQL);
int num = 1;

if (!rs.wasNull()){
	rs.next();
	num = rs.getInt(1) + 1;	
}
	
strSQL ="INSERT INTO imgboard (num, name, pass, email, title, contents, writedate, readcount, filename)";
strSQL = strSQL +  "VALUES('" + num + "', '" + name + "', '" + pass + "', '" + email + "',";
strSQL = strSQL +  "'" + title + "', '" + contents + "', '" + indate + "', ' 0 ', '" + fileName + "')";
stmt.executeUpdate(strSQL);

stmt.close();                	
conn.close();

response.sendRedirect("index.jsp?contentPage=./listboard.jsp"); 
%>
