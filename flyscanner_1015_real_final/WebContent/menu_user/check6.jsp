<%@page import="user.UserDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
 
    String pw = request.getParameter("pw");
    String testid = request.getParameter("Uid");
    UserDAO dao = new UserDAO();

    String check = "<font color=blue>id 사용가능</font>";
    boolean result = dao.update(pw, testid);// read 호출 후 값 반환
    
    if(!result){ // 존재하지 않으면
    	check = "<font color=red>id 중복, 사용불가능</font>";
    }
    %><%=result%>