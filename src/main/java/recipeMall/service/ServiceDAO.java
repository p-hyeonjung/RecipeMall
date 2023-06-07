package recipeMall.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
}
