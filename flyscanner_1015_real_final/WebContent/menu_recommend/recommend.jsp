<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btnSearch").click(function() {
			$("#result").empty()
			var conList = []
			var themeList = []

			$("input[name='continent']:checked").each(function(){
				conList.push($(this).val())
            })
            
			$("input[name='theme']:checked").each(function(){
				themeList.push($(this).val())
            })
			
			$.ajax({
				url: "searching.jsp",
				data: {
					continent: conList,
					theme: themeList
				},
				traditional: true,
				success : function(data){
					console.log("난데이터"+data)
					$("#result").append(data)
				},
			})
		})
	})
</script>
</head>
<body>
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
	<button id="btnSearch">검색</button>
	<div id="result"></div>
</body>
</html>