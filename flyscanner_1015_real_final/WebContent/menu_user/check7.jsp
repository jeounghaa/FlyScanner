<%@page import="user.UserDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
   
    String pw = request.getParameter("pw");
    UserDAO dao = new UserDAO();
    String check = "<font color=blue>id 사용가능</font>";
    int result = dao.read6(pw);// read 호출 후 값 반환
    
    if(result==1){ // 성공
    	
    }
    else { // 실패
    	check = "<font color=red>아이디 혹은 비밀번호를 다시 확인해주세요</font>";    	
    }
    
    %><%=result%>