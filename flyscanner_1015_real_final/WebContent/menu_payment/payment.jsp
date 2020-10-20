<%@page import="payment.paymentDAO"%>
<%@page import="payment.paymentVO"%>
<%@page import="payment.scheduleVO"%>
<%@page import="payment.scheduleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
/* 
		session.getAttribute("sID2");
		session.getAttribute("sID3");
		int psg = (int)session.getAttribute("psg");
		
		scheduleDAO dao = new scheduleDAO();

		scheduleVO vo = dao.read((Integer)session.getAttribute("sID2"));
		scheduleVO vo2 = dao.read2((Integer)session.getAttribute("sID3")); */
	%>	

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/payment.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
//API 연결
var IMP = window.IMP;
IMP.init('imp25919458');

$(function() {
  $('#hiddenDiv').hide();

// 결제버튼 눌렀을 시
$('#formm').submit(function(event) {
	//submit 이벤트 중단
	event.preventDefault();
	
	//confirm(확인,취소)
	var payok = confirm("결제 하시겠습니까?");
	
	//각 입력 창 조건 확인
	if ($('#c_company').val()=='0') {
		$('#c_company').focus();
		alert('카드사를 선택해주세요.');
	}
	else if ($('#c_num').val()=='' || isNaN($('#c_num').val()) || $('#c_num').val().length < 16) {
		$('#c_num').focus();
		alert('카드번호를 확인해주세요.');
	}
	else if ($('#c_pw').val()=='' || isNaN($('#c_pw').val()) || $('#c_pw').val().length < 4) {
		$('#c_pw').focus();
		alert('비밀번호를 확인해주세요.');
	}
	else if ($('#c_mm').val()=='' || $('#c_yy').val()=='') {
		$('#c_mm').focus();
		alert('유효기간을 확인해주세요.');
	//확인 후 모든 조건 만족 시 결제 API 연결
	}
	else if (payok) {	 
		IMP.request_pay({
		    pg : 'inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : 'Flyscanner 항공권',
		    amount : $('#money').text(), //최종 결제 금액 값 가져오기
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    
		    }
		    else {
   		//가상 결제: 임의로 결제창 종료시 결제완료
   				//중단된 submit 이벤트 중단 해제 
				$('#formm').unbind('submit');
		    	//결제하기 버튼 이름 변경 한번 더 클릭시 결제 완료
    			$('#paybutton').text('결제 완료 하기 »');
    			$('#paybutton').css("background","#00b359");
			}
		});
	//confirm '취소' 누를시 동작 없음 
	}
});
});

</script>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body style="background-color: #F1F2F8;">


