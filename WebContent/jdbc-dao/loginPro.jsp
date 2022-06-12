<%@page import="cs.dit.LoginDao"%>
<%
	// 한글처리 
	request.setCharacterEncoding("utf-8");
	// id, pwd 가져오기 
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	// db 연동으로 테이블에서 가져온 id, pwd가 일치하는지 확인 
	LoginDao dao = new LoginDao();
	int check = dao.checkUser(id, pwd);
	
	if(check==1){
		session.setAttribute("id",id);
		out.println("Welcomer");
	} else{
		out.println("회원가입을 먼저하세요");
	}
	
	
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	
</body>
</html>