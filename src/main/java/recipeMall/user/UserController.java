package recipeMall.user;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/mypage/user")
public class UserController extends HttpServlet {
	UserVO userVO;
	UserDAO dao;
	HttpSession session;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		userVO=new UserVO();
		dao=new UserDAO();
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
			session=request.getSession(false);
			if(session == null) {
				
			} else if(session != null) {
				String id=(String) session.getAttribute("log_id");
				userVO=dao.userInfo(id);
				request.setAttribute("user", userVO);
				nextPage="/mypage/mypage_user_info.jsp";
			}
		} catch (Exception e) {
			System.out.println("mypage user 요청 처리 중 오류 발생");
			e.printStackTrace();
		}
	}

}
