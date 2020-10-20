<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="search.CartVO"%>
<%@page import="search.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Date now = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

String count = request.getParameter("count");
String sid = request.getParameter("sid");
String uid = request.getParameter("uid");
System.out.println(count);
System.out.println(sid);
System.out.println(uid);

CartDAO cartdao = new CartDAO();
CartVO cvo = new CartVO();
cvo.setisPaid(false);
cvo.setCartDate(sdf.format(now)); // 오늘 날짜
cvo.setCount(1); // 인원수
cvo.setsID(Integer.parseInt(sid)); // 스케줄 아이디
cvo.setuID(uid); // 유저 아이디
cartdao.c_insert(cvo);
%>