<%@page import="java.text.SimpleDateFormat"%>
<%@page import="search.CartDAO"%>
<%@page import="search.CartVO"%>
<%@page import="search.CodeDAO"%>
<%@page import="recommend.CountryDTO"%>
<%@page import="search.ScheduleVO"%>
<%@page import="search.ScheduleDAO"%>
<%@page import="recommend.CountryDAO"%>
<%@page import="java.util.Date"%> 
<%@page import="java.util.List"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   String or = "seat";
   String or2 = "seat";
   int sid2 = 0; int sid3 = 0; // 스케줄아이디
   String de_air = ""; // 출발 항공사
   String ar_air = ""; // 도착 항공사
   String uID = (String)session.getAttribute("uID");
   int cID = 0;
   
   Date now = new Date();
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   String today = sdf.format(now);
   
   // 받아온 값들
   String depart_ct = request.getParameter("departCtID"); // 출발국가
   String arrive_ct = request.getParameter("arriveCtID"); // 도착국가
   String depart_time = request.getParameter("departTime"); // 출발일자
   String depart_time2 = request.getParameter("departTime"); // 출발일자
   String arrive_time = request.getParameter("arriveTime"); // 도착일자
   int way = Integer.parseInt(request.getParameter("way")); //왕복, 편도
      String seat = request.getParameter("seat"); // 인원수
      if(request.getParameter("cID") != null){
         cID = Integer.parseInt(request.getParameter("cID"));      
      }
      else {
         cID = 3;
      }
   
   System.out.print("나 뭐야????/?"+depart_time2);
   session.setAttribute("cID", cID);
   
   // ajax로 넘겨주기위해 년, 월, 일
   String year = depart_time.substring(0, 4);
   String month = depart_time.substring(5, 7);
   String day = depart_time.substring(8, 10);
   
   CountryDAO cdao = new CountryDAO();
   int de = cdao.nation(depart_ct); // 출발국가 코드
   int ar = cdao.nation(arrive_ct); // 도착국가 코드
   ScheduleDAO sdao = new ScheduleDAO();
   
   List<ScheduleVO> list = sdao.all(de, ar, depart_time+"%", or); 
   List<ScheduleVO> list2 = sdao.all(ar, de, arrive_time+"%", or2);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flyscanner</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="../css/search.css">
