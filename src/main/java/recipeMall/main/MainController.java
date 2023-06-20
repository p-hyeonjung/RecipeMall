package recipeMall.main;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/main/*")
public class MainController extends HttpServlet {
	
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
		
		if(action==null || action.equals("/index")) {
			response.sendRedirect(contextPath+"/views/index.jsp");			
		} else if(action.equals("/mypage.do")) {
			response.sendRedirect(contextPath+"/views/mypage/mypage.jsp");
		}
	}

}
