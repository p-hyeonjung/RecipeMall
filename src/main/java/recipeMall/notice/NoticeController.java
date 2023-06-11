package recipeMall.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/notice/*")
public class NoticeController extends HttpServlet {
	NoticeVO noticeVO;
	NoticeDAO dao;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		noticeVO=new NoticeVO();
		dao=new NoticeDAO();
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
		
		if(action==null || action.equals("/noticeList.do")) {
			List<NoticeVO> noticeList=dao.selectNoticeList();
			request.setAttribute("noticeList", noticeList);
			nextPage="/mypage/mypage_main_6_3.jsp";
			
		} else if(action.equals("/noticeView.do")) {
			int noticeNo=Integer.parseInt(request.getParameter("noticeNo"));
			noticeVO=dao.selectNoticeView(noticeNo);
			request.setAttribute("notice", noticeVO);
			nextPage="/mypage/noticeView.jsp";
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}

}
