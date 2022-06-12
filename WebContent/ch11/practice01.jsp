<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cs.dit.LoginDto"%>
<%
	LoginDto dto = new LoginDto("gildong", "홍길", "1111");
	pageContext.setAttribute("dto", dto);
	
	String list[]={"moon", "sun", "jupiter", "mars", "venus", "mercury"};
	pageContext.setAttribute("list", list);
	
	Cookie mycookie = new Cookie("v", "happy");
	response.addCookie(mycookie);
	
	session.setAttribute("a", "happy day");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EL 실습</title>
</head>
<body>
	쿠키: ${cookie.v.value}<br>
	세션: ${sessionScope.a}님 반갑습니다!<br>
	문자열: ${"반갑습니다!!"}<br>
	연산자: ${100+1234}<br>
	연산자: ${100>67}<br>
	내장객체(param): ${param.name}<br>
  empty 연산: ${empty param.name}<br>
  삼항연산: ${!empty param.name ? param.name : "매개변수가 비어있어요."}
  <hr>
  ID: ${dto.id}<br>
  NAME: ${dto.name}<br>
  PWD: ${dto.pwd}
  <hr>
  프로토콜: ${pageContext.request.protocol}<br>
  서버명: ${pageContext.request.serverName}
  <hr>
  1. ${list[3]}
	2. ${list}
	3. ${List[1]}
	4. ${List}
</body>
</html>