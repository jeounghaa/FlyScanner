package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbconnect.DBConnectionMgr;

public class UserDAO {
	Connection con;
	   DBConnectionMgr dbcp;

	   public UserDAO() throws Exception {
		   dbcp =  DBConnectionMgr.getInstance();
	      System.out.println("DB연결 성공!");
	   }

	// 로그인 처리
	public boolean read(String uID, String pw) throws Exception {
		con = dbcp.getConnection();
		String sql = "select * from user where uID = ? and pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, uID);
		ps.setString(2, pw);

		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		boolean result = false;
		if (rs.next() == true) {
			System.out.println("로그인 ok.");
			result = true;
		} else {
			System.out.println("로그인 not.");
		}
		
		dbcp.freeConnection(con, ps, rs);
		return result;
	}

	// 회원가압
	public boolean create(UserVO vo) throws Exception {
		con = dbcp.getConnection();
		String sql = "insert into user values (?,?,?,?,?,?,?,?,now(),?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, vo.getUid());
		ps.setString(2, vo.getPw());
		ps.setString(3, vo.getNamekor());
		ps.setString(4, vo.getNameEng());
		ps.setString(5, vo.getGender());
		ps.setString(6, vo.getBirth());
		ps.setString(7, vo.getPhone());
		ps.setString(8, vo.getPassport());
		ps.setString(9, vo.getCtID());

		System.out.println("3. SQL생성 성공.!!");

		int row = ps.executeUpdate();
		System.out.println("4. SQL문 전송 성공.!!");
		boolean result = false;
		if (row == 1) {
			result = true;
		}
		dbcp.freeConnection(con, ps);
		return result;
	}

	// 중복확인
	public int read(String uID) throws Exception {
		// 3. sql문을 만든다.(create)
		con = dbcp.getConnection();
		String sql = "select * from user where uID = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, uID);

		// 4. sql문은 전송
		// select의 결과는 검색결과가 담긴 테이블(항목+내용)
		// 내용에는 없을 수도 있고, 많은 수도 있음.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		int result = 0;// 없음.
		if (rs.next() == true) { // 결과가 있는지 없는지 체크해주는 메서드
			// if(rs.next())와 동일함.
			// if문은 rs.next()가 true때만 실행되므로!
			System.out.println("검색결과가 있어요.");
			result = 1; // 있음.
//			rs.getInt("no");//정수 가지고 올때
//			rs.getDouble("num");//실수 가지고 올때

		} else {
			System.out.println("검색결과가 없어요.");
		}

		dbcp.freeConnection(con, ps, rs);
		return result;
		// 0이 넘어가면, 검색결과 없음.
		// 1이 넘어가면, 검색결과 있음.
	}
	//phone 잇나확인
	public int read2(String phone) throws Exception {
		con = dbcp.getConnection();
		// 3. sql문을 만든다.(create)
		String sql = "select * from user where phone = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, phone);

		// 4. sql문은 전송
		// select의 결과는 검색결과가 담긴 테이블(항목+내용)
		// 내용에는 없을 수도 있고, 많은 수도 있음.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		int result = 0;// 없음.
		if (rs.next() == true) { // 결과가 있는지 없는지 체크해주는 메서드
			// if(rs.next())와 동일함.
			// if문은 rs.next()가 true때만 실행되므로!
			System.out.println("검색결과가 있어요.");
			result = 1; // 있음.
//			rs.getInt("no");//정수 가지고 올때
//			rs.getDouble("num");//실수 가지고 올때

		} else {
			System.out.println("검색결과가 없어요.");
		}

		dbcp.freeConnection(con, ps, rs);
		return result;
		// 0이 넘어가면, 검색결과 없음.
		// 1이 넘어가면, 검색결과 있음.
	}
     //id찾기
	public int read3(String passport, String namekor) throws Exception {
		con = dbcp.getConnection();
		// 3. sql문을 만든다.(create)
		String sql = "select * from user where passport ='"+passport.trim()+"' and namekor = '"+namekor.trim()+"'";
		PreparedStatement ps = con.prepareStatement(sql);
		

		// 4. sql문은 전송
		// select의 결과는 검색결과가 담긴 테이블(항목+내용)
		// 내용에는 없을 수도 있고, 많은 수도 있음.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		int result = 0;// 없음.
		if (rs.next() == true) { // 결과가 있는지 없는지 체크해주는 메서드
			// if(rs.next())와 동일함.
			// if문은 rs.next()가 true때만 실행되므로!
			System.out.println("검색결과가 있어요.");
			result = 1; // 있음.
//			rs.getInt("no");//정수 가지고 올때
//			rs.getDouble("num");//실수 가지고 올때

		} else {
			System.out.println("검색결과가 없어요.");
		}

		dbcp.freeConnection(con, ps, rs);
		return result;
		// 0이 넘어가면, 검색결과 없음.
		// 1이 넘어가면, 검색결과 있음.
	}
	//로그인 아이디잇는지확인
	public int read4(String Uid,String pw) throws Exception {
		System.out.println("나아이디" + Uid);
		System.out.println("나pw" + pw);
		con = dbcp.getConnection();
		// 3. sql문을 만든다.(create)
		String sql = "select * from user where pw = '"+pw.trim()+"' and uID = '"+Uid.trim()+"'";
		PreparedStatement ps = con.prepareStatement(sql);
		// 4. sql문은 전송
		// select의 결과는 검색결과가 담긴 테이블(항목+내용)
		// 내용에는 없을 수도 있고, 많은 수도 있음.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		int result = 0;// 없음.
		if (rs.next() == true) { // 결과가 있는지 없는지 체크해주는 메서드
			// if(rs.next())와 동일함.
			// if문은 rs.next()가 true때만 실행되므로!
			System.out.println("검색결과가 있어요.");
			result = 1; // 있음.
//			rs.getInt("no");//정수 가지고 올때
//			rs.getDouble("num");//실수 가지고 올때

		} else {
			System.out.println("검색결과가 없어요.");
		}

		dbcp.freeConnection(con, ps, rs);
		return result;
		// 0이 넘어가면, 검색결과 없음.
		// 1이 넘어가면, 검색결과 있음.
	}
	
