package search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import dbconnect.DBConnectionMgr;

public class CartDAO {
	Connection con;
	DBConnectionMgr dbcp;

	public CartDAO() throws Exception {
		dbcp = DBConnectionMgr.getInstance();
	}
	
	public void c_insert(CartVO vo) throws Exception {
		con = dbcp.getConnection();
		String sql = "insert into cart(isPaid, cartDate, count, sID, uID) values (?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setBoolean(1, vo.getisPaid());
		ps.setString(2, vo.getCartDate() );
		ps.setInt(3, vo.getCount());
		ps.setInt(4, vo.getsID());
		ps.setString(5, vo.getuID());
		
		ps.executeUpdate();
		dbcp.freeConnection(con, ps);
	}
	
	public void c_delete(int cid) throws Exception {
		con = dbcp.getConnection();
		String sql = "delete from cart where cID = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, cid);
		
		ps.executeUpdate();
		dbcp.freeConnection(con, ps);
	}
	
	public ArrayList<CartVO> all(String user) throws Exception {
		con = dbcp.getConnection();
		String sql = "SELECT * FROM cart INNER JOIN schedule ON cart.sID = schedule.sID WHERE cart.uID = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, user);
		
		ResultSet rs = ps.executeQuery();
		ArrayList<CartVO> list = new ArrayList<CartVO>();
		// cID, isPaid, cartDate, count, sID, uID
		while (rs.next()) { 
			CartVO vo = new CartVO();
			vo.setcID(rs.getInt("cID"));
			vo.setisPaid(rs.getBoolean("isPaid"));
			vo.setCartDate(rs.getString("cartDate"));
			vo.setCount(rs.getInt("count")); // 인원수
			vo.setsID(rs.getInt("sID"));
			vo.setuID(rs.getString("uID"));
			
			ScheduleVO svo = new ScheduleVO();
			svo.setsID(rs.getInt("sID"));
			svo.setDepartCtID(rs.getInt("departCtID"));
			svo.setArriveCtID(rs.getInt("arriveCtID"));
			svo.setDepartTime(rs.getString("departTime"));
			svo.setArriveTime(rs.getString("arriveTime"));
			svo.setPrice(rs.getInt("price"));
			vo.setSvhedule(svo);
			
			list.add(vo);
		}
		dbcp.freeConnection(con, ps, rs);
		return list;
	}
	
}
