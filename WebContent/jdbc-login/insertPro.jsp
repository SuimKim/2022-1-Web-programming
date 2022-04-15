<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
%>
<%
	request.setCharacterEncoding("utf-8");       // 한글 설정 

	//클라이언트에서 전달된 데이터 
	String id = request.getParameter("id");      // String 객체에 받아온 ID 값 저장 
  String pwd = request.getParameter("pwd");    // String 객체에 받아온 비밀번호 값 저장 
  String name = request.getParameter("name");  // String 객체에 받아온 이름 값 저장 

	//1. jdbc 드라이브 로드
	Class.forName("org.mariadb.jdbc.Driver");

	//2. 커넥션 객체 얻기
	String url ="jdbc:mariadb://localhost:3306/suimdb";  // 데이터베이스 주소 
	String user="suim";     // 사용자 이름 
	String password="1111"; // 비밀번호 
	Connection con = DriverManager.getConnection(url, user, password);  // DB 연결 
	
	//3. SQL문 
	String sql = "insert into login(name, id, pwd) values(?,?,?)";  // 테이블에 값을 추가하기 위한 쿼리문 String 객체에 저장 
	
	//4. SQL 실헹 
	PreparedStatement pstmt = con.prepareStatement(sql);  // PreparedStatement 객체 선언 
	pstmt.setString(1,name); // pstmt에 이름 값 셋팅 
	pstmt.setString(2,id);   // pstmt에 ID 값 셋팅 
	pstmt.setString(3,pwd);  // pstmt에 패스워드 값 셋팅 
	
	// 26-29 위에서 넣어준 sql문의 데이터 순서에 맞게 작성
	
	int i = pstmt.executeUpdate();  // 정적쿼리, int 값 반환 
	
	//5. 객체 해지 
  pstmt.close();
  con.close();
  
  response.sendRedirect("list.jsp");  // 코드 처리 후 list.jsp 페이지로 이동 
%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
	<%=i %>개의 데이터가 입력되었습니다.
</body>
</html>
