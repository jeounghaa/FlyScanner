<%@page import="payment.mypayVO"%>
<%@page import="payment.mypayDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%
         	String uID = (String)session.getAttribute("uID");
                   
                   mypayDAO dao = new mypayDAO();
                   mypayVO VO = new mypayVO();
                   
                   String name = dao.nameKor(uID);

                   ArrayList<mypayVO> list = dao.payment(uID);
         %>
<!DOCTYPE html>
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/mypay.css" />

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #F1F2F8;">
<nav class="nav1">
결제 내역 확인
</nav>
<div class="maindiv">
<div class="content">
<h2>결제 ID</h2> <h3><%=uID%></h3>
<h2>이름</h2> <h3><%=name%></h3> 
<h2>결제 내역</h2>
<%
	for(int i = 0; i<list.size(); i++){
	mypayVO vo = list.get(i);
%>
<form action="mypay2.jsp" method="get">
<span><%=i+1 %>. </span><span>결제일시: </span><%=vo.getPayDay()%>&ensp;<%=vo.getPayTime() %>&ensp;&ensp;<span>카드번호:</span><%=vo.getCardNum() %>
<span>&ensp;&ensp;할부기간:</span><%=vo.getPayPlan() %>&ensp;
<input name="pID" type="hidden" value="<%=vo.getpID() %>">
<button style="background:#FEBB02; color: white; width: 150px; border-radius: 5px;">상 세 보 기</button>
<br><hr style="color: lightgray;"><br>
</form>		


<%
}
%>
</div>
</div>

</body>
</html>