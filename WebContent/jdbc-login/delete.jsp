<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*" %>
    
<% request.setCharacterEncoding("utf-8");  // 한글 설정 

	//1. jdbc 드라이브 로드
	Class.forName("org.mariadb.jdbc.Driver");

	//2. 커넥션 객체 얻기
	String url ="jdbc:mariadb://localhost:3306/suimdb";  // 데이터베이스 주소 
	String user="suim";     // 사용자 이름 
	String password="1111"; // 비밀번호 
	Connection con = DriverManager.getConnection(url, user, password);  // DB 연결 
	
	//3. SQL문 
	String sql = "delete from login where id=?";  // 특정 ID가 속한 행을 지우는 쿼리문 
	
	//4. SQL 실헹 
	PreparedStatement pstmt = con.prepareStatement(sql);  // PreparedStatement 객체 선언  
	pstmt.setString(1, request.getParameter("id"));       // pstmt에 입력받아온 ID 값 셋팅 

	
	int i = pstmt.executeUpdate();  // 정적쿼리, int 값 반환 
	
	//5. 객체 해지 
	pstmt.close();
	con.close();
%>
<script>
	let ans = alert("삭제되었습니다!");
	if(!ans){
	location.href='list.jsp';
	}
</script>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자삭제</title>
</head>
<body>

</body>
</html>