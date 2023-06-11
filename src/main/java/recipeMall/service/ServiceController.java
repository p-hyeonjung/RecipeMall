package recipeMall.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mypage/service/*")
public class ServiceController extends HttpServlet {
	FaqVO faqVO;
	InqueryVO inqVO;
	ServiceDAO dao;
	HttpSession session;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		faqVO=new FaqVO();
		inqVO=new InqueryVO();
		dao=new ServiceDAO();
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

		if(action == null || action.equals("/main.do")) {
			String id=request.getParameter("id");
			nextPage="/mypage/mypage.jsp";
		} else if(action.equals("/faq.do")) {
			List<FaqVO> faqList=dao.selectFaqList();
			request.setAttribute("faqList", faqList);
			nextPage="/mypage/mypage_main_6_1.jsp";
			
		} else if(action.equals("/inqList.do")) {
			String id=request.getParameter("id");
			System.out.println("user id : "+id);
			List<InqueryVO> inqueryList=dao.userInqueryList(id);
			request.setAttribute("inqueryList", inqueryList);
			nextPage="/mypage/mypage_main_6_2.jsp";
			
		} else if(action.equals("/inqForm.do")) {
			nextPage="/mypage/mypage_main_6_2_form.jsp";
			
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
			dao.addInquery(inqVO);
			nextPage="/mypage/service/inqList.do";
		} else if(action.equals("/inqView.do")) {
			String id=request.getParameter("id");
			int inqNo=Integer.parseInt(request.getParameter("inqNo"));
			inqVO=dao.inqView(id,inqNo);
			request.setAttribute("inqVO",inqVO);
			nextPage="/mypage/mypage_main_6_2_view.jsp";
		}
			
		RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
		
	}
}
