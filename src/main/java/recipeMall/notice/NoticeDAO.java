package recipeMall.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoticeDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public NoticeDAO() {
		try {
			Context ctx=new InitialContext();
			Context envContext=(Context)ctx.lookup("java:/comp/env");
			dataFactory=(DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB연결 오류");
		}
	}
	
	public List<NoticeVO> selectNoticeList() {
		List<NoticeVO> noticeList=new ArrayList<>();
		try {
			conn=dataFactory.getConnection();
			String query="select * from noticetbl order by noticeDate desc";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				NoticeVO noticeVO=new NoticeVO();
				noticeVO.setNoticeNo(rs.getInt("noticeNo"));
				noticeVO.setAdminId(rs.getString("adminId"));
				noticeVO.setNoticeTitle(rs.getString("noticeTitle"));
				noticeVO.setNoticeContent(rs.getString("noticeContent"));
				noticeVO.setNoticeDate(rs.getDate("noticeDate"));
				
				noticeList.add(noticeVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("공지사항 목록 조회 중 오류 발생");
			e.printStackTrace();
		}
		return noticeList;
	}
	
	public NoticeVO selectNoticeView(int noticeNo) {
		NoticeVO noticeVO=new NoticeVO();
		try {
			conn=dataFactory.getConnection();
			String query="select * from noticetbl where noticeNo=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			
			noticeVO.setNoticeNo(rs.getInt("noticeNo"));
			noticeVO.setNoticeTitle(rs.getString("noticeTitle"));
			noticeVO.setNoticeContent(rs.getString("noticeContent"));
			noticeVO.setNoticeDate(rs.getDate("noticeDate"));
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("공지사항 상세 조회 중 오류 발생");
			e.printStackTrace();
		}
		return noticeVO;
	}
}
