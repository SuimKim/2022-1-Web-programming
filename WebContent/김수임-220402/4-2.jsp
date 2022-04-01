<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>점수의 합과 평균 구하기</title>
</head>
<body>
   <%
      request.setCharacterEncoding("utf-8");   // 언어 설정
   
      int kor = Integer.parseInt(request.getParameter("kor"));      
      int eng = Integer.parseInt(request.getParameter("eng"));
      int math = Integer.parseInt(request.getParameter("math"));
      int sum = kor + eng + math;
      float ave = (float)sum / 3;      
      
      
      out.println("국어 점수는 "+ kor + "<br>");
      out.println("영어 점수는 "+ eng + "<br>");
      out.println("수학 점수는 "+ math + "<br>");
      out.println("총 점수는 "+ sum + "<br>");
      out.println("평균 점수는 "+ String.format("%.2f",ave) + "<br>");
   %>
</body>
</html>