	//회원수정 비밀번호입력
		public int read6(String pw) throws Exception {
			
			System.out.println("나pw" + pw);
			con = dbcp.getConnection();
			// 3. sql문을 만든다.(create)
			String sql = "select * from user where pw = '"+pw.trim()+"'";
			PreparedStatement ps = con.prepareStatement(sql);
			// 4. sql문은 전송
			// select의 결과는 검색결과가 담긴 테이블(항목+내용)
			// 내용에는 없을 수도 있고, 많은 수도 있음.
			ResultSet rs = ps.executeQuery();
			System.out.println("4. SQL문 전송 성공.!!");
			int result = 0;// 없음.
			if (rs.next() == true) { // 결과가 있는지 없는지 체크해주는 메서드
				// if(rs.next())와 동일함.
				// if문은 rs.next()가 true때만 실행되므로!
				System.out.println("검색결과가 있어요.");
				result = 1; // 있음.
//				rs.getInt("no");//정수 가지고 올때
//				rs.getDouble("num");//실수 가지고 올때

			} else {
				System.out.println("검색결과가 없어요.");
			}

			dbcp.freeConnection(con, ps, rs);
			return result;
			// 0이 넘어가면, 검색결과 없음.
			// 1이 넘어가면, 검색결과 있음.
		}
		// pw찾기 회원잇는지확인
	// pw찾기 회원잇는지확인
	public int read5(String Uid , String phone) throws Exception {
		System.out.println("dao    "+Uid);
		con = dbcp.getConnection();
		// 3. sql문을 만든다.(create)
		String sql = "select * from user where  Uid = '"+Uid.trim()+"'and phone = '"+phone.trim()+"'";
		PreparedStatement ps = con.prepareStatement(sql);
		
		// 4. sql문은 전송
		// select의 결과는 검색결과가 담긴 테이블(항목+내용)
		// 내용에는 없을 수도 있고, 많은 수도 있음.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		int result = 0;// 없음.
		if (rs.next() == true) { // 결과가 있는지 없는지 체크해주는 메서드
			// if(rs.next())와 동일함.
			// if문은 rs.next()가 true때만 실행되므로!
			System.out.println("검색결과가 있어요.");
			result = 1; // 있음.
//			rs.getInt("no");//정수 가지고 올때
//			rs.getDouble("num");//실수 가지고 올때

		} else {
			System.out.println("검색결과가 없어요.");
		}

		dbcp.freeConnection(con, ps, rs);
		return result;
		// 0이 넘어가면, 검색결과 없음.
		// 1이 넘어가면, 검색결과 있음.
	}



