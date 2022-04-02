<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	
	제목: <%=request.getParameter("title" )%><br>
	내용: <%=request.getParameter("contents" )%>
			
	
</body>
</html>