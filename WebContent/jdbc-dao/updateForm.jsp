<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
       
<%
	String id = request.getParameter("id");  // String 객체에 받아올 ID 값 저장 

	//DBCP로 변경 
	Context initCtx = new InitialContext();                     //Context 객체 얻기 
  Context envCtx = (Context)initCtx.lookup("java:comp/env");  //"java:comp/env"에 해당하는 객체를 찾아서 envCtx에 삽입 
	DataSource ds = (DataSource)envCtx.lookup("jdbc/suim");     //"jdbc/suim"에 해당하는 객체를 찾아서 ds에 삽입 
	Connection con = ds.getConnection();                        //커넥션 풀로부터 커넥션 객체를 얻어냄 
	  
	//3. SQL 처리 
	String sql = "select * from login where id=?";       // 특정 ID가 속한 행을 검색하는 쿼리문 
	PreparedStatement pstmt = con.prepareStatement(sql); // PreparedStatement 객체 선언 
	pstmt.setString(1,id);                // pstmt에 ID 값 셋팅 
	ResultSet rs = pstmt.executeQuery();  // sql문 실행 후 레코드셋을 반환할 ResultSet 객체 선언 
	String name = ""; // name 값을 넣을 String 객체 선언
	String pwd = "";  // 패스워드 값을 넣을 String 객체 선언
	
	if(rs.next()){    // rs 객체에서 결과값 받아오기 
		name = rs.getString("name");  // name 값 받아와서 객체에 넣어주기 
		pwd = rs.getString("pwd");    // pwd 값 받아와서 객체에 넣어주기 
	}
	
	//4. 객체 해지 
	rs.close();
	pstmt.close();
	con.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>회원변경</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container">
  <h2>로그인</h2>
  <form action="updatePro.jsp" method="post">
  <div class="form-group">
      <label for="name">Name:</label>
      <input type="name" class="form-control" name="name" value="<%=name %>">
    </div>
    <div class="form-group">
      <label for="id">Id:</label>
      <input type="text" class="form-control" name="id" value="<%=id %>">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" name="pwd" value="<%=pwd %>">
    </div>
    <button type="submit" class="btn btn-primary">변경 저장</button>
    <button type="button" class="btn btn-primary" onclick="location.href='delete.jsp?id=<%=id %>'">사용자 삭제</button> <!-- URL에 쿼리스트링 넣어주기 -->
    <button type="button" class="btn btn-primary" onclick="location.href='list.jsp'">사용자 조회</button>
  </form>
</div>

</body>
</html>