<script type="text/javascript">
   
   $(function() {
      $("#sID2").hide();
      $("#sID3").hide();
      sid2 = $("#sID2").val()
      
      if (<%=way%> == 1) {
         // 편도일 경우
         $("#arriveTime").hide();
         $("#oneway").prop("checked", true)
         $("#giho").hide();
         $("#in").hide();
         $("#out2").hide();
         $("#way").val(1);
      } else {
         // 왕복일 경우
         $("#arriveTime").show();
         $("#twoway").prop("checked", true)
         $("#giho").show();
         $("#in").show();
         $("#out2").show();
         $("#way").val(2);
      }
      
      // '정렬하기'버튼을 클릭 시
      $("#sb").click(function() {
         $('#tt').empty()
         var selectOption = $("#sel option:selected").text();
         $.ajax({ /* 비동기통신 */
            url: "reSearch.jsp",
            data: {
               de: <%=de%>,
               ar: <%=ar%>,
               year: <%=year%>,
               month: <%=month%>,
               day: <%=day%>,
               depart_ct: "<%=depart_ct%>",
               arrive_ct: '<%=arrive_ct%>',
               sortt: selectOption
            },
            success: function(result) {
               $('#tt').append(result)
            }
         })
      })// sb click end
      
      $(document).on("click", ".cart", function () {
         var cartBtn = $(this)
         var tr = cartBtn.parent().parent();
         var td = tr.children();
         var ss = td.eq(0).text(); // 스케줄id
         console.log(ss)
         $.ajax({
            url: "cartInsert.jsp",
            data: {
               count: <%=seat%>,
               sid: ss,
               uid: '<%=uID%>'
            },
            success: function() {
               alert("장바구니에 담겼습니다!")
            }
         })// ajax enx
      })
      
      $("#oneway").click(function() {
         if($(this).is(":checked")){
            $("#arriveTime").hide();
            /* 편도일 경우 */
            $("#giho").hide();
            $("#in").hide();
            $("#out2").hide();
            $("#way").val(1);
         }
      });
      $("#twoway").click(function() {
         if($(this).is(":checked")){
            $("#arriveTime").show();
            /* 왕복이면 보이게 */
            $("#way").val(2);
         }
      });
      
      $(document).on("click", ".checkBtn", function () {
         var checkBtn = $(this);
         
         // checkBtn.parent() : checkBtn의 부모는 <td>이다.
         // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
         var tr = checkBtn.parent().parent();
         var td = tr.children();
         
         // console.log("클릭한 Row의 모든 데이터 : "+tr.text());
         var airline = td.eq(0).text();
         var depart = td.eq(1).text();// 출발시간
         var arrive = td.eq(3).text();// 도착시간
         var ss = td.eq(4).text();// 도착시간
         var email = td.eq(5).text(); // 가격, 좌석
         
         console.log(airline); // 항공사
         console.log(depart); // 출발시간
         console.log(arrive); // 도착시간
         console.log(email); // 
         console.log(email.substring( 1, 7 ));
         console.log(ss);
         
         $("#departTime2").val(depart); // 출발시간
         $("#arriveTime2").val(arrive); // 도착시간
         $("#de_air").val(airline); // 항공사
         $("#price2").val(email.substring( 1, 7 )); // 가격
         $("#sID2").val(ss); // 가격
      })
      
      $(document).on("click", ".checkBtn2", function () {
         var checkBtn = $(this);
         
         // checkBtn.parent() : checkBtn의 부모는 <td>이다.
         // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
         var tr = checkBtn.parent().parent();
         var td = tr.children();
         
         var airline = td.eq(0).text();
         var depart = td.eq(1).text();
         var arrive = td.eq(3).text();
         var ss = td.eq(4).text(); // 스케줄id
         var email = td.eq(5).text(); // 가격, 좌석
         
         console.log(airline);
         console.log(depart);
         console.log(arrive);
         console.log(email);
         console.log(email.substring( 1, 7 ));
         console.log(ss);
         
         $("#departTime3").val(depart);
         $("#arriveTime3").val(arrive);
         $("#ar_air").val(airline);
         $("#price3").val(email.substring( 1, 7 ));
         $("#sID3").val(ss); // 가격
      })
   })
