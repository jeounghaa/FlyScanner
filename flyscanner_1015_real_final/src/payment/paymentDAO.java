package payment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import dbconnect.DBConnectionMgr;

public class paymentDAO {
	Connection con; // 전역변수
	DBConnectionMgr dbcp;

	public paymentDAO() throws Exception {
		dbcp = DBConnectionMgr.getInstance();
		System.out.println("2. DB연결 성공");
	}

	// payment 테이블 저장

	public boolean create1(paymentVO vo) throws Exception {
		con = dbcp.getConnection();
		// 3. sql문을 만든다(create)
		String sql = "insert into payment values(null,?,?,?,now(),?)";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, vo.getCardCom());
		ps.setString(2, vo.getCardNum());
		ps.setString(3, vo.getPayPlan());
		ps.setString(4, vo.getuID());
		System.out.println("3. SQL문 생성 성공!!");

		// 4. sql문을 전송
		int row = ps.executeUpdate();
		System.out.println("4. SQL문 전송 성공!!");
		boolean result = false;
		if (row == 1) {
			result = true;
		}
		dbcp.freeConnection(con, ps);
		return result;

	}

	//booking 테이블 저장
	public boolean createBooking(paymentVO vo) throws Exception {
		con = dbcp.getConnection();
		// 3. sql문을 만든다(create)
		String sql = "insert into booking values(null,now(),?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
	
		ps.setInt(1, vo.getsID());
		ps.setString(2, vo.getuID());
		ps.setInt(3, vo.getpID());
		System.out.println("3. SQL문 생성 성공!!");

		// 4. sql문을 전송
		int row = ps.executeUpdate();
		System.out.println("4. SQL문 전송 성공!!");
		boolean result = false;
		if (row == 1) {
			result = true;
		}
		dbcp.freeConnection(con, ps);
		return result;

	}
	 

	// bookingdetail 테이블 저장
	public boolean createBD(paymentVO vo) throws Exception {
		con = dbcp.getConnection();
		// 3. sql문을 만든다(create)
		String sql = "insert into bookingdetail values(null,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, vo.getPsgName());
		ps.setString(2, vo.getPsgGender());
		ps.setString(3, vo.getPsgBirth());
		ps.setString(4, vo.getMobile());
		ps.setString(5, vo.getPassport());
		ps.setInt(6, vo.getbID());
		ps.setInt(7, vo.getCountry());

		System.out.println("3. SQL문 생성 성공!!");

		// 4. sql문을 전송
		int row = ps.executeUpdate();
		System.out.println("4. SQL문 전송 성공!!");
		boolean result = false;
		if (row == 1) {
			result = true;
		}
		dbcp.freeConnection(con, ps);
		return result;

	}

	// booking bID 불러오기
	public int read(String uID) throws Exception {
		System.out.println(uID);
		con = dbcp.getConnection();
		// 3. sql문을 만든다(create)
		String sql = "SELECT * FROM booking where uID = '"+uID.trim()+"' ORDER BY bID DESC LIMIT 1";
		PreparedStatement ps = con.prepareStatement(sql);
		
		// 4. sql문을 전송

		ResultSet rs = ps.executeQuery();
		
		System.out.println("4. SQL문 전송 성공!!");
		int bID1 = 0;
		if (rs.next()) {
			bID1 = rs.getInt("bID");
			
		}
		dbcp.freeConnection(con, ps);
		return bID1;

	}
	
	// payment pID 불러오기
		public int readpID(String uID) throws Exception {
			System.out.println(uID);
			con = dbcp.getConnection();
			// 3. sql문을 만든다(create)
			String sql = "SELECT * FROM payment where uID = '"+uID.trim()+"' ORDER BY pID DESC LIMIT 1";
			PreparedStatement ps = con.prepareStatement(sql);
			
			// 4. sql문을 전송

			ResultSet rs = ps.executeQuery();
			
			System.out.println("4. SQL문 전송 성공!!");
			int pID1 = 0;
			if (rs.next()) {
				pID1 = rs.getInt("pID");
				
			}
			dbcp.freeConnection(con, ps);
			return pID1;

		}
	
		//장바구니 값 변경
	
		public void cIDisPaid(paymentVO vo) throws Exception {
			
			con = dbcp.getConnection();

			String sql = "update cart set isPaid=1 where cID = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getcID());
			
		

			ps.executeUpdate();
			
			System.out.println("4. SQL문 전송 성공!!");
	
			dbcp.freeConnection(con, ps);
	

		}
		

}
