package payment;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;

import dbconnect.DBConnectionMgr;

public class mypayDAO {
	Connection con; // 전역변수
	DBConnectionMgr dbcp;

	public mypayDAO() throws Exception {
		dbcp = DBConnectionMgr.getInstance();
		System.out.println("2. DB연결 성공");
	}

	
	// user 한글 이름 불러오기
	
		public String nameKor(String uID) throws Exception {
			System.out.println(uID);
			con = dbcp.getConnection();
			// 3. sql문을 만든다(create)
			String sql = "select nameKor from user where uID = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, uID);
	
			ResultSet rs = ps.executeQuery();
			System.out.println("4. SQL문 전송 성공!!");
			
			String nameKor = null; 
			if (rs.next()) {
			
			nameKor = rs.getString("nameKor");
			
			}
			dbcp.freeConnection(con, ps);
			return nameKor;
		}

			
		//결제내역불러오기
			public ArrayList<mypayVO> payment(String uID) throws Exception {
				
				ArrayList<mypayVO> list = new ArrayList();
				con = dbcp.getConnection();
				System.out.println("2. db연결 성공.!!");

				String sql = "select pID, cardNum, payPlan, payTime from payment where uID = ?";

				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, uID);

				
				System.out.println("4. SQL문 전송 성공.!!");
				

				
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					mypayVO vo = new mypayVO();
					int pID = rs.getInt("pID");
					String cardNum = rs.getString("cardNum");
					String payPlan = rs.getString("payPlan");
					Date payDay = rs.getDate("payTime");
					Time payTime = rs.getTime("payTime");
					
					vo.setpID(pID);
					vo.setCardNum(cardNum);
					vo.setPayPlan(payPlan);
					vo.setPayDay(payDay);
					vo.setPayTime(payTime);
					
					list.add(vo);
				}
				
				return list;

			}
		
		//각 결제 건 스케줄
			public ArrayList<mypayVO> bookingsID(int pID) throws Exception {
				
				ArrayList<mypayVO> list = new ArrayList();
				con = dbcp.getConnection();
				System.out.println("2. db연결 성공.!!");

				String sql = "select departTime, arriveTime, departCtID, arriveCtID from schedule where sID in (select sID from booking where pID = ?)";

				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, pID);

				
				System.out.println("4. SQL문 전송 성공.!!");
				

				
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					mypayVO vo = new mypayVO();
					Date departDATE = rs.getDate("departTime");
					Time departTIME = rs.getTime("departTime");
					Date arriveDATE = rs.getDate("arriveTime");
					Time arriveTIME = rs.getTime("arriveTime");
					int departCtID = rs.getInt("departCtID");
					int arriveCtID = rs.getInt("arriveCtID");
					
					vo.setDepartDATE(departDATE);
					vo.setDepartTIME(departTIME);
					vo.setArriveDATE(arriveDATE);
					vo.setArriveTIME(arriveTIME);
					vo.setDepartCtID(departCtID);
					vo.setArriveCtID(arriveCtID);
					
					
					list.add(vo);
				}
				
				return list;

			}
		
			
			
			
			
		}
	

	
		


