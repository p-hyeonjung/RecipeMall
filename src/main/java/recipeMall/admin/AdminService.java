package recipeMall.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import recipeMall.service.InqueryVO;
import recipeMall.service.ServiceDAO;

public class AdminService {
	ServiceDAO serviceDAO;
	
	public AdminService() {
		serviceDAO=new ServiceDAO();
	}
	
	public Map mainList() {
		Map indexMap=new HashMap<>();
		// 리뷰 리스트
		
		// 게시판 리스트
					
		// 문의 리스트
		List<InqueryVO> inqList=serviceDAO.recentInqList();
		indexMap.put("inqList", inqList);
		return indexMap;
	}
}
