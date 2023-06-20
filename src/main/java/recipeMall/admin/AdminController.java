package recipeMall.admin;

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

import oracle.net.aso.ad;
import oracle.net.aso.n;
import recipeMall.notice.NoticeService;
import recipeMall.notice.NoticeVO;
import recipeMall.service.CenterService;
import recipeMall.service.InqueryVO;
import recipeMall.user.UserDAO;
import recipeMall.user.UserVO;

@WebServlet("/admin/*")
public class AdminController extends HttpServlet {
	NoticeVO noticeVO;
	InqueryVO inqVO;
	AdminVO adminVO;
	AdminDAO adminDAO;
	NoticeService noticeService;
	CenterService csService;
	AdminService adminService;
	HttpSession session;

	 @Override
	 public void init() throws ServletException {
		 noticeService=new NoticeService();
		 noticeVO=new NoticeVO();
		 csService=new CenterService();
		 adminService=new AdminService();
	 }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		ServletContext context=getServletContext();
		String contextPath=context.getContextPath();
		String action=request.getPathInfo();
		String nextPage="";
		
		adminVO=new AdminVO();
		adminDAO=new AdminDAO();
		
		if(action.equals("/") || action.equals("/admLoginForm.do")) {	// 로그인
			nextPage="/views/admin/adminLogin.jsp";
		} else if(action.equals("/login.do")) {
			String id=request.getParameter("adminId");
			String pw=request.getParameter("adminPw");
			
			boolean result=adminDAO.loginCheck(id, pw);
			if(result) {
				session=request.getSession();
				session.setAttribute("isAdmLogon", result);
				session.setAttribute("log_adminId", id);
				nextPage="/admin/main.do";
			} else {
				response.sendRedirect("/admLoginForm.do");
			}
		} else if(action.equals("/logout.do")) {	// 로그아웃
			session.removeAttribute("isAdmLogon");
			session.removeAttribute("log_adminId");
			session.invalidate();
			nextPage="/admin/admLoginForm.do";
		} else if(action.equals("/main.do")) {
			Map<String, Object> indexMap=new HashMap<>();
			indexMap=adminService.mainList();
			
			request.setAttribute("indexMap", indexMap);
			nextPage="/views/admin/main.jsp";
		} else if(action.equals("/userList.do")) {		// 회원목록
			UserDAO userDAO=new UserDAO();
			List<UserVO> userList=userDAO.selectAllUsers();
			request.setAttribute("userList", userList);
			nextPage="/views/admin/user.jsp";
		} else if(action.equals("/noticeList.do")) {	// 공지사항 목록
			// 페이지, 섹션 최초 요청시 null값
			String _section=request.getParameter("section");
			System.out.println("section: "+_section);
			String _pageNum=request.getParameter("pageNum");
			System.out.println("pageNum: "+_pageNum);
			// _section=null일 경우 1반환_초기값 1 세팅. 10->11로 페이지 넘어가면 2를 받음
			int section=Integer.parseInt((_section == null)?"1":_section);
			// _pageNum=null일 경우 1반환_초기값 1 세팅. 2페이지 누르면 2를 받음
			int pageNum=Integer.parseInt((_pageNum == null)?"1":_pageNum);
			
			Map<String, Integer> pagingMap=new HashMap<String, Integer>();
			// page set
			pagingMap.put("section", section);	// 1
			pagingMap.put("pageNum", pageNum);	// 1
			// articlesList, totArticles 받음
			Map noticeMap=noticeService.listNotices(pagingMap);
			
			noticeMap.put("section", section);
			noticeMap.put("pageNum", pageNum);
			
			request.setAttribute("noticeMap", noticeMap);
			nextPage="/views/admin/notice.jsp";
		} else if(action.equals("/noticeForm.do")) {	// 공지사항 등록 페이지
			nextPage="/views/admin/noticeForm.jsp";
		} else if(action.equals("/addNotice.do")) {		// 입력한 공지사항 db insert
			String adminId=request.getParameter("adminId");
			String noticeTitle=request.getParameter("noticeTitle");
			String noticeContent=request.getParameter("noticeContent");
			
			NoticeVO noticeVO=new NoticeVO(adminId, noticeTitle, noticeContent);
			noticeService.addNotice(noticeVO);
			nextPage="/admin/noticeList.do";
		} else if(action.equals("/noticeView.do")) {	// 공지사항 상세보기
			int noticeNo=Integer.parseInt(request.getParameter("noticeNo"));
			noticeVO=noticeService.selectNoticeView(noticeNo);
			request.setAttribute("notice", noticeVO);
			nextPage="/views/admin/noticeView.jsp";
		} else if(action.equals("/modNotice.do")) {		// 공지사항 수정 페이지
			int noticeNo=Integer.parseInt(request.getParameter("noticeNo"));
			noticeVO=noticeService.selectNoticeView(noticeNo);
			request.setAttribute("notice", noticeVO);
			nextPage="/views/admin/modNoticeForm.jsp";
		} else if(action.equals("/updateNotice.do")) {		// 공지사항 수정한 데이터 db에 업데이트
			int noticeNo=Integer.parseInt(request.getParameter("noticeNo"));
			String adminId=request.getParameter("adminId");
			String noticeTitle=request.getParameter("noticeTitle");
			String noticeContent=request.getParameter("noticeContent");
			
			noticeVO.setNoticeNo(noticeNo);
			noticeVO.setAdminId(adminId);
			noticeVO.setNoticeTitle(noticeTitle);
			noticeVO.setNoticeContent(noticeContent);
			noticeService.updateNotice(noticeVO);
			nextPage="/admin/noticeView.do?noticeNo="+noticeNo;
			
		} else if(action.equals("/delNotice.do")) {		// 공지사항 삭제
			int noticeNo=Integer.parseInt(request.getParameter("noticeNo"));
			noticeService.deleteNotice(noticeNo);
			nextPage="/admin/noticeList.do";
		} else if(action.equals("/userInqList.do")) {	// 유저 문의 목록
			System.out.println("요청 매핑: "+action);
			// 페이지, 섹션 최초 요청시 null값
			String _section=request.getParameter("section");
			System.out.println("section: "+_section);
			String _pageNum=request.getParameter("pageNum");
			System.out.println("pageNum: "+_pageNum);
			// _section=null일 경우 1반환_초기값 1 세팅. 10->11로 페이지 넘어가면 2를 받음
			int section=Integer.parseInt((_section == null)?"1":_section);
			System.out.println("section: "+section);
			// _pageNum=null일 경우 1반환_초기값 1 세팅. 2페이지 누르면 2를 받음
			int pageNum=Integer.parseInt((_pageNum == null)?"1":_pageNum);
			System.out.println("pageNum: "+pageNum);
			
			Map<String, Integer> pagingMap=new HashMap<String, Integer>();
			// page set
			pagingMap.put("section", section);	// 1
			pagingMap.put("pageNum", pageNum);	// 1
			// articlesList, totArticles 받음
			Map inqueryMap=csService.inqAllList(pagingMap);
			
			inqueryMap.put("section", section);
			inqueryMap.put("pageNum", pageNum);
			
			request.setAttribute("inqueryMap", inqueryMap);
			nextPage="/views/admin/userInquery.jsp";
		} else if(action.equals("/userInqAnswer.do")) {		// 유저 문의 답변
			int inqNo=Integer.parseInt(request.getParameter("inqNo"));
			inqVO=csService.selectInquery(inqNo);
			request.setAttribute("inquery", inqVO);
			nextPage="/views/admin/inqueryView.jsp";
			
		} else if(action.equals("/inUserInqReply.do")) {	// 답변 등록
			int inqNo=Integer.parseInt(request.getParameter("inqNo"));
			String adminId=request.getParameter("adminId");
			String inqReply=request.getParameter("inq_reply");
			csService.inqReply(inqNo, adminId, inqReply);
			nextPage="/admin/userInqAnswer.do?inqNo="+request.getParameter("inqNo");
		}
		 
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}

}
