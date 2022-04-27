<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
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

	//DBCP로 변경 
	Context initCtx = new InitialContext();                     //Context 객체 얻기 
  Context envCtx = (Context)initCtx.lookup("java:comp/env");  //"java:comp/env"에 해당하는 객체를 찾아서 envCtx에 삽입 
  DataSource ds = (DataSource)envCtx.lookup("jdbc/suim");     //"jdbc/suim"에 해당하는 객체를 찾아서 ds에 삽입 
  Connection con = ds.getConnection();                        //커넥션 풀로부터 커넥션 객체를 얻어냄 
  
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
