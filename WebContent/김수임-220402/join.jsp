<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String[] lan=request.getParameterValues("lan");
	%>

	아이디: <%=request.getParameter("id" )%><br>
	비밀번호: <%=request.getParameter("pwd" )%><br>
	이름: <%=request.getParameter("name" )%><br>
	성별: <%=request.getParameter("gender" )%><br>

	관심언어:
	<%
		for(int i =0; i<lan.length;i++){
			out.println(lan[i]+" ");
		}
	%>
	<br>
	취미: <%=request.getParameter("hob" )%>
</body>
</html>