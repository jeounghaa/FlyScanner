<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- ajax CDN -->
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- 달력 CDN  -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- BS CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- CSS -->
<link href="css/style2.css" rel="stylesheet">

<script>
	$(function(){
		$("#btn").click(function() {
			$("#result2").empty()
			var conList = []
			var themeList = []

			$("input[name='continent']:checked").each(function(){
				conList.push($(this).val())
            })
            
			$("input[name='theme']:checked").each(function(){
				themeList.push($(this).val())
            })
			
			$.ajax({
				url: "menu_recommend/searching.jsp",
				data: {
					continent: conList,
					theme: themeList
				},
				traditional: true,
				success : function(data) {
					list = data.split(',')

					for(var i=0; i < list.length-1; i++) {
						$("#result2").append("<button id='btnCountry'>"+list[i]+"</button>&nbsp;&nbsp;")
					}
				}
			})
		})
		
		$(document).on("click", "#btnCountry", function (e) {
			console.log(e)
			name = $("#btnCountry").text()
			document.getElementById("arriveCtID").value = name
		});
		
		$("#departTime").datepicker({
			dateFormat: "yy-mm-dd",
			changeYear: true,
			changeMonth: true,
			minDate: 0,
			maxDate: "+1m +1w",
			onClose: function (selectedDate) {
				$("#arriveTime").datepicker("option", "minDate", selectedDate);
			}
		});
		
		$("#arriveTime").datepicker({
			dateFormat: "yy-mm-dd",
			changeYear: true,
			changeMonth: true,
			minDate: 0,
			maxDate: "+1m +1w",
			onClose: function (selectedDate) {
				$("#departTime").datepicker("option", "maxDate", selectedDate);
			}
		});
		
		$("#twoway").click(function() {
			if($(this).is(":checked")){
				$("#arriveTime").show();
			}
		});
		
		$("#oneway").click(function() {
			if($(this).is(":checked")){
				$("#arriveTime").hide();
			}
		});
		
	});

</script>

</head>
<body>
  <header id="header">
    <div class="container">
      <span class="logo"><a href="index.jsp">Flyscanner</a></span>
      <div class="fun">
	      <a href="menu_user/login.html" class="scrollto" id="login">Login</a>
	      <a href="menu_search/cart.jsp" class="scrollto" id="cart">cart</a>      
	      <a href="menu_user/MyPage.jsp" class="scrollto">My Page</a>      
      </div>
    </div>
  </header>
  
  <section id="hero">
    <div class="hero-container">
      <h1>어디로 떠나볼까요?</h1>
      <form action="menu_search/search.jsp" method="get" role="form" class="form-inline">
      	<div class="form-row" id="rs">
      		<div class="radio">
      			<input type="radio" value="2" name="way" checked="checked" id="twoway" class="form-control">
      			<label class="radio">왕복</label>
      		</div>
      		<div class="radio">
      			<input type="radio" value="1" name="way" id="oneway" class="form-control">
      			<label class="radio">편도</label>
      		</div>
      	</div>
      	
      	<div class="form-row">
      		<div class="form-group">
      			<input type="text" name="departCtID" placeholder="출발국가" class="form-control" id="departCtID">
      		</div>
      		<div class="form-group">
      			<input type="text" name="arriveCtID" placeholder="도착국가" class="form-control" id="arriveCtID">
      		</div>
      		<div class="form-group">
      			<input type="text" name="departTime" placeholder="출발일" id="departTime" class="form-control">
      		</div>
      		<div class="form-group">
      			<input type="text" name="arriveTime" placeholder="도착일" id="arriveTime" class="form-control">
      		</div>
      		<div class="form-group">
      			<input type="text" name="seat" placeholder="인원" value="1" class="form-control">
      		</div>
      	</div>
      	
      	<div class="form-row">
     			<button type="submit" id="btnSearch" class="btn btn-info btn-lg">검색</button>
      	</div>
      </form>
    </div>
  </section>
  
  <a href="http://127.0.0.1:8000/" class="lsy">추천으로 슝슝(로컬서버)</a><br>
  <a href="http://flyscanner2.pythonanywhere.com/" class="lsy">추천으로 슝슝(웹 서버)</a><br>
  
  <div class="recommend">
  	<div class="container">
  		<h2>어디로 가고 싶으세요?</h2><br>
	  	<label>지역</label><br>
		<input type="checkbox" name="continent" value="10" id="africa">아프리카	
		<input type="checkbox" name="continent" value="11" id="asia">아시아	
		<input type="checkbox" name="continent" value="12" id="southamerica">남아메리카
		<input type="checkbox" name="continent" value="13" id="europe">유럽
		<input type="checkbox" name="continent" value="14" id="oceania">오세아니아	
		<input type="checkbox" name="continent" value="15" id="northamerica">북아메리카
		<br><br>
		<label>여행테마</label><br>
		<input type="checkbox" name="theme" value="food" id="food">음식관광
		<input type="checkbox" name="theme" value="activity" id="activity">액티비티
		<input type="checkbox" name="theme" value="history" id="history">역사유적지
		<input type="checkbox" name="theme" value="themepark" id="themepark">테마파크/국립공원
		<input type="checkbox" name="theme" value="hotel" id="hotel">호캉스
		<input type="checkbox" name="theme" value="spa" id="spa">온천/스파
		<input type="checkbox" name="theme" value="shopping" id="shopping">쇼핑
		<input type="checkbox" name="theme" value="sports" id="sports">스포츠경기 관람
		<input type="checkbox" name="theme" value="festival" id="festival">지역축제
		<input type="checkbox" name="theme" value="religion" id="religion">종교/성지순례
		<input type="checkbox" name="theme" value="citytour" id="citytour">도시투어
		<input type="checkbox" name="theme" value="island" id="island">섬
		<input type="checkbox" name="theme" value="exhibition" id="exhibition">문화예술/공연
		<br><br>
		<button id="btn">검색</button><br><br>
		<div id="result2"></div>
  	</div>
  </div>

</body>
</html>