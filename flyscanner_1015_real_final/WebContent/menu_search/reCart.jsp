<%@page import="recommend.CountryDAO"%>
<%@page import="java.util.List"%>
<%@page import="search.CartVO"%>
<%@page import="search.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
CartDAO dao = new CartDAO();
String cid = request.getParameter("cid");
System.out.println(cid);
dao.c_delete(Integer.parseInt(cid.trim()));
String uid = request.getParameter("uid");
List<CartVO> list = dao.all(uid);
//System.out.println(uid);

	
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
