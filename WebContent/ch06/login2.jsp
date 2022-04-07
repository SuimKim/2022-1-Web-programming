<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
%>
<%
	request.setCharacterEncoding("utf-8");

	//클라이언트에서 전달된 데이터 
	String id = request.getParameter("id");
  String pwd = request.getParameter("pwd");

	//1. jdbc 드라이브 로드
	Class.forName("org.mariadb.jdbc.Driver");

	//2. 커넥션 객체 얻기
	String url ="jdbc:mariadb://localhost:3306/suimdb";
	String user="suim";
	String password="1111";
	Connection con = DriverManager.getConnection(url, user, password);
	
	//3. SQL문 
	String sql = "insert into login(id, pwd) values(?,?)";
	
	//4. SQL 실헹 
	//Statement stmt = con.createStatement();
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.setString(2,pwd);
	
	int i = pstmt.executeUpdate();
	
	//5. 객체 해지 
  pstmt.close();
  con.close();
  
  response.sendRedirect("dbconlogin.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
	<%=i %>개의 데이터가 입력되었습니다.
</body>
</html>
