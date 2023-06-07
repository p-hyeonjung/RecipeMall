package recipeMall.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public UserDAO() {
		try {
			Context ctx=new InitialContext();
			Context envContext=(Context)ctx.lookup("java:/comp/env");
			dataFactory=(DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB연결 오류");
		}
	}
	
	// 로그인 시 아이디,비밀번호 일치 확인
	public boolean loginCheck(String id, String pw) {
		boolean result=false;
		try {
			conn=dataFactory.getConnection();
			// 받은 id,pw가 데이터와 일치할 경우 true, 불일치할 경우 false를 result 이름으로 반환
			String query="select decode(count(*), 1, 'true','false') as result from usertbl where id=? and pw=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			result=Boolean.parseBoolean(rs.getString("result"));
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("로그인 아이디/비밀번호 확인 중 오류");
			e.printStackTrace();
		}
		return result;
	}
	
	// 회원 정보 조회
	public UserVO userInfo(String id) {
		UserVO userVO=new UserVO();
		try {
			conn=dataFactory.getConnection();
			String query="select * from usertbl where id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			userVO.setId(id);
		} catch (Exception e) {
			System.out.println("회원 정보 조회 중 오류 발생");
			e.printStackTrace();
		}
		return userVO;
	}

}
