<%@page import="user.UserVO"%>
<%@page import="user.UserDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
   <%
    	String pw =request.getParameter("pw");
        UserDAO dao = new UserDAO();
        UserVO vo = dao.one4(pw);
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">

<script type='text/javascript'
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

<script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>

<script type='text/javascript'>
	//달력
	$(function() {

		$('#birth').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			format : "yy/mm/dd",
			language : "kr"
		});

		//중복확인

		$('#Email').blur(function() {
							$.ajax({
										url : "../menu_user/check.jsp",
										data : {
											id : $('#Email').val()
										},
										success : function(result) {
											id = document
													.getElementById('Email').value
											if (id.length <= 7) {
												//alert("아이디를 5글자 이상 입력하세요")
												$('#d1').html('<font color =red>최소 8글자입력하세요</font>')

												if (result == 1) {
													$('#d1').html('<font color =red>이미 가입된 아이디입니다</font>')
												}
											} else {
												$('#d1').html('<font color =red>멋진 아이디군요!</font>')
											}
										}
									})
						})

		//pw 동일여부

		$("#pw1").blur(function() {

			n1 = document.getElementById('pw').value
			n2 = document.getElementById('pw1').value

			if (n1 == n2) {
				$('#d2').html('<font color=red><b></b></font>')
			} else {
				$('#d2').html('<font color=red><b>패스워드 확인해주세요</b></font>')
			}

	})
			$("#phone").blur(function() {

			phone = document.getElementById('phone').value
			

			if (phone.length >=12) {
				$('#d3').html('<font color=red><b>최대글자수 11입니다</b></font>')
			} else {
				$('#d3').html('<font color=red><b></b></font>')
			}

	})
	$("#passport").blur(function() {

		passport = document.getElementById('passport').value
			

			if (passport.length >=10) {
				$('#d4').html('<font color=red><b>최대글자수 9입니다</b></font>')
			} else {
				$('#d4').html('<font color=red><b></b></font>')
			}

	})

	$("#b1").click(function() {
				Email = $('#Email').val();
				pw = $('#pw').val();
				nameKor = $('#nameKor').val();
				nameEng = $('#nameEng').val();
				gender = $("input[name='gender']:checked").val();
				birth = $('#birth').val();
				phone = $('#phone').val();
				ctID = $('#ctID').val();
				passport = $('#passport').val();
				pw1 = $('#pw1').val();
						
						if (Email ==""|| pw==""|| pw1==""|| nameKor==""||nameEng==""||gender =="" ||birth ==""||phone ==""||ctID ==""||passport=="") {
							 alert("값을 모두 입력해주세요")
						}else if (n1==n2) {
								location.href='../menu_user/formal1.jsp?Email='+Email+'&pw='+pw+'&nameKor='+nameKor+'&nameEng='+nameEng+'&gender='+gender+'&birth='+birth+'&phone='+phone+'&ctID='+ctID+'&passport='+passport
						}else{ 
							alert("패스워드 확인해주세요")
						}
					})
               
			})
		
</script>


</head>
<body>
<div class="container">
		<div class="row">
			<div class="col-sm-10 col-md-10 col-lg-10 mx-5">
				<div class="card card-signin my-10">
					<div class="card-body">
						<h5 class="card-title text-center">회원수정</h5>
						<div class="col-sm-10 col-md-10 col-lg-9 mx-auto">
							<div class="col-sm-12">
								<input type="Email" id="Email" name="Email" class="form-control"
									 required autofocus class="col-sm-7"value="<%=session.getAttribute("uID") %>" readonly>
								<div class="col-sm-30" id="d1"></div>
								<label for="inputEmail">이메일 </label>
							</div>

							<div class="col-sm-12">
								<input type="password" id="pw" name="pw" class="form-control"
									placeholder="Password" required> <label
									for="inputPassword">패스워드</label>
							</div>

							<div class="col-sm-12">
								<input type="password" id="pw1" name="pw1" class="form-control"
									placeholder="Password" required>
								<div class="col-sm-30" id="d2"></div>
								<label for="inputPassword">패스워드 확인</label>
							</div>


							<div class="col-sm-12">
								<input type="text" id="nameKor" name="nameKor" class="form-control"
									placeholder="nameKor" required > <label
									for="inputnameKor">이름</label>
							</div>

							<div class="col-sm-12">
								<input type="text" id="nameEng" name="nameEng"
									class="form-control" placeholder="nameEng" required> <label
									for="inputnameEng">영문 이름</label>
							</div>

							<div class="col-sm-12">
								<label class="btn btn-primary"> <input type="radio"name="gender"id="option2"autocomplete="off"value="m">
									남자
								</label> <label class="btn btn-primary"> <input type="radio"name="gender"id="option3"autocomplete="off"value="f">
									여자
								</label><br> <label for="inputgender">성별</label>

							</div>

							<div class="col-sm-12">
								<input type="text" id="birth" name="birth" class="form-control"
									placeholder="birth" required>생년월일

							</div>

							<div class="col-sm-12">
								<input type="text" id="phone" name="phone" class="form-control"
									placeholder="phone" required><div class="col-sm-30" id="d3"></div>  <label for="inputgender">휴대폰
									번호</label>
							</div>

							<div class="col-sm-12">
								<select name="ctID" id="ctID">
									<option value="10">대한민국</option>
									<option value="20">베트남</option>
									<option value="30">대한민국</option>
									<option value="40">대한민국</option>
									<option value="50">대한민국</option>
								</select> <br>국가
							</div>

							<div class="col-sm-12">
								<input type="text" id="passport" name="passport"
									class="form-control" placeholder="passport" required><div class="col-sm-30" id="d4"></div> <label
									for="inputpassport">여권번호</label>
							</div>
							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="submit" id="b1">회원가입</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>