<%if(session.getAttribute("sID3")==null) {
	session.getAttribute("sID2");
	int psg = (int)session.getAttribute("seat");
	scheduleDAO dao = new scheduleDAO();
	scheduleVO vo = dao.read((Integer)session.getAttribute("sID2"));

%>

<!-- 최종결제정보 -->
<nav class="nav1">
<h2 style="width: 1600px; margin: 0px auto; text-align: center;">결제</h2>
</nav>
 <div style="width: 500px; margin: 0px auto; text-align: center;">
	<h2 style="font-weight: bold;">최종결제정보</h2>
</div>
<div class="payinfo">
<table class="table1">
<tr class="tr1">
<td class="td_mm">인원<i style='font-size:24px' class='fas'>&#xf500;</i></td>
<td class="td_mm2"><%=psg %></td>
<td class="td_mm3">명</td>
</tr>
<tr class="tr1">
<td class="td_mm">최종결제금액</td>
<td class="td_mm2"><%=psg * vo.getPrice() %></td> 
<td class="td_mm3">원</td>
</tr>
</table>
</div>
<br>

<!-- 결제 -->

	<div class="container">
	<form action="payok.jsp" method="post" id="formm">
	
    <div class='row'>
        <div class='col-md-3'></div>
        <div class='col-md-6' >
          <script src='https://js.stripe.com/v2/' type='text/javascript'></script>
         
           <div style="width: 500px; margin: 0px auto; text-align: center;">
			<h2 style="font-weight: bold;">카드 정보 입력</h2>
			</div>
         
            <div class='form-row'>
              <div class='col-xs-12 form-group required'>
                <label class='control-label'>카드사</label> <i style='font-size:20px' class='far'>&#xf09d;</i><br>
                <select class='col-md-12' id="c_company"name="cardCom"  style= "height: 35px; font-size: 16px; border: 1px solid lightgray; border-radius: 5px;">
					<option value="0">카드선택</option>
					<option value="1">국민카드</option>
					<option value="2">신한카드</option>
					<option value="3">하나카드</option>
					<option value="4">현대카드</option>
					<option value="5">롯데카드</option>
				</select>
              </div>
            </div>
            
            <div class='form-row'>
              <div class='col-xs-12 form-group required'>
                <label class='control-label'>할부기간</label><br>
                <select class='col-md-12' id="c_month" name="payPlan" style= "height: 35px; font-size: 16px; border: 1px solid lightgray; border-radius: 5px;">
					<option value="일시불">일시불</option>
					<option value="2개월">2개월</option>
					<option value="3개월">3개월</option>
					<option value="4개월">4개월</option>
					<option value="5개월">5개월</option>
					<option value="6개월">6개월</option>
				</select>
              </div>
            </div>

            <div class='form-row'>
              <div class='col-xs-12 form-group card required'>
                <label class='control-label'>카드 번호</label> <i style='font-size:20px' class='fas'>&#xf53c;</i>
                <input class='form-control card-number' id="c_num" name="cardNum" size='20' type='text' placeholder='16자리입력 0000-0000-0000-0000' maxlength="16">
              </div>
            </div>
            <div class='form-row'>
              <div class='col-xs-4 form-group cvc required'>
                <label class='control-label'>비밀번호</label> <i style="font-size:20px" class="fa">&#xf023;</i>
                <input class='form-control' id="c_pw" placeholder='비밀번호' size='4' type='password' maxlength="4">
              </div>
              <div class='col-xs-4 form-group expiration required'>
                <label class='control-label'>유효기간</label>
                <input class='form-control card-expiry-month' id="c_mm" placeholder='MM' size='2' type='text' maxlength="2">
              </div>
              <div class='col-xs-4 form-group expiration required'>
                <label class='control-label'> </label>
                <input class='form-control card-expiry-year' id="c_yy" placeholder='YY' size='4' type='text' maxlength="2">
              </div>
            </div>
            
            <div class='form-row'>
              <div class='col-md-12'>
                <div class='form-control total btn btn-warning' style="height: 40px; font-size: 20px;">
                  최종결제금액:
                  <span class='amount' id="money" ><%=psg*vo.getPrice() %></span>원
                </div>
              </div>
            </div>
            
            
            <div class='form-row'>
              <div class='col-md-12 form-group'>
                <button class='form-control btn btn-primary submit-button' id="paybutton" type='submit' onclick="check()" style="height: 40px; font-size: 20px;">
                결제하기 »</button>
              </div>
            </div>		
        
        </div>
        <div class='col-md-4'></div>
    </div>
    <div id="hiddenDiv">
    	<!-- 유저아이디 스케줄아이디 -->
    	<input type='text' name="uID" value=<%=session.getAttribute("uID") %>>
    	<input type='text' name="sID1" value=<%=session.getAttribute("sID1") %>>
    	<!-- 예약자 정보 -->
		 <input type='text' name="psgName" value=<%=request.getParameter("psgName") %>>
    	<input type='text' name="psgBirth" value=<%=request.getParameter("psgBirth") %>>
    	<input type='text' name="mobile" value=<%=request.getParameter("mobile") %>>
    	<input type='text' name="passport" value=<%=request.getParameter("passport") %>>
    	<input type='text' name="psgGender" value=<%=request.getParameter("psgGender") %>>
    	<input type='text' name="country" value=<%=request.getParameter("country") %>>
    	
    	
    </div>
    </form>
    
</div>


<%}else{
	session.getAttribute("sID2");
	session.getAttribute("sID3");
	int psg = (int)session.getAttribute("psg");
	
	scheduleDAO dao = new scheduleDAO();

	scheduleVO vo = dao.read((Integer)session.getAttribute("sID2"));
	scheduleVO vo2 = dao.read2((Integer)session.getAttribute("sID3"));
	
	%>
<!-- 최종결제정보 -->
<nav class="nav1">
<h2 style="width: 1600px; margin: 0px auto; text-align: center;">결제</h2>
</nav>
 <div style="width: 500px; margin: 0px auto; text-align: center;">
	<h2 style="font-weight: bold;">최종결제정보</h2>
</div>
<div class="payinfo">
<table class="table1">
<tr class="tr1">
<td class="td_mm">인원<i style='font-size:24px' class='fas'>&#xf500;</i></td>
<td class="td_mm2"><%=psg %></td>
<td class="td_mm3">명</td>
</tr>
<tr class="tr1">
<td class="td_mm">최종결제금액</td>
<td class="td_mm2"><%=psg*(vo.getPrice() + vo2.getPrice2()) %></td> 
<td class="td_mm3">원</td>
</tr>
</table>
</div>
<br>




<!-- 결제 -->

	<div class="container">
	<form action="payok.jsp" method="post" id="formm">
	
    <div class='row'>
        <div class='col-md-3'></div>
        <div class='col-md-6' >
          <script src='https://js.stripe.com/v2/' type='text/javascript'></script>
         
           <div style="width: 500px; margin: 0px auto; text-align: center;">
			<h2 style="font-weight: bold;">카드 정보 입력</h2>
			</div>
         
            <div class='form-row'>
              <div class='col-xs-12 form-group required'>
                <label class='control-label'>카드사</label> <i style='font-size:20px' class='far'>&#xf09d;</i><br>
                <select class='col-md-12' id="c_company"name="cardCom"  style= "height: 35px; font-size: 16px; border: 1px solid lightgray; border-radius: 5px;">
					<option value="0">카드선택</option>
					<option value="1">국민카드</option>
					<option value="2">신한카드</option>
					<option value="3">하나카드</option>
					<option value="4">현대카드</option>
					<option value="5">롯데카드</option>
				</select>
              </div>
            </div>
            
            <div class='form-row'>
              <div class='col-xs-12 form-group required'>
                <label class='control-label'>할부기간</label><br>
                <select class='col-md-12' id="c_month" name="payPlan" style= "height: 35px; font-size: 16px; border: 1px solid lightgray; border-radius: 5px;">
					<option value="일시불">일시불</option>
					<option value="2개월">2개월</option>
					<option value="3개월">3개월</option>
					<option value="4개월">4개월</option>
					<option value="5개월">5개월</option>
					<option value="6개월">6개월</option>
				</select>
              </div>
            </div>

            <div class='form-row'>
              <div class='col-xs-12 form-group card required'>
                <label class='control-label'>카드 번호</label> <i style='font-size:20px' class='fas'>&#xf53c;</i>
                <input class='form-control card-number' id="c_num" name="cardNum" size='20' type='text' placeholder='16자리입력 0000-0000-0000-0000' maxlength="16">
              </div>
            </div>
            <div class='form-row'>
              <div class='col-xs-4 form-group cvc required'>
                <label class='control-label'>비밀번호</label> <i style="font-size:20px" class="fa">&#xf023;</i>
                <input class='form-control' id="c_pw" placeholder='비밀번호' size='4' type='password' maxlength="4">
              </div>
              <div class='col-xs-4 form-group expiration required'>
                <label class='control-label'>유효기간</label>
                <input class='form-control card-expiry-month' id="c_mm" placeholder='MM' size='2' type='text' maxlength="2">
              </div>
              <div class='col-xs-4 form-group expiration required'>
                <label class='control-label'> </label>
                <input class='form-control card-expiry-year' id="c_yy" placeholder='YY' size='4' type='text' maxlength="2">
              </div>
            </div>
            
            <div class='form-row'>
              <div class='col-md-12'>
                <div class='form-control total btn btn-warning' style="height: 40px; font-size: 20px;">
                  최종결제금액:
                  <span class='amount' id="money" ><%=psg*(vo.getPrice() + vo2.getPrice2()) %></span>원
                </div>
              </div>
            </div>
            
            
            <div class='form-row'>
              <div class='col-md-12 form-group'>
                <button class='form-control btn btn-primary submit-button' id="paybutton" type='submit' onclick="check()" style="height: 40px; font-size: 20px;">
                결제하기 »</button>
              </div>
            </div>		
        
        </div>
        <div class='col-md-4'></div>
    </div>
    <div id="hiddenDiv">
    	<!-- 유저아이디 스케줄아이디 -->
    	<input type='text' name="uID" value=<%=session.getAttribute("uID") %>>
    	<input type='text' name="sID1" value=<%=session.getAttribute("sID1") %>>
    	<!-- 예약자 정보 -->
		 <input type='text' name="psgName" value=<%=request.getParameter("psgName") %>>
    	<input type='text' name="psgBirth" value=<%=request.getParameter("psgBirth") %>>
    	<input type='text' name="mobile" value=<%=request.getParameter("mobile") %>>
    	<input type='text' name="passport" value=<%=request.getParameter("passport") %>>
    	<input type='text' name="psgGender" value=<%=request.getParameter("psgGender") %>>
    	<input type='text' name="country" value=<%=request.getParameter("country") %>>
    	
    	
    </div>
    </form>
    
</div>
<%} %>
<!-- <div id="footer" style="bottom: 0; width: 100%; height: 40px; background:#042759; text-align: center; color:white; position: ">ⓒ Flyscanner</div> -->
</body>
</html>