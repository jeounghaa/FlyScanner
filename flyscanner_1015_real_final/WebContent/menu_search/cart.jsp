<%@page import="java.text.SimpleDateFormat"%>
<%@page import="recommend.CountryDAO"%>
<%@page import="search.ScheduleVO"%>
<%@page import="java.util.List"%>
<%@page import="search.CartVO"%>
<%@page import="search.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String uID = (String)session.getAttribute("uID");
CartDAO dao = new CartDAO();
List<CartVO> list = dao.all(uID);
%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../css/cart.css">

</head>
<!-- 넘겨줘야할 값: departCtID, arriveCtID, way(왕복, 편도), 인원수, sID -->
<body>
   <div id="all">
      <div id="uu"><%=uID %></div>
      <div id="tt">   
<%

   for(int i=0; i<list.size(); i++) {
      CartVO vo = list.get(i);
      int depart = vo.getSvhedule().getDepartCtID();
      int arrive = vo.getSvhedule().getArriveCtID();
      CountryDAO countrydao = new CountryDAO();
%>
         <form action="search.jsp" method="get">
            <table class="cct">
               <tr>
                  <td class="title">
                     <input type="text" name="departCtID" value="<%=countrydao.nation(depart) %>" readonly="readonly"> 
                     - &nbsp;&nbsp;
                     <input type="text" name="arriveCtID" value="<%=countrydao.nation(arrive) %>" readonly="readonly" id="arriveCtID"> 
                  </td> 
                  <td class="hh"><%=vo.getcID()%></td>
                  <td id="de">
                     <input type="button" class="rem" value="X">
                  </td>
               </tr>
               <tr>
                  <td class="da"><input type="text" name="departTime" value="<%=vo.getSvhedule().getDepartTime().substring(0, 10)%>" readonly="readonly" id="departTime"> 
                   <input type="hidden" name="arriveTime" value="  " readonly="readonly">
                   ⠂인원&nbsp;<input type="text" name="seat" value="<%=vo.getCount() %>" readonly="readonly" id="seat">
                   </td>
                   <td></td>
                  <td style="color: #FFFFFF"><input type="hidden" name="way" value="1"></td>
               </tr>
               <tr class="ii">
                  <td class="cct_i" colspan="3">
                     <img alt="이미지" src="../img/trip1.jpg" class="img">
                  </td>
               </tr>
               <tr>
                  <td class="price">￦<%=vo.getSvhedule().getPrice() %></td>
                  <td><input type="submit" value="항공편 보기" class="sel"></td>
               </tr>
            </table>
         </form>
<%   
         }
%>
      </div>
   </div>
<script type="text/javascript">
$(function() {
   
      
 // 삭제 버튼 클릭 시
   /* $(".rem").click(function() { 
      var checkBtn = $(this);
      
      var tr = checkBtn.parent().parent();
      var td = tr.children();
      
      var cid = td.eq(1).text();
      console.log(cid)
      
      var uid = $('#uu').text()
      console.log(uid)
      
      $.ajax({
         url: "reCart.jsp",
         data:{
            cid: cid,// cart id
            uid: uid // user id
         },
         success: function(result) {
            $('#tt').empty()
            $('#tt').append(result)
         }
      })
   }) */
  $(document).on("click", ".rem", function () {
     var checkBtn = $(this);
      
      var tr = checkBtn.parent().parent();
      var td = tr.children();
      
      var cid = td.eq(1).text();
      console.log(cid)
      
      var uid = $('#uu').text()
      console.log(uid)
      
      $.ajax({
         url: "reCart.jsp",
         data:{
            cid: cid,// cart id
            uid: uid // user id
         },
         success: function(result) {
            $('#tt').empty()
            $('#tt').append(result)
         }
      })
  });
})
</script>
</body>
</html>