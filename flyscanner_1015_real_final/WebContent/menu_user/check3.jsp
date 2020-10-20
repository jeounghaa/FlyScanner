<%@page import="user.UserDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
    String passport = request.getParameter("passport");
    String namekor = request.getParameter("namekor");
    UserDAO dao = new UserDAO();
    String check = "<font color=blue>id 사용가능</font>";
    int result = dao.read3(passport, namekor); // read 호출 후 값 반환
    
    if(result==1){ // 중복이라면
    	check = "<font color=red>id 중복, 사용불가능</font>";
    }
    %><%=result%>