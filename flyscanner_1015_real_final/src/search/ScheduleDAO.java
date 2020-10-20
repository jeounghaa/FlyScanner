package search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import dbconnect.DBConnectionMgr;
import recommend.CountryDTO;

public class ScheduleDAO {
	Connection con;
	DBConnectionMgr dbcp;

	public ScheduleDAO() throws Exception {
		dbcp = DBConnectionMgr.getInstance();
	}
	
	public ArrayList<ScheduleVO> all(int depart, int arrive, String departtime, String ob) throws Exception {
		con = dbcp.getConnection();
		String sql = "SELECT * FROM schedule WHERE departCtID = ? "
				+ "AND arriveCtID = ? "
				+ "AND departTime LIKE ? "
				+ "ORDER BY "+ob;
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, depart);
		ps.setInt(2, arrive);
		ps.setString(3, departtime);
//		ps.setString(4, ob);
		
		System.out.println(ps);

		ResultSet rs = ps.executeQuery();
		ArrayList<ScheduleVO> list = new ArrayList<ScheduleVO>();
		while (rs.next()) { 
			ScheduleVO svo = new ScheduleVO();
			int sID = rs.getInt("sID");
			String departTime = rs.getString("departTime");
			String arriveTime = rs.getString("arriveTime");
			int airline = rs.getInt("airline");
			int price = rs.getInt("price");
			int seat = rs.getInt("seat");
			int departCtID = rs.getInt("departCtID");
			int arriveCtID = rs.getInt("arriveCtID");
			
			svo.setsID(sID);
			svo.setDepartTime(departTime);
			svo.setArriveTime(arriveTime);
			svo.setAirline(airline);
			svo.setPrice(price);
			svo.setSeat(seat);
			svo.setDepartCtID(departCtID);
			svo.setArriveCtID(arriveCtID);
			
			list.add(svo);
		}
		dbcp.freeConnection(con, ps, rs);
		return list;
	}
	
	
}
