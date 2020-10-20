<%@page import="java.util.Date"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script type='text/javascript'></script
>
<%
	//1. VO를 만들어서
UserVO vo = new UserVO();

Date date = new Date();
//2. 전달되는 값 받은 다음, VO에 넣어야 함.
String id = request.getParameter("Email");
String pw = request.getParameter("pw");
String nameKor = request.getParameter("nameKor");
String nameEng = request.getParameter("nameEng");
String gender = request.getParameter("gender");
String birth = request.getParameter("birth");
String phone = request.getParameter("phone");
String passport = request.getParameter("passport");
String ctID = request.getParameter("ctID");


System.out.println("내이름"+nameKor);

vo.setUid(id);
vo.setPw(pw);
vo.setNamekor(nameKor);
vo.setNameEng(nameEng);
vo.setBirth(birth);
vo.setPhone(phone);
vo.setPassport(passport);
vo.setGender(gender);
vo.setCtID(ctID);

//3. DAO이용해서, insert처리함.
UserDAO dao = new UserDAO();
boolean result = dao.create(vo);

//4. 처리결과를 client알려주어야함.
String check = "가입완료되엇습니다";
if (result) {
	check = "다시확인해주세요";
}
%>
</head>
<body>
	<div class="container">
		<div class="row" color="red">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h2 class="card-title text-center">
							회원가입 완료!
							</h2>
                                        <br>
                                        <br>
                                        <br>
							
										 <label for="inputEmail"><a href="../menu_user/login.html">로그인</a></label>
										 </div>
								<div class="form-label-group">
								
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>