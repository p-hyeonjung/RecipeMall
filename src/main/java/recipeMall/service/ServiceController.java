package recipeMall.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/service/*")
public class ServiceController extends HttpServlet {
	FaqVO faqVO;
	InqueryVO inqVO;
	HttpSession session;
	CenterService service;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		faqVO=new FaqVO();
		inqVO=new InqueryVO();
		service=new CenterService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action=request.getPathInfo();
		String nextPage="";

		try {
			if(action == null || action.equals("/main.do")) {
				String id=request.getParameter("id");
				nextPage="/views/mypage/mypage.jsp";
			} else if(action.equals("/faq.do")) {
				List<FaqVO> faqList=service.selectFaqList();
				request.setAttribute("faqList", faqList);
				nextPage="/views/mypage/mypage_main_6_1.jsp";
				
			} else if(action.equals("/inqList.do")) {
				String id=request.getParameter("id");
				// 페이지, 섹션 최초 요청시 null값
				String _section=request.getParameter("section");
				String _pageNum=request.getParameter("pageNum");
				// _section=null일 경우 1반환_초기값 1 세팅. 10->11로 페이지 넘어가면 2를 받음
				int section=Integer.parseInt((_section == null)?"1":_section);
				// _pageNum=null일 경우 1반환_초기값 1 세팅. 2페이지 누르면 2를 받음
				int pageNum=Integer.parseInt((_pageNum == null)?"1":_pageNum);
				
				Map<String, Integer> pagingMap=new HashMap<String, Integer>();
				// page set
				pagingMap.put("section", section);	// 1
				pagingMap.put("pageNum", pageNum);	// 1
				// articlesList, totArticles 받음
				Map inqueryMap=service.inqList(pagingMap, id);
				
				inqueryMap.put("section", section);
				inqueryMap.put("pageNum", pageNum);
				request.setAttribute("inqueryMap", inqueryMap);
				nextPage="/views/mypage/mypage_main_6_2.jsp";
				
			} else if(action.equals("/inqForm.do")) {
				nextPage="/views/mypage/mypage_main_6_2_form.jsp";
				
			} else if(action.equals("/addInq.do")) {
				String id=request.getParameter("id");
				String cate=request.getParameter("inqCate");
				System.out.println("문의 카테고리: "+cate);
				int inqCate=0;
				if(cate.equals("쇼핑")) {
					inqCate=1;
				} else if(cate.equals("커뮤니티")) {
					inqCate=2;
				}
				String inqTitle=request.getParameter("inq_title");
				String inqContent=request.getParameter("inq_content");
				
				inqVO.setId(id);
				inqVO.setInqCate(inqCate);
				inqVO.setInqTitle(inqTitle);
				inqVO.setInqContent(inqContent);
				service.addInquery(inqVO);
				nextPage="/views/mypage/service/inqList.do";
			} else if(action.equals("/inqView.do")) {
				String id=request.getParameter("id");
				int inqNo=Integer.parseInt(request.getParameter("inqNo"));
				inqVO=service.inqView(id,inqNo);
				request.setAttribute("inqVO",inqVO);
				nextPage="/views/mypage/mypage_main_6_2_view.jsp";
			}
			
		} catch (Exception e) {
			
		}
			
		RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
		
	}
}
