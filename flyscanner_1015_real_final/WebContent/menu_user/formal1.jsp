<%@page import="user.UserVO"%>

<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<!-- 1.id값 받아와야함. -->
<!-- 2.dao와 연동하여 결과 받아와야함. -->
<!-- 3.html로 만들어서 전송해야함. -->

<%


UserVO  vo = new UserVO();
//2. 전달되는 값 받은 다음, VO에 넣어야 함.
String id = request.getParameter("Email");
String pw = request.getParameter("pw");
String nameKor = request.getParameter("nameKor");
String nameEng = request.getParameter("nameEng");
String birth = request.getParameter("birth");
String gender = request.getParameter("gender");
String phone = request.getParameter("phone");
String passport = request.getParameter("passport");
String ctID = request.getParameter("ctID");


vo.setUid(id);
vo.setPw(pw);
vo.setNamekor(nameKor);
vo.setNameEng(nameEng);
vo.setBirth(birth);
vo.setGender(gender);
vo.setPhone(phone);
vo.setPassport(passport);
vo.setCtID(ctID);



UserDAO dao = new UserDAO();
boolean result = dao.update(vo);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<div class="row" color="red">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h2 class="card-title text-center">
							</h2>
								<div class="form-label-group">
									<h1>회원 수정완료</h1>
							<a href="../index2.jsp">메인</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>