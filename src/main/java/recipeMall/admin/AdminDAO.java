package recipeMall.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public AdminDAO() {
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
			String query="select decode(count(*), 1, 'true','false') as result from admintbl where adminId=? and adminPw=?";
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
			System.out.println("관리자 로그인 아이디/비밀번호 확인 중 오류");
			e.printStackTrace();
		}
		return result;
	}
}
