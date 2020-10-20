<%@page import="recommend.HashtagDAO"%><%@page import="java.util.ArrayList"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
	String[] continent = request.getParameterValues("continent");
	String[] theme = request.getParameterValues("theme");
	
	HashtagDAO dao = new HashtagDAO();
	ArrayList<String> data = dao.read3(continent, theme);
	for(String s : data){
%><%=s%>,<%}%>