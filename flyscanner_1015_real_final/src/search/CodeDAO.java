package search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import dbconnect.DBConnectionMgr;
import recommend.CountryDTO;

public class CodeDAO {
	Connection con;
	DBConnectionMgr dbcp;

	public CodeDAO() throws Exception {
		dbcp = DBConnectionMgr.getInstance();
	}
	
	public String opt(int cdid) throws Exception {
		con = dbcp.getConnection();
		String sql = "select opt from code where cdID = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, cdid);
		
		ResultSet rs = ps.executeQuery();
		String result = null;
		if (rs.next()) {
			String opt = rs.getString("opt");
			result = opt;
		} else {
			System.out.println("결과x");
		}
		dbcp.freeConnection(con, ps, rs);
		return result;
	}
	
}
