package recipeMall.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recipeMall.user.UserDAO;
import recipeMall.user.UserVO;


@WebServlet("/loginProc/*")
public class LoginController extends HttpServlet {
	UserVO userVO;
	UserDAO dao;
	HttpSession session;
	
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
		String ContextPath=context.getContextPath();
		String action=request.getPathInfo();
		PrintWriter out=response.getWriter();
		
		try {
			if(action == null || action.equals("/login")) {
				String id=request.getParameter("id");
				String pw=request.getParameter("pw");
				
				dao=new UserDAO();
				boolean result=dao.loginCheck(id,pw);
				if(result) {
					System.out.println("로그인 성공_result : "+result);
					out.print("true");
					userVO=new UserVO();
					userVO.setId(id);
					userVO.setPw(pw);
					
					session=request.getSession();
					session.setAttribute("isLogon", result); // or result
					session.setAttribute("log_id", id);
					System.out.println("세션 ID : "+session.getId());
				} else {
					System.out.println("로그인 실패_result : "+result);
					out.print("false");
				}
			} else if(action.equals("/logout")) {
				session=request.getSession();
				session.invalidate();	// 세션 삭제
				response.sendRedirect(ContextPath+"/index.jsp");
			}
		} catch (Exception e) {
			System.out.println("로그인 처리 중 오류 발생");
			e.printStackTrace();
		}
		
		
	}
}
