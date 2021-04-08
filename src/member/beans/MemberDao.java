package member.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDao {

	// DB 연결시 관한 변수

	private static final String dbDriver = "oracle.jdbc.driver.OracleDriver";
	private static final String dbUrl = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private static final String dbUser = "SCOTT";
	private static final String dbPass = "TIGER";

	private static MemberDao memberDao;

	public static MemberDao getInstance() throws MemberException {
		if (memberDao == null) {
			memberDao = new MemberDao();
		}
		return memberDao;
	}

	private MemberDao() throws MemberException {

		try {

			/********************************************
			 * 1. 드라이버를 로딩
			 * 
			 */
			Class.forName(dbDriver);
//			Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
			
		} catch (Exception ex) {
			throw new MemberException("DB 연결시 오류  : " + ex.toString());
		}
	}

	/*******************************************
	 * * 회원관리테이블 MEMBERTEST 에 회원정보를 입력하는 함수
	 * 
	 * @param rec
	 * @throws MemberException
	 */
	public void insertMember(Member rec) throws MemberException {
		try {
			// 0. 연결 객체 얻어오기
			MemberDao dao = getInstance();
			// 1. sql 문장 만들기 ( insert문 )
			String sql = "INSERT INTO memberTest(id, password, name, tel, addr) VALUES(?, ?, ?, ?, ?)";
			// 2. sql 전송 객체 만들기
			Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rec.getId());
			pstmt.setString(2, rec.getPassword());
			pstmt.setString(3, rec.getName());
			pstmt.setString(4, rec.getTel());
			pstmt.setString(5, rec.getAddr());
			// 3. sql 전송
			pstmt.executeUpdate();
			// 4. 객체 닫기
			pstmt.close();
			con.close();

		} catch (Exception ex) {
			throw new MemberException("멤버 입력시 오류  : " + ex.toString());
		}
	}

	/**********************************************************
	 * * 회원관리테이블 MEMBERTEST에서 기존의 id값과 중복되는지 확인하는 함수
	 */
	public boolean isDuplicatedId(String id) throws MemberException {
		boolean flag = false;

		try {
			// 0. 연결 객체 얻어오기
			MemberDao dao = getInstance();
			// 1. sql 문장 만들기 ( insert문 )
			String sql = "SELECT * FROM memberTest WHERE id = ?";
			// 2. sql 전송 객체 만들기
			Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 3. sql 전송
			ResultSet rs = pstmt.executeQuery();
			// 4. rs 값 확인
			// 해당 쿼리로 조회되는 값이 없으면 true
			if(!rs.next()) flag = true;
			// 5. 객체 닫기
			pstmt.close();
			con.close();
		} catch (Exception ex) {
			throw new MemberException("중복아이디 검사시 오류  : " + ex.toString());
		}

		return flag;
	}
}
