package recipeMall.shopping;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recipeMall.mypage.CartVO;

@WebServlet("/shopping/*")
public class ShoppingController extends HttpServlet {
   ShoppingService shoppingService;
   ProductVO productVO;
   ShoppingDAO dao;
   public void init(ServletConfig config) throws ServletException {
      shoppingService = new ShoppingService();
      productVO = new ProductVO();
      dao=new ShoppingDAO();
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
      String nextPage = "";
      PrintWriter out;
      HttpSession session;
      String action = request.getPathInfo();// 요청명 가져오기
      System.out.println("요청이름: " + action);
      try {
            List<ProductVO> shoppingList = new ArrayList<ProductVO>();
            if(action == null || action.equals("")) {
               
            }else if (action.equals("/matarial.do")) {
               String _section = request.getParameter("section");
               String _pageNum = request.getParameter("pageNum");
               int section = Integer.parseInt((_section == null)?"1":_section);
               int pageNum = Integer.parseInt((_pageNum == null)?"1":_pageNum);
               Map<String, Integer> pagingMap = new HashMap<String, Integer>();
               pagingMap.put("section", section);
               pagingMap.put("pageNum", pageNum);
               Map matarialMap = shoppingService.listMatarial(pagingMap);
               matarialMap.put("section", section);
               matarialMap.put("pageNum", pageNum);
               request.setAttribute("matarialMap", matarialMap);
               nextPage = "/views/shopping/matarial.jsp";
            }
            
            else if(action.equals("/bestReview.do")) {
               shoppingList = shoppingService.bestReview();
               request.setAttribute("reviewList", shoppingList);
               nextPage = "/views/shopping/shopping_best.jsp";
            }else if(action.equals("/season.do")) {
                     List<ProductVO> productList=new ArrayList<>();
                     dao.selectSeason(productList);
                     request.setAttribute("productList", productList);
                     nextPage = "/views/shopping/season.jsp";
                  }else if(action.equals("/shopping_index.do")) {
                     List<ProductVO> productList=new ArrayList<>();
                     dao.selectSeason(productList);
                     request.setAttribute("productList", productList);
                     nextPage = "/views/shopping/shopping_index.jsp";
                  }else if(action.equals("/product_info.do")) {
                     int tempCode=Integer.parseInt(request.getParameter("prodCode"));
                     Map<String, Integer> infoMap=new HashMap<String, Integer>();
                     infoMap.put("tempCode", tempCode);
                     Map productInfoMap=shoppingService.selectProdInfo(infoMap);
                     request.setAttribute("productInfoMap", productInfoMap);
                     nextPage = "/views/shopping/product_info.jsp";
                  }else if(action.equals("/goCart.do")) {
                	 int prodCode=Integer.parseInt(request.getParameter("prodCode"));
                     String productName=request.getParameter("prodName");
                     String prodImage=request.getParameter("prodImage");
                     int cartCount=Integer.parseInt(request.getParameter("cartCount")) ;
                     int prodPrice=Integer.parseInt(request.getParameter("prodPrice"));
                     String id="hong";
                     List<CartVO> cartList=new ArrayList<>();
                     CartVO cartVO=new CartVO();
                     cartVO.setProdCode(prodCode);
                     cartVO.setProdName(productName);
                     cartVO.setProdImage(prodImage);
                     cartVO.setProdPrice(prodPrice);
                     cartVO.setId(id);
                     cartVO.setCartCount(cartCount);
                     dao.insertCart(cartVO);
                     nextPage = "/mypage/mypage_main_2_4.do";
                  }else if(action.equals("/buyProduct.do")) {
                     String productName=request.getParameter("prodName");
                     String prodImage=request.getParameter("prodImage");
                     int cartCount=Integer.parseInt(request.getParameter("cartCount")) ;
                     int prodPrice=Integer.parseInt(request.getParameter("prodPrice"));
                     String id=request.getParameter("id");
                     List<CartVO> cartList=new ArrayList<>();
                     CartVO cartVO=new CartVO();
                     cartVO.setProdName(productName);
                     cartVO.setProdImage(prodImage);
                     cartVO.setProdPrice(prodPrice);
                     cartVO.setId(id);
                     cartVO.setCartCount(cartCount);
                     cartList.add(cartVO);
                     dao.insertCart(cartVO);
                     nextPage = "/views/shopping/payment.do";
                  }
         RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
         dispatcher.forward(request, response);
      }catch (Exception e) {
         System.out.println("요청 처리 중 에러" + e.getMessage());
         e.printStackTrace();
      }
   }
}