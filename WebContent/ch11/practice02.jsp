<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String list[]={"moon", "sun", "jupiter", "mars", "venus"};
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL 실습</title>
</head>
<body>

	<c:forEach var="a" items="${list }">
		${a }
	</c:forEach>
	<br>
	${list[0]}<br>
	<c:out value="안녕하세요!!"/> ${"안녕하세요"}<br>
	<c:set var="id" value="gildong" scope="session"/>
	${id}<br>
	<c:out value="${id}"/><br>
	
	<c:set var="income" value="4000"/>
	<c:out value="${id}의 수입은 ${income}입니다."/><br>
	
	<c:if test="${income>=4000}" var="a">
		<c:out value="${income}입니다!"/> ${a}
	</c:if><br>
	
	<c:set var="score" value="${param.score}"/>
	${empty param.score ? "매개변수가 비어있어요." : param.score}
	
	<c:set var="loginid" value="gildong"/>
	<c:set var="name" value="홍길동"/>
	
	<c:if test="${loginid=='gildong' && name=='홍길동'}">
		<c:out value="${loginid} ${name}"/><br>
	</c:if>
	
	<c:forEach var="i" begin="1" end="5">
		${i}<br>
	</c:forEach><br>
	
	
</body>
</html>