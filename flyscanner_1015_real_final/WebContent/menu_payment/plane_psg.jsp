<%@page import="javax.swing.plaf.metal.MetalBorders.Flush3DBorder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="payment.scheduleVO"%>
<%@page import="payment.scheduleDAO"%>


<% request.setCharacterEncoding("UTF-8");%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
				

		String de_air = request.getParameter("de_air");		
		String ar_air = request.getParameter("ar_air");		


		int psg = Integer.parseInt(request.getParameter("seat"));
		int sID2 = Integer.parseInt(request.getParameter("sID2"));
		
		
		session.setAttribute("psg", psg);
		session.setAttribute("sID2", sID2);
		
		/* int psg = (int)session.getAttribute("psg"); */
		scheduleDAO dao = new scheduleDAO();
	
		SimpleDateFormat f = new SimpleDateFormat("HH:mm");
		scheduleVO vo = dao.read(Integer.parseInt(request.getParameter("sID2")));
		
		if(session.getAttribute("sID3")==null){
		
		}else{
			
		}
		
		scheduleVO deNation= dao.deNation(Integer.parseInt(request.getParameter("sID2")));
		scheduleVO arrNation = dao.arrNation(Integer.parseInt(request.getParameter("sID2")));
		
		
	%>	
	
	

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/info.css" />
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


<script type="text/javascript">

$(function() {
	
	/* $(".backDiv1").hide();
		$(".backDiv2").hide() */
		
		
		$('#hiddenDiv').hide();
	
	$('#psgform').submit(function(event) {
		
		event.preventDefault();
		
		var result = confirm("결제페이지로 이동 하시겠습니까?");
		if ($('#p_name').val()=='') {
			$('#p_name').focus();
			alert('이름을 입력해주세요.');
		}else if ($('#p_gender').val()== '0') {
			$('#p_gender').focus();
			alert('성별을 선택해주세요.');
		}else if ($('#p_birth').val()=='' || isNaN($('#p_birth').val()) || $('#p_birth').val().length < 8){
			$('#p_birth').focus();
			alert('생년월일을 확인해주세요.');
		}else if ($('#p_passport').val()=='') {
			$('#p_passport').focus();
			alert('여권번호를 입력해주세요.');
		}else if ($('#p_country').val()=='0') {
			$('#p_country').focus();
			alert('국가를 선택해주세요.');
		}else if ($('#p_mobile').val()=='' || isNaN($('#p_mobile').val())) {
			$('#p_mobile').focus();
			alert('연락처를 확인해주세요.');
			/* 모든입력 사항이 맞았을 경우 결제완료페이지로 이동 */
		}else if (result) {
			$('#psgform').unbind('submit');
			$('#result').text('* 모든 정보가 잘 입력되었습니다.');
			$('#button1').css("background","#00b359")
			$('#button1').text('결제 페이지로 »');
			 
		}else{
			/* '취소' = 동작 X */
		};
		 
	});
	});



</script>


<meta charset="UTF-8">
<title>Flyscanner</title>
</head>
<body style="background-color: #F1F2F8;">

<!-- 가는날 항공권 정보 -->
<nav class="nav1">
<h2 style="width: 1600px; margin: 0px auto; text-align: center;">항공권 상세 정보</h2>
</nav>
<div class="goDiv1">
<table class="goTable1">
<tr>
<td class="td_goback">가는날</td>
<td class="td_center"><i style="font-size:20px" class="fa">&#xf072;</i><%=de_air %></td>
<td></td>
</tr>
<tr class="tr1">
<td><%=deNation.getDe_nation() %></td>
<td><img src="../img/go.png" id="go"></td>
<td><%=arrNation.getArr_nation() %></td>
</tr>
</table>
</div>


<div class="goDiv2">
<table class="goTable2">
<tr>
<td class="td_goback">가는날:<br><%=vo.getDe_day() %></td>
<td class="td_center"><i style="font-size:20px" class="fa">&#xf072;</i> 5시간</td>
<td>인원: <%=psg %><br>
<%=vo.getArr_day() %></td>
</tr>
<tr class="tr1">
<td><%=f.format(vo.getDe_time()) %></td>
<td><img src="../img/go.png" id="go"></td>
<td><%=f.format(vo.getArr_time()) %></td>
</tr>
<tr>
<td class="td_goback1"><%=deNation.getDe_nation() %></td>
<td class="td_center"></td>
<td class="td_goback1"><%=arrNation.getArr_nation() %></td>
</tr>
</table>
</div>

