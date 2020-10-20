<%@page import="java.text.SimpleDateFormat"%>
<%@page import="payment.mypayVO"%>
<%@page import="payment.mypayDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%
         	SimpleDateFormat f = new SimpleDateFormat("HH:mm");
                   
                   String uID = (String)session.getAttribute("uID");
                   int pID = Integer.parseInt(request.getParameter("pID"));
                   
                   mypayDAO dao = new mypayDAO();
                   mypayVO VO = new mypayVO();
                   

                   ArrayList<mypayVO> list = dao.bookingsID(pID);
         %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/mypay2.css" />


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #F1F2F8;">
<nav class="nav1">
결제 내역 상세 보기
</nav>
<div class="maindiv">
<div class="content">
<br><br><br>
<%
	for(int i = 0; i<list.size(); i++){
	mypayVO vo = list.get(i);
	String depart = null;
	String arrive = null;
	
	if(vo.getDepartCtID()==10){
		depart = "대한민국";
	}else if(vo.getDepartCtID()==20){
		depart = "싱가폴";
	}else if(vo.getDepartCtID()==30){
		depart = "필리핀";
	}else if(vo.getDepartCtID()==40){
		depart = "베트남";
	}else if(vo.getDepartCtID()==50){
		depart = "일본";
	}
	
	if(vo.getArriveCtID()==10){
		arrive = "대한민국";
	}else if(vo.getArriveCtID()==20){
		arrive = "싱가폴";
	}else if(vo.getArriveCtID()==30){
		arrive = "필리핀";
	}else if(vo.getArriveCtID()==40){
		arrive = "베트남";
	}else if(vo.getArriveCtID()==50){
		arrive = "일본";
	}
%>
<h2>예약<%=i+1 %>.</h2>
<h3>출발: <%=vo.getDepartDATE() %>&ensp;&ensp;<%=f.format(vo.getDepartTIME()) %></h3>
<h3>도착: <%=vo.getArriveDATE() %>&ensp;&ensp;<%=f.format(vo.getArriveTIME()) %></h3>
<table style="font-size: 20px; font-weight: bold; text-align: center;">
<tr>
<td>출발지<br><%=depart %></td>
<td style="font-size: 30px;">&ensp;&ensp;→&ensp;&ensp;</td>
<td>도착지<br><%=arrive %></td>
</tr>
</table>
<br><br><br>
<%


%>
<% } %>



</div>
</div>

</body>
</html>