<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
       
<%
	String postno = request.getParameter("postno");  // String 객체에 받아올 ID 값 저장 
	//DBCP로 변경 
	Context initCtx = new InitialContext();                     //Context 객체 얻기 
  Context envCtx = (Context)initCtx.lookup("java:comp/env");  //"java:comp/env"에 해당하는 객체를 찾아서 envCtx에 삽입 
	DataSource ds = (DataSource)envCtx.lookup("jdbc/suim");     //"jdbc/suim"에 해당하는 객체를 찾아서 ds에 삽입 
	Connection con = ds.getConnection();                        //커넥션 풀로부터 커넥션 객체를 얻어냄 
	  
	//3. SQL 처리 
	String sql = "select * from post where postno=?";       // 특정 ID가 속한 행을 검색하는 쿼리문 
	PreparedStatement pstmt = con.prepareStatement(sql); // PreparedStatement 객체 선언 
	pstmt.setString(1,postno);               
	ResultSet rs = pstmt.executeQuery();  // sql문 실행 후 레코드셋을 반환할 ResultSet 객체 선언 
	String contents = "";
	String title = "";
	
	if(rs.next()){    // rs 객체에서 결과값 받아오기 
		postno = rs.getString("postno");
		title = rs.getString("title");  
		contents = rs.getString("contents");   
	}
	
	//4. 객체 해지 
	rs.close();
	pstmt.close();
	con.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>글수정</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container">
  <br>
  <h2>글 수정하기</h2>
  
  <form action="postUpdatePro.jsp" method="post">
  	<p>글번호</p>
    <textarea class="form-control" rows="1" id="comment" name="postno" readonly><%=postno%></textarea>
    <p>제목</p>
    <textarea class="form-control" rows="1" id="comment" name="title"><%=title%></textarea>
    <br>
    <div class="form-group">
      <label for="comment">내용</label>
      <textarea class="form-control" rows="10" id="comment" name="contents"><%=contents%></textarea>
    </div>
    <button type="submit" class="btn btn-primary">수정하기</button>
    <button type="button" class="btn btn-primary" onclick="location.href='postDelete.jsp?postno=<%=postno %>'">삭제하기</button> <!-- URL에 쿼리스트링 넣어주기 -->
    <button type="button" class="btn btn-primary" onclick="location.href='postList.jsp'">글 조회</button>
  </form>
</div>

</body>