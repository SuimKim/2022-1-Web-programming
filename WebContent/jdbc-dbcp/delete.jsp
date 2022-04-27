<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*" %>
    
<% request.setCharacterEncoding("utf-8");  // 한글 설정 

	//DBCP로 변경 
	Context initCtx = new InitialContext();                     //Context 객체 얻기 
	Context envCtx = (Context)initCtx.lookup("java:comp/env");  //"java:comp/env"에 해당하는 객체를 찾아서 envCtx에 삽입 
	DataSource ds = (DataSource)envCtx.lookup("jdbc/suim");     //"jdbc/suim"에 해당하는 객체를 찾아서 ds에 삽입 
	Connection con = ds.getConnection();                        //커넥션 풀로부터 커넥션 객체를 얻어냄 

	//SQL문 
	String sql = "delete from login where id=?";  // 특정 ID가 속한 행을 지우는 쿼리문 
	
	//SQL 실헹 
	PreparedStatement pstmt = con.prepareStatement(sql);  // PreparedStatement 객체 선언  
	pstmt.setString(1, request.getParameter("id"));       // pstmt에 입력받아온 ID 값 셋팅 

	
	int i = pstmt.executeUpdate();  // 정적쿼리, int 값 반환 
	
	//객체 해지 
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