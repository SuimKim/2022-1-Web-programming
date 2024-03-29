<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
%>
<%
	request.setCharacterEncoding("utf-8");  // 한글 설정 

  //DBCP로 변경 
	Context initCtx = new InitialContext();                     //Context 객체 얻기 
  Context envCtx = (Context)initCtx.lookup("java:comp/env");  //"java:comp/env"에 해당하는 객체를 찾아서 envCtx에 삽입 
  DataSource ds = (DataSource)envCtx.lookup("jdbc/suim");     //"jdbc/suim"에 해당하는 객체를 찾아서 ds에 삽입 
  Connection con = ds.getConnection();                        //커넥션 풀로부터 커넥션 객체를 얻어냄 
  
	//3. SQL문 
	String sql = "update user set pwd=?, name=?, gender=? where email=?";  // 특정 이메일 속한 행 수정하는 쿼리문 
	
	//4. SQL 실헹 
	PreparedStatement pstmt = con.prepareStatement(sql);  // PreparedStatement 객체 선언 
	pstmt.setString(1, request.getParameter("pwd")); 
	pstmt.setString(2, request.getParameter("name"));   
	pstmt.setString(3, request.getParameter("gender"));  
	pstmt.setString(4, request.getParameter("email"));
	
  int i = pstmt.executeUpdate();  // 정적쿼리, int 값 반환 
	
	//5. 객체 해지 
  pstmt.close();
  con.close();
  
  response.sendRedirect("userlist.jsp");  // 코드 처리 후 list.jsp 페이지로 이동 
%>