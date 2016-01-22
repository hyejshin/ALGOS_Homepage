<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="web.util.ConnectionContext"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");

	String board = request.getParameter("board");
	String idx = request.getParameter("id");
	String name = request.getParameter("name");  
	String command = request.getParameter("command");
	String pageNum = request.getParameter("pageNum");
	
	// 데이터베이스 커넥션 생성
	String url = "jdbc:mysql://203.252.202.75:3306/algosdb";        
	String id = "algosdbuser";                                       
	String pw = "algos";     

	Class.forName("com.mysql.jdbc.Driver");  
	Connection conn = DriverManager.getConnection(url, id, pw);
			
	PreparedStatement pstmt = conn
			.prepareStatement("INSERT INTO boardCmd(name,command,writeDate,id)"
					+ " values (?,?,?,?)");
	pstmt.setString(1, name);
	pstmt.setString(2, command);
	pstmt.setDate(3, new java.sql.Date((new Date()).getTime()));
	pstmt.setInt(4, Integer.parseInt(idx));
	pstmt.executeUpdate();
	
	// Statement 생성
	Statement stmt = conn.createStatement();
	ResultSet rs = null;
		
	String strSQL = "SELECT * FROM board where idx="+idx;  
	rs = stmt.executeQuery(strSQL);
	rs.next();
	int commandNum = rs.getInt("commandCnt");
	commandNum = commandNum+1;
	
	String sql = "UPDATE board SET commandCnt='" + commandNum + "'where idx='"+idx+"'";
	pstmt = conn.prepareStatement(sql);				
	pstmt.executeUpdate();
	
	//response.sendRedirect("index.jsp?contentPage=board/view.jsp?idx=" + idx + "&pageNum=" + pageNum + "&board=" + board);
%>
<script>
	var url = "index.jsp?contentPage=board/view.jsp?idx=" + <%=idx%> + "&pageNum=" + <%=pageNum%> + "&board=" + <%=board%>;
	window.location.assign(url);
</script>