</script>
</head>
<body>
   <div id="all">
      <nav class="nav1">
         <!-- 출발지, 도착지, 인원수(편도인지 왕복인지) -->
         <div class="info"><%=depart_ct %> &nbsp;-&nbsp; <%=arrive_ct %>&nbsp;&nbsp;|&nbsp;&nbsp;<%=seat %>명</div>
            <!-- 편도인지 왕복인지에 따라 다르게 -->
            <%=depart_time %>  &nbsp;<div id="giho" style="display: inline">-</div>&nbsp;  <%=arrive_time %> 
         <select id="sel">
            <option value="" selected>정렬 기준</option>
            <option value="price">낮은 가격순</option>
            <option value="departTime">출발 시간순</option>
         </select>
         <input type="button" value="선택하기" id="sb">
      </nav>
      <!-- 출발지-도착지 지도 -->
      <div id="map" style="width:100%; height: 70vh;"></div>
      
      <!-- 항공권 다시 검색 -->
      <form method="get" class="re" id="d1" action="search.jsp">
         <div class="radio">
            <input type="radio" value="2" name="way" checked="checked" id="twoway" class="form-control">
            <label>왕복</label>
         </div>
         <div class="radio">
            <input type="radio" value="1" name="way" id="oneway" class="form-control">
            <label>편도</label>
         </div>
         <input type="text" name="departCtID" placeholder="출발국가" class="form-control" value="<%=depart_ct%>">
         <input type="text" name="arriveCtID" placeholder="도착국가" class="form-control" value="<%=arrive_ct%>">
         <input type="text" name="departTime" placeholder="출발일" id="departTime" class="form-control" value="<%=depart_time%>">
         <input type="text" name="arriveTime" placeholder="도착일" id="arriveTime" class="form-control" value="<%=arrive_time%>">
         <input type="text" name="seat" placeholder="인원" value="1" class="form-control" value="<%=seat%>">
         <button type="submit" id="btnSearch" class="btn btn-info btn-lg">검색</button>
      </form>
      
      <!-- accordion -->
      <div class="panel-group" id="accordion" role="tablist"
         aria-multiselectable="true">
         <!-- 이게 있어야 1이 꺼지고 2가 켜짐 -->
         <div class="panel">
            <div class="panel-heading">
               <h4 class="panel-title">
                  <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" 
                  aria-expanded="true" aria-controls="collapseOne" id="out"> 
                     가는 날 
                  </a> 
                  <a class="collapsed" data-toggle="collapse" data-parent="#accordion"
                     href="#collapseTwo" aria-expanded="false"   aria-controls="collapseTwo"
                     id="in"> 
                     오는 날
                  </a>
               </h4>
            </div>
            <!-- '가는날'탭 -->
            <div id="collapseOne" class="panel-collapse collapse in" aria-labelledby="headingOne">
               <div class="panel-body" id="tt">
               <%
                  for (int i = 0; i < list.size(); i++) {
                     ScheduleVO svo = list.get(i);
                     // 받아온 출발일 값
                     //String date = request.getParameter("")
                     //CountryDTO at = cdao.nation(vo.getArriveCtID());
                     CodeDAO codedao = new CodeDAO();
                     String airline = codedao.opt(svo.getAirline());
               %>
                  <table>
                     <tr>
                        <td class="a"><%=airline %></td><!-- 항공사 -->
                        <td class="b"><%=svo.getDepartTime() %></td><!-- 출발시간 -->
                        <td rowspan="2" class="c">
                           <img alt="화살표" src="../img/arrow.png" id="arrow"><br>
                           <p class="time">5시간</p>
                        </td><!-- 걸린시간 -->
                        <td class="d"><%=svo.getArriveTime() %></td><!-- 도착시간 -->
                        <td class="f"><%=svo.getsID()%></td>
                        <td rowspan="2" class="e">￦<%=svo.getPrice() %><br> <br> 
                           <input type="button" value="선택" class="checkBtn"><br> <br>
                           잔여좌석 <%=svo.getSeat() %> / 5
                        </td>
                     </tr>
                     <tr>
                        <td class="f"><%=svo.getsID()%></td>
                        <!-- 출발국가 -->
                        <td><%=depart_ct  %></td>
                        <!-- 도착국가 -->
                        <td><%=arrive_ct  %></td>
                        <td class="icon">
                           <button class="cart" ><img id="iii" src="../img/basket.png" alt="장바구니"></button>
                        </td>
                     </tr>
                  </table>
               <%
                     de_air = airline;
                  }
               %>
               </div><!-- panel-body end -->
            </div><!-- collapseOne end -->
         </div><!-- panel end -->
         <!-- '오는날'탭 -->
         <div class="panel panel-default">
            <div id="collapseTwo" class="panel-collapse collapse"   role="tabpanel" 
            aria-labelledby="headingTwo">
               <div class="panel-body">
                  <%
                  for (int i = 0; i < list2.size(); i++) {
                     ScheduleVO vo = list2.get(i);
                     // 받아온 출발일 값
                     //String date = request.getParameter("")
                     //CountryDTO at = cdao.nation(vo.getArriveCtID());
                     CodeDAO codedao = new CodeDAO();
                     String airline = codedao.opt(vo.getAirline());
                     
               %>
               <table>
                     <tr>
                        <td class="a"><%=airline %></td><!-- 항공사 -->
                        <td class="b"><%=vo.getDepartTime() %></td><!-- 출발시간 -->
                        <td rowspan="2" class="c">
                           <img alt="화살표" src="../img/arrow.png" id="arrow"><br>
                           <p class="time">걸린시간</p>
                        </td><!-- 걸린시간 -->
                        <td class="d"><%=vo.getArriveTime() %></td><!-- 도착시간 -->
                        <td class="f"><%=vo.getsID()%></td>
                        <td rowspan="2" class="e">￦<%=vo.getPrice() %><br> <br> 
                           <input type="button" value="선택" class="checkBtn2"><br> <br>
                           잔여좌석 <%=vo.getSeat() %> / 5
                        </td>
                     </tr>
                     <tr>
                        <td class="f"><%=vo.getsID()%></td>
                        <!-- 출발국가 -->
                        <td><%=arrive_ct  %></td>
                        <!-- 도착국가 -->
                        <td><%=depart_ct  %></td>
                        <td class="icon">
                           <button class="cart" ><img id="iii" src="../img/basket.png" alt="장바구니"></button>
                        </td>
                     </tr>
                  </table>
               <%
                     ar_air = airline;
                  }
               %>
               </div><!-- panel-body end -->
            </div><!-- collapseTwo end -->
         </div><!-- panel end -->
      </div><!-- panel-group end -->
      <form method="get" class="re" id="d2" action="../menu_payment/plane_psg.jsp">
         <div id="in2">
             <h4>가는날</h4>
             <!-- departctid, arrivectid -->
             <input type="hidden" id="sID2" name="sID2" readonly="readonly">
             <div>항공사
                  <br><input type="text" id="de_air" name="de_air" readonly="readonly">
               </div>
             <div>출발시간
                <br><input type="text" id="departTime2" name="departTime2" readonly="readonly">
             </div>
             <div>도착시간
                <br><input type="text" id="arriveTime2" name="arriveTime2" readonly="readonly">
             </div>
             <div>가격
                <br><input type="text" id="price2" name="price2" readonly="readonly">
             </div>
         </div>
         <br>
         <div id="out2">
            <h4>오는날</h4>
            <input type="hidden" id="sID3" name="sID3" readonly="readonly">
            <div>항공사
               <br><input type="text" id="ar_air" name="ar_air" readonly="readonly">
            </div>
            <div>출발시간
               <br><input type="text" id="departTime3" name="departTime3" readonly="readonly">
            </div>
            <div>도착시간
                <br><input type="text" id="arriveTime3" name="arriveTime3" readonly="readonly">
            </div>
            <div>가격
                <br><input type="text" id="price3" name="price3" readonly="readonly">
            </div>
         </div>
         <div>인원
             <input type="text" id="seat" name="seat" readonly="readonly" value=<%=seat %>>
         </div>
         <div>
             <input type="hidden" id="way" name="way" readonly="readonly" value="">
             <input type="hidden" id="way" name="cID" readonly="readonly" value="<%=cID%>">
         </div>
         <input type="submit" class="btn btn-info btn-lg" value="결제하기">
      </form><!-- d2 end -->
   </div><!-- all end -->
   <!-- 구글 지도 -->
   <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBoamQbwWnYDw_iXu9q-JSZsQpgHksPaak&callback=initMap&region=kr"></script>
   <script>
    function initMap() {
       <%
          CountryDAO dao = new CountryDAO();
          
          String[] s = new String[2];
          s = dao.location(depart_ct);
          
          String[] e = new String[2];
          e = dao.location(arrive_ct);
       %>
       var locations = [
           ['출발지', <%=s[0]%>, <%=s[1]%>],
           ['도착지', <%=e[0]%>, <%=e[1]%>]
         ];
      var map = new google.maps.Map(
        document.getElementById('map'), {
          zoom: 4,
          center: new google.maps.LatLng(21.736790, 109.017049)
        });
      for (var i = 0; i < locations.length; i++) {
            marker = new google.maps.Marker({
               id: i,
               position: new google.maps.LatLng(locations[i][1], locations[i][2]),
               map: map
            })
            
            var flightPlanCoordinates = [
            { lat: locations[0][1], lng: locations[0][2] },
            { lat: locations[1][1], lng: locations[1][2] },
          ];
            var flightPath = new google.maps.Polyline({
            path: flightPlanCoordinates,
            geodesic: true,
            strokeColor: "#FF0000",
            strokeOpacity: 1.0,
            strokeWeight: 2,
          });
          flightPath.setMap(map);
         }
    }
  </script>
</body>
</html>