	// 아이디 찾기
	public UserVO one(String namekor, String passport) throws Exception {
		con = dbcp.getConnection();
		System.out.println("나 시작");
		// 3. sql문을 만든다.(create)
		String sql = "select * from user where namekor =? and  passport = ?";
		PreparedStatement ps = con.prepareStatement(sql);

		// 4. sql문은 전송
		// select의 결과는 검색결과가 담긴 테이블(항목+내용)
		// 내용에는 없을 수도 있고, 많은 수도 있음.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		UserVO bag = new UserVO();// 가방만들어서,
		if (rs.next() == true) { // 결과가 있는지 없는지 체크해주는 메서드
			// if(rs.next())와 동일함.
			// if문은 rs.next()가 true때만 실행되므로!
			System.out.println("검색결과가 있어요.");

			String namekor1 = rs.getString("namekor");
			String passport1 = rs.getString("passport");
			String uid = rs.getString("uid");

			// 가방에 넣기
			bag.setNamekor(namekor1);
			bag.setPassport(passport1);
			bag.setUid(uid);
			System.out.println("검색결과 id: " + namekor1);
			System.out.println("검색결과 uid: " + uid);

		} else {
			System.out.println("검색결과가 없어요.");
		}

		dbcp.freeConnection(con, ps, rs);
		return bag;
		// bag은 참조형 변수, 주소를 전달!
	}
	
	// 아이디 찾기
	public UserVO one2(String passport) throws Exception {
		con = dbcp.getConnection();
		System.out.println("나 시작");
		// 3. sql문을 만든다.(create)
		String sql = "select * from user where passport ='" + passport.trim()+ "'";
		PreparedStatement ps = con.prepareStatement(sql);
		
		// 4. sql문은 전송
		// select의 결과는 검색결과가 담긴 테이블(항목+내용)
		// 내용에는 없을 수도 있고, 많은 수도 있음.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		UserVO bag = new UserVO();// 가방만들어서,
		if (rs.next() == true) { // 결과가 있는지 없는지 체크해주는 메서드
			// if(rs.next())와 동일함.
			// if문은 rs.next()가 true때만 실행되므로!
			System.out.println("검색결과가 있어요.");
			
			String namekor1 = rs.getString("namekor");
			String uid = rs.getString("uid");
			
			// 가방에 넣기
			bag.setNamekor(namekor1);
			bag.setUid(uid);
			System.out.println("검색결과 id: " + namekor1);
			System.out.println("검색결과 uid: " + uid);
			
		} else {
			System.out.println("검색결과가 없어요.");
		}
		
		dbcp.freeConnection(con, ps, rs);
		return bag;
		// bag은 참조형 변수, 주소를 전달!
	}
	
