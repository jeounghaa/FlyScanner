<%@page import="search.CodeDAO"%>
<%@page import="java.util.List"%>
<%@page import="search.ScheduleVO"%>
<%@page import="search.ScheduleDAO"%>
<%@page import="recommend.CountryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String de_air = "";
int sid2 = 0;

// 넘겨받은 값
int de = Integer.parseInt(request.getParameter("de"));
int ar = Integer.parseInt(request.getParameter("ar"));
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String depart_time = year + "-" + month + "-" + day + "%";
String or = request.getParameter("sortt");
String depart_ct = request.getParameter("depart_ct").trim();
String arrive_ct = request.getParameter("arrive_ct");

ScheduleDAO sdao = new ScheduleDAO();
 /* "SELECT * FROM schedule WHERE departCtID = ? "
		+ "AND arriveCtID = ? "
		+ "AND departTime LIKE ? "
		+ "ORDER BY "+ob; */
if(or.equals("낮은 가격순")){
	or = "price";
} else if(or.equals("출발 시간순")) {
	or = "departTime";
}
System.out.println(de);
System.out.println(ar);
System.out.println(depart_time);
System.out.println(or);
System.out.println("--------------------");
List<ScheduleVO> list = sdao.all(de, ar, depart_time, or); 

String[] c = new String[list.size()]; // 장바구니 id값
String[] t = new String[list.size()];
		
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
			<p class="time">걸린시간</p>
		</td><!-- 걸린시간 -->
		<td class="d"><%=svo.getArriveTime() %></td><!-- 도착시간 -->
		<td></td>
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
	sid2 = svo.getsID();	
}
%>
