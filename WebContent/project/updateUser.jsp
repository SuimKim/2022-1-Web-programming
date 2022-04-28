<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
       
<%
	String email = request.getParameter("email");  
	//DBCP로 변경 
	Context initCtx = new InitialContext();                     //Context 객체 얻기 
  Context envCtx = (Context)initCtx.lookup("java:comp/env");  //"java:comp/env"에 해당하는 객체를 찾아서 envCtx에 삽입 
	DataSource ds = (DataSource)envCtx.lookup("jdbc/suim");     //"jdbc/suim"에 해당하는 객체를 찾아서 ds에 삽입 
	Connection con = ds.getConnection();                        //커넥션 풀로부터 커넥션 객체를 얻어냄 
	  
	//3. SQL 처리 
	String sql = "select * from user where email=?";       // 특정 ID가 속한 행을 검색하는 쿼리문 
	PreparedStatement pstmt = con.prepareStatement(sql); // PreparedStatement 객체 선언 
	pstmt.setString(1,email);                
	ResultSet rs = pstmt.executeQuery();  // sql문 실행 후 레코드셋을 반환할 ResultSet 객체 선언 
	String name = "";
	String pwd = "";
	String gender = "";
	
	if(rs.next()){    // rs 객체에서 결과값 받아오기 
		name = rs.getString("name");  
		pwd = rs.getString("pwd");    
		gender = rs.getString("gender");
	}
	
	//4. 객체 해지 
	rs.close();
	pstmt.close();
	con.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>회원 정보 변경</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container">
  <h2>회원정보변경</h2>
  <form action="updateUserPro.jsp" method="post">
    <div class="form-group">
      <input type="email" class="form-control" id="email" placeholder="이메일" name="email" value="<%=email %>" readonly>
    </div>
    <div class="form-group">
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호" name="pwd">
    </div>
    <div class="form-group">
      <input type="name" class="form-control" id="name" placeholder="이름" name="name">
    </div>
    <div class="form-group">
      <select class="form-control" id="gender" name="gender">
      	<option value="남성" selected>남성</option>
        <option value="여성">여성</option>
        <option value="none">선택하지 않음</option>
      </select>
    </div>
    <button type="submit" class="btn btn-primary">수정하기</button>
    <button type="button" class="btn btn-primary" onclick="location.href='deleteUser.jsp?email=<%=email %>'">삭제하기</button> <!-- URL에 쿼리스트링 넣어주기 -->
    <button type="button" class="btn btn-primary" onclick="location.href='userlist.jsp'">회원조회</button>
  </form>
</div>

</body>