<% if(Integer.parseInt(request.getParameter("way"))==1){ %>

<%}else{ 
	int sID3 = Integer.parseInt(request.getParameter("sID3"));
	session.setAttribute("sID3", sID3);
	scheduleVO vo2 = dao.read2(Integer.parseInt(request.getParameter("sID3")));
%>

<!-- 오는날 항공권 정보-->
<div class="backDiv1">
<table class="backTable1">
<tr>
<td class="td_goback">오는날</td>
<td class="td_center"><i style="font-size:20px" class="fa">&#xf072;</i><%=ar_air %></td>
<td></td>
</tr>
<tr class="tr1">
<td><%=arrNation.getArr_nation() %></td>
<td><img src="../img/go.png" id="go"></td> 
<td><%=deNation.getDe_nation() %></td>
</tr>
</table>
</div>


<div class="backDiv2">
<table class="backTable2">
<tr>
<td class="td_goback">오는날:<br><%=vo2.getDe_day2() %></td>
<td class="td_center"><i style="font-size:20px" class="fa">&#xf072;</i> 5시간</td>
<td>인원: <%=psg %><br>
<%=vo2.getArr_day2() %></td>
</tr>
<tr class="tr1">
<td><%=f.format(vo2.getDe_time2()) %></td>
<td><img src="../img/go.png" id="go"></td> 
<td><%=f.format(vo2.getArr_time2()) %></td>
</tr>
<tr>
<td class="td_goback1"><%=arrNation.getArr_nation() %></td>
<td class="td_center"></td>
<td class="td_goback1"><%=deNation.getDe_nation() %></td>
</tr>
</table>
</div>
<%} %>
<!-- 탑승자정보 입력 -->

	<div style="width: 500px; margin: 0px auto; text-align: center;">
		<h2 style="font-weight: bold;">탑승객 정보 입력</h2>
	</div>
	<form action="payment.jsp" method="post" id="psgform">
	<%
		// i는 탑승인원
		for (int i = 1; i <= psg; i++) {
	%>
	<div style="width: 530px; height: 500px; margin: 0px auto;">
	
			<h3 style="padding-top: 5px;">
			<i style='font-size:24px' class='fas'>&#xf2bd;</i> 탑승객<%
				out.print(i);
			%>
			</h3>
			
			
			<div class="form-group">
				<label for="name">이름</label> <input name="psgName" type="text" class="form-control" id="p_name" placeholder="이름을 입력해 주세요">
			</div>
			<div class="form-group">
				<label for="gender">성별</label><br> <select id="p_gender" name="psgGender"
				style="width: 300px; height: 25px; font-size: 16px; border: 1px solid lightgray; border-radius: 5px;">
					<option value="0">성별선택</option>
					<option value="M">남</option>
					<option value="F">여</option>
				</select>
			</div>
			<div class="form-group">
				<label for="birth">생년월일</label> <input type="text" name="psgBirth"
					class="form-control" id="p_birth"
					placeholder="생년월일 8자리 입력 ex) 19900305" maxlength="8">
			</div>
			<div class="form-group">
				<label for="passport">여권번호</label> <input type="text"
					class="form-control" id="p_passport" name="passport"
					placeholder="여권 번호를 입력해 주세요" maxlength="9">
			</div>
			<div class="form-group">
				<label for="country">국적</label><br> <select id="p_country" name="country"
					style="width: 300px; height: 25px; font-size: 16px; border: 1px solid lightgray; border-radius: 5px;">
					<option value="0">국적선택</option>
					<option value="10">대한민국</option>
					<option value="20">싱가포르</option>
					<option value="30">필리핀</option>
					<option value="40">베트남</option>
					<option value="50">일본</option>
				</select>
			</div>
			<div class="form-group">
				<label for="mobile">연락처</label> <input type="text" name="mobile"
					class="form-control" id="p_mobile"
					placeholder="연락처를 '-' 없이 입력해 주세요 ex) 01012341234" maxlength="11">
			</div>
	
	</div>
	<%
		}
	%>
<div id="result" style="color: #00b359; width: 500px; margin: 0px auto; font-size: 15px; font-weight: bold;"></div>

<br>
<!-- 버튼 -->
<div class="form-group text-center">
		<button id="button1" class="btn btn-primary" style="width: 200px; height: 50px; font-size: 20px;">입력정보확인</button>
	</div>
	
	
	<div id="hiddenDiv">
    	<!-- 유저아이디 스케줄아이디 -->
    	<%-- <input type='text' name="uID" value=<%=session.getAttribute("uID") %>>
    	<input type='text' name="sID1" value=<%=session.getAttribute("sID1") %>>
    	<input type='text' name="sID2" value=<%=session.getAttribute("sID2") %>> --%>
    	<%-- <input type='text' name="psg" value=<%=psg %>> --%>
    	
    </div>
</form>
</body>
</html>