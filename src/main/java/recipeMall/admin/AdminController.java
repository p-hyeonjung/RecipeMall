package recipeMall.admin;

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

import recipeMall.user.UserDAO;
import recipeMall.user.UserVO;

@WebServlet("/admin/*")
public class AdminController extends HttpServlet {
	AdminVO adminVO;
	AdminDAO adminDAO;
	HttpSession session;
	
	/*
	 * @Override public void init(ServletConfig config) throws ServletException {
	 * adminVO=new AdminVO(); adminDAO=new AdminDAO(); }
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		if(action.equals("/") || action.equals("/admLoginForm.do")) {
			nextPage="/views/admin/adminLogin.jsp";
		} else if(action.equals("/login.do")) {
			String id=request.getParameter("adminId");
			String pw=request.getParameter("adminPw");
			
			boolean result=adminDAO.loginCheck(id, pw);
			if(result) {
				session=request.getSession();
				session.setAttribute("isLogon", result);
				session.setAttribute("log_adminId", id);
				nextPage="/views/admin/main.jsp";
			} else {
				response.sendRedirect("/admLoginForm.do");
			}
		} else if(action.equals("/logout.do")) {
			session.removeAttribute("isLogon");
			session.removeAttribute("log_adminId");
			nextPage="/admin/admLoginForm.do";
		}
		
		
		if(action.equals("/userList.do")) {
			UserDAO userDAO=new UserDAO();
			List<UserVO> userList=userDAO.selectAllUsers();
			request.setAttribute("userList", userList);
			nextPage="/views/admin/user.jsp";
		}
		 
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}

}
