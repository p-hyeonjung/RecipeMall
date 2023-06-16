package recipeMall.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ServiceDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public ServiceDAO() {
		try {
			Context ctx=new InitialContext();
			Context envContext=(Context)ctx.lookup("java:/comp/env");
			dataFactory=(DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB연결 오류");
		}
	}
	
	public List<FaqVO> selectFaqList() {
		List<FaqVO> faqList=new ArrayList<FaqVO>();
		try {
			conn=dataFactory.getConnection();
			String query="select faqTitle,faqContent from faqtbl order by faqDate Desc";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				String title=rs.getString("faqTitle");
				String content=rs.getString("faqContent");
				
				FaqVO faqVO=new FaqVO();
				faqVO.setFaqTitle(title);
				faqVO.setFaqContent(content);
				
				faqList.add(faqVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("자주하는 질문 목록 조회 중 오류 발생");
			e.printStackTrace();
		}
		return faqList;
	}
	
	// 유저 일대일 문의 전체 개수
	public int selectToInqueries(String id) {
		int totCount=0;
		try {
			conn=dataFactory.getConnection();
			String query="select count(*) from inquerytbl where id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {	// 자료가 있을 경우
				totCount=rs.getInt(1);	// 첫 번째 컬럼 값				
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("유저의 일대일 문의 전체 개수 조회 중 오류 발생");
			e.printStackTrace();
		}
		return totCount;
	}
	
	public List<InqueryVO> seleteAllUserInquery(Map<String, Integer> pagingMap, String id) {
		List<InqueryVO> inqueryList=new ArrayList<InqueryVO>();
		int section=pagingMap.get("section");	// 1
		int pageNum=pagingMap.get("pageNum");	// 1
		try {
			conn=dataFactory.getConnection();
			String query="SELECT * FROM (select ROWNUM AS recNum,inqNo,id,inqTitle,hasRe,inqCate,inqDate from inquerytbl where id=? order by inqDate Desc) "+
						 "WHERE recNum BETWEEN (?-1)*100+(?-1)*10+1 AND (?-1)*100+?*10";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setInt(2, section);
			pstmt.setInt(3, pageNum);
			pstmt.setInt(4, section);
			pstmt.setInt(5, pageNum);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int inqNo=rs.getInt("inqNo");
				String inqTitle=rs.getString("inqTitle");
				int hasRe=rs.getInt("hasRe");
				int inqCate=rs.getInt("inqCate");
				Date inqDate=rs.getDate("inqDate");
				
				InqueryVO inqueryVO=new InqueryVO();
				inqueryVO.setInqNo(inqNo);
				inqueryVO.setId(id);
				inqueryVO.setInqTitle(inqTitle);
				inqueryVO.setHasRe(hasRe);
				inqueryVO.setInqCate(inqCate);
				inqueryVO.setInqDate(inqDate);
				
				inqueryList.add(inqueryVO);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("유저 일대일 문의 목록 + 페이징 조회 중 오류 발생");
			e.printStackTrace();
		}
		return inqueryList;
	}
	
	public void addInquery(InqueryVO inqVO) {
		try {
			conn=dataFactory.getConnection();
			String query="insert into inquerytbl(inqNo,id,inqTitle,inqContent,inqCate) values(inqNo_seq.nextval,?,?,?,?)";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, inqVO.getId());
			pstmt.setString(2, inqVO.getInqTitle());
			pstmt.setString(3, inqVO.getInqContent());
			pstmt.setInt(4, inqVO.getInqCate());
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("유저 일대일 문의 등록 중 오류 발생");
			e.printStackTrace();
		}
	}
	
	public InqueryVO inqView(String id, int inqNo) {
		InqueryVO inqVO=new InqueryVO();
		try {
			conn=dataFactory.getConnection();
			String query="select * from inquerytbl where id=? and inqNo=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setInt(2, inqNo);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			
			String inqTitle=rs.getString("inqTitle");
			String inqContent=rs.getString("inqContent");
			int hasRe=rs.getInt("hasRe");
			int inqCate=rs.getInt("inqCate");
			Date inqDate=rs.getDate("inqDate");
			
			inqVO.setInqTitle(inqTitle);
			inqVO.setInqContent(inqContent);
			inqVO.setHasRe(hasRe);
			inqVO.setInqCate(inqCate);
			inqVO.setInqDate(inqDate);
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("유저 일대일 문의 상세보기 조회 중 오류 발생");
			e.printStackTrace();
		}
		return inqVO;
	}
}
