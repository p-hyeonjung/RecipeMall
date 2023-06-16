package recipeMall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import recipeMall.notice.NoticeVO;

public class CenterService {
	ServiceDAO serviceDAO;
	
	public CenterService() {
		serviceDAO=new ServiceDAO();
	}
	
	public Map inqList(Map<String, Integer> pagingMap, String id) {
		Map inqueryMap=new HashMap();
		// 1페이지 개수인 10개만 목록 가져옴
		List<InqueryVO> inqueryList=serviceDAO.seleteAllUserInquery(pagingMap, id);
		// 전체 글 개수 가져와서 페에지 개수 만듬
		int totArticles=serviceDAO.selectToInqueries(id);
		inqueryMap.put("inqueryList", inqueryList);
		inqueryMap.put("totArticles", totArticles);
		
		return inqueryMap;
	}
	
	public List<FaqVO> selectFaqList() {
		List<FaqVO> faqList=serviceDAO.selectFaqList();
		return faqList;
	}
	
	public void addInquery(InqueryVO inqVO) {
		serviceDAO.addInquery(inqVO);
	}
	
	public InqueryVO inqView(String id, int inqNo) {
		InqueryVO inqueryVO=serviceDAO.inqView(id, inqNo);
		return inqueryVO;
	}
}
