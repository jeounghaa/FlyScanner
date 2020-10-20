package recommend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbconnect.DBConnectionMgr;

public class CountryDAO {
	Connection con;
	DBConnectionMgr dbcp;

	public CountryDAO() throws Exception {
		dbcp = DBConnectionMgr.getInstance();
	}
	
	// 나라를 String으로 받아오면 ctid 넘겨줌
	public int nation(String nation) throws Exception {
		con = dbcp.getConnection();
		String sql = "select ctID from country where nation = '" + nation + "'"
				+ "and attraction is null";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		
		int result = 0; 
		if (rs.next()) {
			int ctID = rs.getInt("ctID");
			result = ctID;
		} else {
			System.out.println("결과x");
		}
		dbcp.freeConnection(con, ps, rs);
		return result;
	}
	
	// 나라를 String으로 받아오면 ctid 넘겨줌
	public String nation(int ctid) throws Exception {
		con = dbcp.getConnection();
		String sql = "SELECT nation FROM country WHERE ctID = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, ctid);
		
		ResultSet rs = ps.executeQuery();
		
		String result = ""; 
		if (rs.next()) {
			String nation = rs.getString("nation");
			result = nation;
		} else {
			System.out.println("결과x");
		}
		dbcp.freeConnection(con, ps, rs);
		return result;
	}
	
	
	// 위도 경도
	public String[] location(String nation) throws Exception {
		String[] s = new String[2];
		
		con = dbcp.getConnection();
		String sql = "select latitude, longitude from country where nation = '" + nation + "'"
				+ "and attraction is null";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		
		if (rs.next()) {
			s[0] = rs.getString("latitude");
			s[1] = rs.getString("longitude");
		} else {
			System.out.println("결과x");
		}
		dbcp.freeConnection(con, ps, rs);
		return s;
	}
}
