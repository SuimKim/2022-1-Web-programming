<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
%>
<%
	//DBCP로 변경 
	Context initCtx = new InitialContext();                     //Context 객체 얻기 
	Context envCtx = (Context)initCtx.lookup("java:comp/env");  //"java:comp/env"에 해당하는 객체를 찾아서 envCtx에 삽입 
	DataSource ds = (DataSource)envCtx.lookup("jdbc/suim");     //"jdbc/suim"에 해당하는 객체를 찾아서 ds에 삽입 
	Connection con = ds.getConnection();                        //커넥션 풀로부터 커넥션 객체를 얻어냄 
	
  //연결 설정 
  String sql = "select * from user";      
  Statement stmt = con.createStatement();  // Statement 객체 선언 
	ResultSet rs = stmt.executeQuery(sql);   // sql문 실행 후 레코드셋을 반환할 ResultSet 객체 선언  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login 데이터 조회</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
	<table class="table table-bordered">
	<br>
	<h2>회원 목록</h2>
		<tr>
			<th>이메일</th>    <!-- 필드 -->
			<th>이름</th>
			<th>생년월일</th>
			<th>성별</th>
		</tr>
		<tr>
<%
  	//4. 반환데이터 출력
	  while(rs.next()){
			String email = rs.getString("email");      
			String name = rs.getString("name");	
			String birth = rs.getString("birth");	  
		  String gender = rs.getString("gender");
%>

  		<td><a href="updateUser.jsp?email=<%=email %>"><%=email %></a></td>    <!--표에 데이터 베이스 출력 -->
  		<td><%=name%></td>
  		<td><%=birth%></td>
  		<td><%=gender%></td>

  		</tr>
<%
			} 
%>
  </table>
</div>
  	<%
  	//5. 객체 해지
  	rs.close();
  	stmt.close();
  	con.close();
  %>
</body>
</html>