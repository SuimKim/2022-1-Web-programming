<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import = "java.sql.*"
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>db 연동</title>
</head>
<body>
	<%
		// 1. jdbc 드라이버 로드
		Class.forName("org.mariadb.jdbc.Driver");
	
		// 2. 연결동로 얻기
		String url ="jdbc:mariadb://localhost:3306/suimdb";
		String user="suim";
		String password="1111";
		Connection con = DriverManager.getConnection(url, user, password);
		
		// 3. DB 연결 
		Statement stmt = con.createStatement();
		out.println("연결성공");
		
		// 4. 객체 해제
		stmt.close();
		con.close();
	%>
</body>
</html>