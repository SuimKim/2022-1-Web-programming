<%@page import="cs.dit.LoginDto"%>
<%@page import="cs.dit.LoginDao"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
%>
<%
	request.setCharacterEncoding("utf-8");       // 한글 설정 
	
	String id = request.getParameter("id");      // String 객체에 받아온 ID 값 저장 
  String pwd = request.getParameter("pwd");    // String 객체에 받아온 비밀번호 값 저장 
  String name = request.getParameter("name");  // String 객체에 받아온 이름 값 저장
  
  LoginDao dao = new LoginDao();
  LoginDto dto = new LoginDto(id, name, pwd);
  dao.insert(dto);
  
  response.sendRedirect("list.jsp");  // 코드 처리 후 list.jsp 페이지로 이동 
%>