package payment;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.text.SimpleDateFormat;

import dbconnect.DBConnectionMgr;


public class scheduleDAO {
	Connection con; // 전역변수
	DBConnectionMgr dbcp;

	public scheduleDAO() throws Exception {
		dbcp = DBConnectionMgr.getInstance();
		System.out.println("2. DB연결 성공");
	}

	//가는날 스케줄
	public scheduleVO read(int sID1) throws Exception {
		con = dbcp.getConnection();
		String sql = "select * from schedule where sID = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, sID1);
		
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		
		scheduleVO bag = new scheduleVO();
		
		if (rs.next()) { // 결과가 있는지 없는지 체크
			
			Date de_day = rs.getDate("departTime");
			Date arr_day = rs.getDate("arriveTime");
			Time de_time = rs.getTime("departTime");
			Time arr_time = rs.getTime("arriveTime");
			int airline = rs.getInt("airline");
			int price = rs.getInt("price");
			int seat = rs.getInt("seat");
			int de_ct = rs.getInt("departCtID");
			int arr_ct = rs.getInt("arriveCtID");
			
			bag.setDe_day(de_day);
			bag.setArr_day(arr_day);
			bag.setDe_time(de_time);
			bag.setArr_time(arr_time);
			bag.setAirline(airline);
			bag.setPrice(price);
			bag.setSeat(seat);
			bag.setDe_ct(de_ct);
			bag.setArr_ct(arr_ct);
			
	
			
			
		} else {
			System.out.println("검색결과가 없어요.");
		}
		dbcp.freeConnection(con, ps);
		return bag;
		
	}
	//오는날 스케줄
	public scheduleVO read2(int sID2) throws Exception {
		con = dbcp.getConnection();
		String sql = "select * from schedule where sID = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, sID2);
		
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		
		scheduleVO bag = new scheduleVO();
		
		if (rs.next()) { // 결과가 있는지 없는지 체크
			
			Date de_day2 = rs.getDate("departTime");
			Date arr_day2 = rs.getDate("arriveTime");
			Time de_time2 = rs.getTime("departTime");
			Time arr_time2 = rs.getTime("arriveTime");
			int airline2 = rs.getInt("airline");
			int price2 = rs.getInt("price");
			int seat2 = rs.getInt("seat");
			int de_ct2 = rs.getInt("departCtID");
			int arr_ct2 = rs.getInt("arriveCtID");
			
			bag.setDe_day2(de_day2);
			bag.setArr_day2(arr_day2);
			bag.setDe_time2(de_time2);
			bag.setArr_time2(arr_time2);
			bag.setAirline2(airline2);
			bag.setPrice2(price2);
			bag.setSeat2(seat2);
			bag.setDe_ct2(de_ct2);
			bag.setArr_ct2(arr_ct2);
			
	
			
			
		} else {
			System.out.println("검색결과가 없어요.");
		}
		dbcp.freeConnection(con, ps);
		return bag;
		
	}
	
	
	
	//출발나라
		public scheduleVO deNation(int sID1) throws Exception {
			con = dbcp.getConnection();
			String sql = "SELECT country.nation FROM country INNER JOIN schedule ON country.ctID = schedule.departCtID WHERE schedule.sID = ?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1, sID1);
			
			ResultSet rs = ps.executeQuery();
			System.out.println("4. SQL문 전송 성공.!!");
			
			scheduleVO bag = new scheduleVO();
			
			if (rs.next()) { // 결과가 있는지 없는지 체크
				String de_nation = rs.getString("nation");
				bag.setDe_nation(de_nation);

				
			} else {
				System.out.println("검색결과가 없어요.");
			}
			dbcp.freeConnection(con, ps);
			return bag;
			
		}
	
	//도착나라
	public scheduleVO arrNation(int sID1) throws Exception {
		con = dbcp.getConnection();
		String sql = "SELECT country.nation FROM country INNER JOIN schedule ON country.ctID = schedule.arriveCtID WHERE schedule.sID = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, sID1);
		
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		
		scheduleVO bag = new scheduleVO();
		
		if (rs.next()) { // 결과가 있는지 없는지 체크
			String arr_nation = rs.getString("nation");

			bag.setArr_nation(arr_nation);
			
		} else {
			System.out.println("검색결과가 없어요.");
		}
		dbcp.freeConnection(con, ps);
		return bag;
		
	}

	
	
	
	
	
}
