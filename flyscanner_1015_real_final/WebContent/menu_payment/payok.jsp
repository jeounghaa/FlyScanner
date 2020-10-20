<%@page import="payment.paymentDAO"%>
<%@page import="payment.paymentVO"%>
<%@page import="payment.scheduleVO"%>
<%@page import="payment.scheduleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
	
	
<%
/* int psg = (int)session.getAttribute("psg"); */
scheduleDAO s = new scheduleDAO();
scheduleVO s1 = s.read((Integer)session.getAttribute("sID2"));
/* scheduleVO s2 = s.read2((Integer)session.getAttribute("sID3")); */




//payment  테이블 저장
paymentVO vo = new paymentVO();
paymentDAO dao = new paymentDAO();
int cardCom1 =  Integer.parseInt(request.getParameter("cardCom"));
String cardNum = request.getParameter("cardNum");
String payPlan1 = request.getParameter("payPlan");
String uID = (String)session.getAttribute("uID");
//String uID = request.getParameter("uID");


vo.setCardCom(cardCom1);
vo.setCardNum(cardNum);
vo.setPayPlan(payPlan1);
vo.setuID(uID);

dao.create1(vo);


//booking 저장
paymentVO vo_b = new paymentVO();
paymentDAO dao_b = new paymentDAO();
    			
    			
    			
//booking 저장(가는날)
int sID = (int)session.getAttribute("sID2");
/* String uID1 = request.getParameter("uID"); */
//String uID1 = (String)session.getAttribute("uID");
int pID = dao_b.readpID(uID);//pID 불러오기    		

vo_b.setsID(sID);
vo_b.setuID(uID);
vo_b.setpID(pID);

dao_b.createBooking(vo_b);

//bookingDetail 저장(가는날)

String psgName = request.getParameter("psgName");
String psgBirth = request.getParameter("psgBirth");
String mobile = request.getParameter("mobile");
String passport = request.getParameter("passport");
String psgGender = request.getParameter("psgGender");
int country = Integer.parseInt(request.getParameter("country"));
int sID1 = (int)session.getAttribute("sID2");
int bID = dao_b.read(uID); //booking ID 불러오기


vo_b.setPsgName(psgName);
vo_b.setPsgGender(psgGender);
vo_b.setPsgBirth(psgBirth);
vo_b.setMobile(mobile);
vo_b.setPassport(passport);
vo_b.setCountry(country);
vo_b.setbID(bID);

dao_b.createBD(vo_b);

if(session.getAttribute("sID3")==null){
	
	
}else{


//booking 저장(오는날)
int sID2 = (int)session.getAttribute("sID3");
//String uID2 = (String)session.getAttribute("uID");
int pID2 = dao_b.readpID(uID);//pID 불러오기

vo_b.setsID(sID2);
vo_b.setuID(uID);
vo_b.setpID(pID2);

dao_b.createBooking(vo_b);



//bookingDetail 저장(오는날)

String psgName1 = request.getParameter("psgName");
String psgBirth1 = request.getParameter("psgBirth");
String mobile1 = request.getParameter("mobile");
String passport1 = request.getParameter("passport");
String psgGender1 = request.getParameter("psgGender");
int country1 = Integer.parseInt(request.getParameter("country"));
int sID3 = (int)session.getAttribute("sID3");
int bID1 = dao_b.read(uID); //booking ID 불러오기


vo_b.setPsgName(psgName1);
vo_b.setPsgGender(psgGender1);
vo_b.setPsgBirth(psgBirth1);
vo_b.setMobile(mobile1);
vo_b.setPassport(passport1);
vo_b.setCountry(country1);
vo_b.setbID(bID1);

dao_b.createBD(vo_b);
}

//카트아이디
if((int)session.getAttribute("cID") == 3){
	
}else{
int cID = (int)session.getAttribute("cID");
//카트 isPaid 바꾸기
paymentVO cIDvo = new paymentVO();
paymentDAO cIDdao = new paymentDAO();
cIDvo.setcID(cID);
cIDdao.cIDisPaid(cIDvo);
}



%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/payok.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #F1F2F8;">
<nav class="nav1">
<h2 style="width: 1600px; margin: 0px auto; text-align: center;">결제 완료</h2>
</nav>
<div id="payok">
		<h2 style="font-weight: bold;">결제가 완료되었습니다.</h2>
		<br>

		<br><br>
	<div id="booktable" style="font-size: 18px; padding-bottom: 20px;">
	<table>
	<tr>
		<td style="font-weight: bold;">예약자</td>
		<td>&nbsp;&nbsp;<%=psgName %></td>
	</tr>
	<tr>
		<td style="font-weight: bold;">연락처</td>
		<td>&nbsp;&nbsp;<%=mobile %></td>
	</tr>
	<tr>
	<tr>
		<td style="font-weight: bold;">카드번호</td>
		<td>&nbsp;&nbsp;<%=cardNum %></td>
	</tr>
	<tr>
		<td style="font-weight: bold;">할부기간</td>
		<td>&nbsp;&nbsp;<%=payPlan1 %></td>
	</tr>
	
	
	</table>
	</div>
	<a href="../index2.jsp">홈홈홈</a>
	<a href="../index2.jsp"><button id="homeButton">홈으로</button></a> &nbsp; <a href="../menu_user/MyPage.jsp"><button id="mypageButton">마이페이지</button></a>
</div>
</body>
</html>