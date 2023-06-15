package recipeMall.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/user/*")
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
		PrintWriter out=response.getWriter();
		String action=request.getPathInfo();
		String nextPage="";
		
		
		if(action.equals("/joinForm.do")) {
			nextPage="/views/join.jsp";
		} else if(action.equals("/idExisted.do")) {
			String id=request.getParameter("id");
			boolean result=dao.idExisted(id);
			if(result) {
				out.print("true");				
			} else {
				out.print("false");
			}
			return;
		} else if(action.equals("/addUser.do")) {
			String name=request.getParameter("user_name");
			String id=request.getParameter("user_id");
			String pw=request.getParameter("user_pwd_check");
			String nikName=request.getParameter("user_nickname");
			String phone=request.getParameter("user_phone");
			String userAddr=request.getParameter("user_addr1");
			String userAddr2=request.getParameter("user_addr2");
			String rcmd=request.getParameter("user_recommend");
			
			if(rcmd==null || rcmd.equals("")) {	// 추천인 없는 경우
				userVO=new UserVO(id, pw, name, nikName, phone, userAddr, userAddr2);
				System.out.println("회원가입 id="+userVO.getId());
				dao.addUser(userVO);
			} else {	// 추천인 있는 경우
				userVO=new UserVO(id, pw, name, nikName, phone, rcmd, userAddr, userAddr2);
				dao.addUser2(userVO);
			}
			out.print("<script>");
			out.print("alert('회원가입이 완료되었습니다.');");
			out.print("</script>");
			nextPage="/views/index.jsp";
		
		} else if(action.equals("/userInfo.do")) {
			String id=request.getParameter("id");
			userVO=dao.userInfo(id);
			request.setAttribute("user", userVO);
			nextPage="/views/mypage/mypage_user_info.jsp";
			
		} else if(action.equals("/updateUser.do")) {
			String id=request.getParameter("id");
			String nikName=request.getParameter("user_nikname");
			String pw=request.getParameter("pw");
			String phone=request.getParameter("user_phone");
			System.out.println(nikName);
			System.out.println(pw);
			
			userVO.setId(id);
			userVO.setNikName(nikName);
			userVO.setPw(pw);
			userVO.setPhone(phone);
			dao.updateUser(userVO);
			request.setAttribute("user", userVO);
			nextPage="/user/userInfo.do?id="+id;
			
		} else if(action.equals("/deleteUser.do")) {
			session=request.getSession(false);
			String id=request.getParameter("id");
			dao.deleteUser(id);
			session.removeAttribute("isLogon");
			session.removeAttribute("log_id");
			session.invalidate();
			nextPage="/views/index.jsp";
		} else if(action.equals("/findID.do")) {
			
		} else if(action.equals("/findPW.do")) {
			
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}

}
