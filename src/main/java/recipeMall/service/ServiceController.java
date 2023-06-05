package recipeMall.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/service/*")
public class ServiceController extends HttpServlet {
	FaqVO faqVO;
	InqueryVO inqVO;
	ServiceDAO dao;
	
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
		
		try {
			if(action == null || action.equals("/faq.do")) {
				List<FaqVO> faqList=dao.selectFaqList();
				request.setAttribute("faqList", faqList);
				nextPage="/mypage/mypage_main_6_1.jsp";
			}
		} catch (Exception e) {
			System.out.println("자주하는 질문 목록 조회 요청 처리 중 오류 발생");
			e.printStackTrace();
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}
