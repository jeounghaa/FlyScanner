package recommend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dbconnect.DBConnectionMgr;

public class HashtagDAO {
	Connection con;
	DBConnectionMgr dbcp;

	public HashtagDAO() {
		dbcp = DBConnectionMgr.getInstance();
	}

	public ArrayList<HashtagDTO> read(ArrayList<String> list, String[] continent) throws Exception {
		con = dbcp.getConnection();
		ArrayList<HashtagDTO> data = new ArrayList<HashtagDTO>();
		String contin = null;
		
		if (continent != null) {
			contin = "(continent IN (";
			for (int i = 0; i < continent.length; i++) {
				contin = contin + continent[i] + ",";
			}
			contin = contin.substring(0, contin.length() - 1) + "))";
		}

		String sql = "SELECT nation FROM hashtag INNER JOIN country ON hashtag.ctID=country.ctID WHERE " + contin + " AND ";

		for (int i = 0; i < list.size(); i++) {
			sql = sql + list.get(i) + "=1 AND ";
		}
		sql = sql.substring(0, sql.length() - 5);
		System.out.println(sql);

		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			HashtagDTO dto = new HashtagDTO();
			String nation = rs.getString("nation");
			dto.setCtID(nation);
			data.add(dto);
		}
		
		return data;
	}
	
	public ArrayList<HashtagDTO> read2(ArrayList<String> list, String[] continent) throws Exception {
		con = dbcp.getConnection();
		ArrayList<HashtagDTO> data = new ArrayList<HashtagDTO>();
		String contin = null;
		
		if (continent != null) {
			contin = "(continent IN (";
			for (int i = 0; i < continent.length; i++) {
				contin = contin + continent[i] + ",";
			}
			contin = contin.substring(0, contin.length() - 1) + "))";
		}
		
		String sql = "SELECT nation FROM hashtag INNER JOIN country ON hashtag.ctID=country.ctID WHERE " + contin + " AND (";
		
		for (int i = 0; i < list.size(); i++) {
			sql = sql + list.get(i) + "=1 OR ";
		}
		sql = sql.substring(0, sql.length() - 4) + ")";
		System.out.println(sql);
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			HashtagDTO dto = new HashtagDTO();
			String nation = rs.getString("nation");
			dto.setCtID(nation);
			
			data.add(dto);
		}
		
		dbcp.freeConnection(con, ps);
		
		return data;
	}
	
	public ArrayList<String> read3(String[] continent, String[] theme) throws Exception {
		con = dbcp.getConnection();
		ArrayList<String> list = new ArrayList<String>();
		
		String contin = null;
		if (continent != null) {
			contin = "(continent IN (";
			for (int i = 0; i < continent.length; i++) {
				contin = contin + continent[i] + ",";
			}
			contin = contin.substring(0, contin.length() - 1) + "))";
		}
		
		String sql = "SELECT nation FROM hashtag INNER JOIN country ON hashtag.ctID=country.ctID WHERE " + contin + " AND (";
		if (theme.length > 0) {
			for (int i = 0; i < theme.length; i++) {
				sql = sql + theme[i] + "=1 OR ";
			}
			sql = sql.substring(0, sql.length() - 4) + ")";
			System.out.println(sql);			
		}
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			HashtagDTO dto = new HashtagDTO();
			String nation = rs.getString("nation");
			list.add(nation);
		}
		
		dbcp.freeConnection(con, ps);
		
		return list;
	}
}