	//pw찾기
	public int one5(String Uid, String phone) throws Exception {
		// 3. sql문을 만든다.(create)
		con = dbcp.getConnection();
		String sql = "select * from user where Uid = ? and phone = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, Uid);
		ps.setString(2, phone);
		
		// 4. sql문은 전송
		// select의 결과는 검색결과가 담긴 테이블(항목+내용)
		// 내용에는 없을 수도 있고, 많은 수도 있음.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		int result = 0;// 없음.
		if (rs.next() == true) { // 결과가 있는지 없는지 체크해주는 메서드
			// if(rs.next())와 동일함.
			// if문은 rs.next()가 true때만 실행되므로!
			System.out.println("검색결과가 있어요.");
			result = 1; // 있음.
//			rs.getInt("no");//정수 가지고 올때
//			rs.getDouble("num");//실수 가지고 올때

		} else {
			System.out.println("검색결과가 없어요.");
		}

		dbcp.freeConnection(con, ps, rs);
		return result;
		// 0이 넘어가면, 검색결과 없음.
		// 1이 넘어가면, 검색결과 있음.
	}
	
	
//	회원수정 회원인지 찾기
	public UserVO one4(String pw) throws Exception {
		con = dbcp.getConnection();
		System.out.println("나 시작");
		// 3. sql문을 만든다.(create)
		String sql = "select * from user where pw = '" + pw.trim() + "' ";
		PreparedStatement ps = con.prepareStatement(sql);
		
		// 4. sql문은 전송
		// select의 결과는 검색결과가 담긴 테이블(항목+내용)
		// 내용에는 없을 수도 있고, 많은 수도 있음.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		UserVO bag = new UserVO();// 가방만들어서,
		if (rs.next() == true) { // 결과가 있는지 없는지 체크해주는 메서드
			// if(rs.next())와 동일함.
			// if문은 rs.next()가 true때만 실행되므로!
			System.out.println("검색결과가 있어요.");
			
			String namekor1 = rs.getString("namekor");
			String pw1 = rs.getString("pw");
			String birth = rs.getString("birth");
			String Uid = rs.getString("Uid");
			// 가방에 넣기
			bag.setNamekor(namekor1);
			bag.setPw(pw);
			bag.setBirth(birth);
			System.out.println("검색결과 id: " + namekor1);
			System.out.println("검색결과 uid: " + pw);
			System.out.println("검색결과 uid: " + birth);

		} else {
			System.out.println("검색결과가 없어요.");
		}
		
		dbcp.freeConnection(con, ps, rs);
		return bag;
		// bag은 참조형 변수, 주소를 전달!
	}
	//비밀번호수정
	public boolean update(String pw, String Uid) throws Exception {
		// 3. sql문을 만든다.(create)
		con = dbcp.getConnection();
		String sql = "update user set pw = ? where Uid = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, pw);
		ps.setString(2, Uid);
		
		System.out.println("3. SQL생성 성공.!!");

		// 4. sql문은 전송
		int row = ps.executeUpdate();
		System.out.println("4. SQL문 전송 성공.!!");
		dbcp.freeConnection(con, ps);
		boolean result = false;
		if (row == 1) {
			result = true;
		}
		return result;
	}
	//회원수정
	public boolean update(UserVO vo) throws Exception {
		System.out.println("jhhhhhhhh   "+vo.getUid());
		
		// 3. sql문을 만든다.(create)
		con = dbcp.getConnection();
		String sql = "update user set namekor = ?, pw = ?, nameEng = ?, gender= ?, birth=?, phone=?, passport=?, cDate=now() ,ctID=?  where uid = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, vo.getNamekor());
		ps.setString(2, vo.getPw());
		ps.setString(3, vo.getNameEng());
		ps.setString(4, vo.getGender());
		ps.setString(5, vo.getBirth());
		ps.setString(6, vo.getPhone());
		ps.setString(7, vo.getPassport());
		ps.setString(8, vo.getCtID());
		ps.setString(9, vo.getUid());
		
		System.out.println("3. SQL생성 성공.!!");
	
		// 4. sql문은 전송
		int row = ps.executeUpdate();
		System.out.println("4. SQL문 전송 성공.!!");
		dbcp.freeConnection(con, ps);
		boolean result = false;
		if (row == 1) {
			result = true;
		}
		return result;
	}

	public boolean delete(String id) throws Exception {
		// 3. sql문을 만든다.(create)
		con = dbcp.getConnection();
		String sql = "delete from member where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		System.out.println("3. SQL생성 성공.!!");

		// 4. sql문은 전송
		int row = ps.executeUpdate();
		System.out.println("4. SQL문 전송 성공.!!");
		dbcp.freeConnection(con, ps);
		boolean result = false;
		if (row == 1) {
			result = true;
		}
		return result;
	}

}
