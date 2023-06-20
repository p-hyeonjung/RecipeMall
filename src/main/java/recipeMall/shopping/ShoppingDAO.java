package recipeMall.shopping;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import recipeMall.mypage.CartVO;

public class ShoppingDAO {
   private Connection conn;
   private PreparedStatement pstmt;
   private DataSource dataFactory;
   
   public ShoppingDAO() {
      try {
         Context ctx = new InitialContext();
         Context envContext = (Context) ctx.lookup("java:/comp/env");
         dataFactory = (DataSource) envContext.lookup("jdbc/oracle"); // "읽어올 데이터베이스"
      } catch (Exception e) {
         System.out.println("DB연결 오류");
      }
   }   
   
   //재료 조회 메서드
   public List<ProductVO> selectAllMatarial (Map<String, Integer> pagingMap) {
      List<ProductVO> matarialList = new ArrayList<ProductVO>();
      int section = pagingMap.get("section");
      int pageNum = pagingMap.get("pageNum");
      try {
         conn = dataFactory.getConnection();
         String query = "SELECT ROWNUM AS recNum, prodCode, prodName, prodKind, prodPrice, prodImage, avgStar, reviewCnt FROM producttbl WHERE recNum BETWEEN (?-1)*100+(?-1)*10+1 AND (?-1)*100+?*10 AND prodKind=?";
         System.out.println(query);
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, section);
         pstmt.setInt(2, pageNum);
         pstmt.setInt(3, section);
         pstmt.setInt(4, pageNum);
         ResultSet rs = pstmt.executeQuery();
         while(rs.next ()) {
            int prodCode = rs.getInt("prodCode");
            String prodName = rs.getString("prodName");
            int prodKind = rs.getInt("prodKind");
            int prodPrice = rs.getInt("prodPrice");
            String prodImage = rs.getString("prodImage");
            double avgStar = rs.getDouble("avgStar");
            int reviewCnt = rs.getInt("reviewCnt");
            ProductVO shoppingVO = new ProductVO();
            shoppingVO.setProdCode(prodCode);
            shoppingVO.setProdName(prodName);
            shoppingVO.setProdKind(prodKind);
            shoppingVO.setProdPrice(prodPrice);
            shoppingVO.setProdImage(prodImage);
            shoppingVO.setAvgStar(avgStar);
            shoppingVO.setReviewCnt(reviewCnt);
            matarialList.add(shoppingVO);
         }
         rs.close();
         pstmt.close();
         conn.close();
      }catch (Exception e) {
         System.out.println("글 목록 페이지 조회 중 에러");
         e.printStackTrace();
      }
      return matarialList;
   }
   
   //카테고리 재료 목록 수
   public int selectToMatarial() {
      int totCount = 0;
      try {
         conn = dataFactory.getConnection();
         String query = "select count(*) from producttbl where prodKind='채소/과일";
         pstmt = conn.prepareStatement(query);
         ResultSet rs = pstmt.executeQuery();
         if (rs.next()) {
            totCount = rs.getInt(1);
         }
         pstmt.close();
         rs.close();
         conn.close();
      } catch (Exception e) {
         System.out.println("전체 글 목록 수 처리중 에러");
         e.printStackTrace();
      }
      return totCount;
   }
   
   // 별점 높은 순 글 목록 조회 메서드
   public List<ProductVO> slelectReview() {
      List<ProductVO> reviewList = new ArrayList<ProductVO>();
      try {
         conn = dataFactory.getConnection();
         String query = "SELECT prodCode, prodName, prodPrice, prodImage, avgStar, reviewCnt FROM producttbl ORDER BY avgStar DESC";
         pstmt = conn.prepareStatement(query);
         ResultSet rs = pstmt.executeQuery();
         while(rs.next ()) {
            int prodCode = rs.getInt("prodCode");
            String prodName = rs.getString("prodName");
            int prodPrice = rs.getInt("prodPrice");
            String prodImage = rs.getString("prodImage");
            double avgStar = rs.getDouble("avgStar");
            int reviewCnt = rs.getInt("reviewCnt");
            ProductVO shoppingVO = new ProductVO();
            shoppingVO.setProdCode(prodCode);
            shoppingVO.setProdName(prodName);
            shoppingVO.setProdPrice(prodPrice);
            shoppingVO.setProdImage(prodImage);
            shoppingVO.setAvgStar(avgStar);
            shoppingVO.setReviewCnt(reviewCnt);
            reviewList.add(shoppingVO);
         }
         rs.close();
         pstmt.close();
         conn.close();
      }catch (Exception e) {
         System.out.println("별점 높은 순 글 목록 조회 처리중 에러");
         e.printStackTrace();
      }
      return reviewList;
   }
   
   // 역대 베스트 순 글 목록 조회 메서드
   public List<ProductVO> slelectProdCount() {
      List<ProductVO> prodCountList = new ArrayList<ProductVO>();
      try {
         conn = dataFactory.getConnection();
         String query = "SELECT prodCode, prodName, prodPrice, prodImage, avgStar, reviewCnt, prodCount FROM producttbl ORDER BY prodCount DESC";
         pstmt = conn.prepareStatement(query);
         ResultSet rs = pstmt.executeQuery();
         while(rs.next ()) {
            int prodCode = rs.getInt("prodCode");
            String prodName = rs.getString("prodName");
            int prodPrice = rs.getInt("prodPrice");
            String prodImage = rs.getString("prodImage");
            double avgStar = rs.getDouble("avgStar");
            int reviewCnt = rs.getInt("reviewCnt");
            int prodCount = rs.getInt("prodCount");
            ProductVO shoppingVO = new ProductVO();
            shoppingVO.setProdCode(prodCode);
            shoppingVO.setProdName(prodName);
            shoppingVO.setProdPrice(prodPrice);
            shoppingVO.setProdImage(prodImage);
            shoppingVO.setAvgStar(avgStar);
            shoppingVO.setReviewCnt(reviewCnt);
            shoppingVO.setProdCount(prodCount);
            prodCountList.add(shoppingVO);
         }
         rs.close();
         pstmt.close();
         conn.close();
      }catch (Exception e) {
         System.out.println("역대 베스트 순 글 목록 조회 처리중 에러");
         e.printStackTrace();
      }
      return prodCountList;
   }
// 별점 높은 순 글 목록 조회 메서드
   public List<ProductVO> slelectReview(List<ProductVO> reviewList) {
      try {
         conn = dataFactory.getConnection();
         String query = "SELECT prodCode, prodName, prodPrice, prodImage, avgStar, reviewCnt FROM producttbl ORDER BY avgStar DESC";
         pstmt = conn.prepareStatement(query);
         ResultSet rs = pstmt.executeQuery();
         while(rs.next ()) {
            int prodCode = rs.getInt("prodCode");
            String prodName = rs.getString("prodName");
            int prodPrice = rs.getInt("prodPrice");
            String prodImage = rs.getString("prodImage");
            double avgStar = rs.getDouble("avgStar");
            int reviewCnt = rs.getInt("reviewCnt");
            ProductVO shoppingVO = new ProductVO();
            shoppingVO.setProdCode(prodCode);
            shoppingVO.setProdName(prodName);
            shoppingVO.setProdPrice(prodPrice);
            shoppingVO.setProdImage(prodImage);
            shoppingVO.setAvgStar(avgStar);
            shoppingVO.setReviewCnt(reviewCnt);
            reviewList.add(shoppingVO);
         }
         rs.close();
         pstmt.close();
         conn.close();
      }catch (Exception e) {
         System.out.println("별점 높은 순 글 목록 조회 처리중 에러");
         e.printStackTrace();
      }
      return reviewList;
   }
 //대표계절 선택 메서드
   public List<ProductVO> selectSeason(List<ProductVO> productList) {
      try {
            
            conn = dataFactory.getConnection();
            String query = "SELECT prodCode, prodName, prodPrice, prodImage,prodCount,prodSeason, avgStar, reviewCnt  FROM producttbl";
            pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next ()) {
               int prodCode = rs.getInt("prodCode");
               String prodName = rs.getString("prodName");
               int prodPrice = rs.getInt("prodPrice");
               String prodImage = rs.getString("prodImage");
               double avgStar = rs.getDouble("avgStar");
               int reviewCnt = rs.getInt("reviewCnt");
               int prodCount = rs.getInt("prodCount");
               int prodSeason=rs.getInt("prodSeason");
               ProductVO productVO = new ProductVO();
               productVO.setProdCode(prodCode);
               productVO.setProdName(prodName); 
               productVO.setProdPrice(prodPrice);
               productVO.setProdImage(prodImage);
               productVO.setAvgStar(avgStar);
               productVO.setReviewCnt(reviewCnt);
               productVO.setProdCount(prodCount);
               productVO.setProdSeason(prodSeason);
               productList.add(productVO);
            };
            rs.close();
            pstmt.close();
            conn.close();
         }catch (Exception e) {
            System.out.println("시즌 리스트 조회 중 에러");
            e.printStackTrace();
         }
         return productList;
      }
   //상품정보 조회 메서드
   public  List<ProductVO> selectCode(Map<String, Integer> infoMap) {
      List<ProductVO> productList=new ArrayList<>();
      int tempCode=infoMap.get("tempCode");
      try {
         conn = dataFactory.getConnection();
            String query = "SELECT  prodCode, prodName, prodKind, prodPrice, prodImage,prodContent1,prodContent2,prodContent3,prodContentImage1,prodContentImage2,"
                  + "prodCount,prodSeason, avgStar, reviewCnt,prodRest FROM producttbl WHERE prodCode=?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1,tempCode  );
            ResultSet rs = pstmt.executeQuery();
            while(rs.next ()) {
               int prodCode = rs.getInt("prodCode");
               String prodName = rs.getString("prodName");
               int prodKind = rs.getInt("prodKind");
               int prodPrice = rs.getInt("prodPrice");
               String prodImage = rs.getString("prodImage");
               String prodContent1=rs.getString("prodContent1");
               String prodContent2=rs.getString("prodContent2");
               String prodContent3=rs.getString("prodContent3");
               String prodContentImage1=rs.getString("prodContentImage1");
               String prodContentImage2=rs.getString("prodContentImage2");
               int prodCount=rs.getInt("prodCount");
               int prodSeason=rs.getInt("prodSeason");
               double avgStar = rs.getDouble("avgStar");
               int reviewCnt = rs.getInt("reviewCnt");
               int prodRest=rs.getInt("prodRest");
               ProductVO productVO = new ProductVO();
               productVO.setProdCode(prodCode);
               productVO.setProdName(prodName);
               productVO.setProdKind(prodKind);
               productVO.setProdPrice(prodPrice);
               productVO.setProdImage(prodImage);
               productVO.setProdContent1(prodContent1);
               productVO.setProdContent2(prodContent2);
               productVO.setProdContent3(prodContent3);
               productVO.setProdContentImage1(prodContentImage1);
               productVO.setProdContentImage2(prodContentImage2);
               productVO.setProdCount(prodCount);
               productVO.setProdSeason(prodSeason);
               productVO.setAvgStar(avgStar);
               productVO.setReviewCnt(reviewCnt);
               productVO.setProdRest(prodRest);
               productList.add(productVO);
            }
            rs.close();
            pstmt.close();
            conn.close();
         }catch (Exception e) {
            System.out.println("상품정보 조회 중 에러");
            e.printStackTrace();
         }
         return productList;
      }
   //상품정보 리뷰 조회 메서드
   public  List<ReviewVO> selectReview(Map<String, Integer> infoMap) {
      List<ReviewVO> reviewList=new ArrayList<>();
      int tempCode=infoMap.get("tempCode");
      try {
         conn = dataFactory.getConnection();
            String query = "SELECT  prodCode, reviewCode, reviewContent, id,reviewDate,reviewTitle"
                  + " FROM reviewtbl WHERE prodCode=?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1,tempCode);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next ()) {
               int prodCode = rs.getInt("prodCode");
               int reviewCode = rs.getInt("reviewCode");
               String reviewContent = rs.getString("reviewContent");
               String id = rs.getString("id");
               Date reviewDate=rs.getDate("reviewDate");
               String reviewTitle=rs.getString("reviewTitle");
               ReviewVO reviewVO = new ReviewVO();
               reviewVO.setProdCode(prodCode);
               reviewVO.setReviewCode(reviewCode);
               reviewVO.setReviewContent(reviewContent);
               reviewVO.setId(id);
               reviewVO.setReviewDate(reviewDate);
               reviewVO.setReviewTitle(reviewTitle);
               reviewList.add(reviewVO);
            }
            rs.close();
            pstmt.close();
            conn.close();
         }catch (Exception e) {
            System.out.println("상품정보 리뷰 조회 중 에러");
            e.printStackTrace();
         }
         return reviewList;
   }
   //비슷한 상품 조회 메서드
   public  List<ProductVO> selectSimilarProduct(Map<String, Integer> infoMap) {
      List<ProductVO> similarList=new ArrayList<>();
      int tempCode=infoMap.get("tempCode");
      try {
         conn = dataFactory.getConnection();
            String query = "SELECT * FROM producttbl WHERE prodKind=(select prodKind from producttbl where prodCode=?) and prodCode <> ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1,tempCode  );
            pstmt.setInt(2,tempCode  );
            ResultSet rs = pstmt.executeQuery();
            while(rs.next ()) {
               int prodCode = rs.getInt("prodCode");
               String prodName = rs.getString("prodName");
               int prodKind = rs.getInt("prodKind");
               int prodPrice = rs.getInt("prodPrice");
               String prodImage = rs.getString("prodImage");
               String prodContent1=rs.getString("prodContent1");
               String prodContent2=rs.getString("prodContent2");
               String prodContent3=rs.getString("prodContent3");
               String prodContentImage1=rs.getString("prodContentImage1");
               String prodContentImage2=rs.getString("prodContentImage2");
               int prodCount=rs.getInt("prodCount");
               int prodSeason=rs.getInt("prodSeason");
               double avgStar = rs.getDouble("avgStar");
               int reviewCnt = rs.getInt("reviewCnt");
               int prodRest=rs.getInt("prodRest");
               ProductVO productVO = new ProductVO();
               productVO.setProdCode(prodCode);
               productVO.setProdName(prodName);
               productVO.setProdKind(prodKind);
               productVO.setProdPrice(prodPrice);
               productVO.setProdImage(prodImage);
               productVO.setProdContent1(prodContent1);
               productVO.setProdContent2(prodContent2);
               productVO.setProdContent3(prodContent3);
               productVO.setProdContentImage1(prodContentImage1);
               productVO.setProdContentImage2(prodContentImage2);
               productVO.setProdCount(prodCount);
               productVO.setProdSeason(prodSeason);
               productVO.setAvgStar(avgStar);
               productVO.setReviewCnt(reviewCnt);
               productVO.setProdRest(prodRest);
               similarList.add(productVO);
            }
            rs.close();
            pstmt.close();
            conn.close();
         }catch (Exception e) {
            System.out.println("비슷한 상품 조회 중 에러");
            e.printStackTrace();
         }
         return similarList;
      }
   //장바구니 등록 메서드
   public void insertCart(CartVO cartVO) {
      try {
    	   int prodCode=cartVO.getProdCode();
           String prodName=cartVO.getProdName();
           String prodImage=cartVO.getProdImage();
           int cartCount=cartVO.getCartCount();
           int prodPrice=cartVO.getProdPrice();
           String id=cartVO.getId();
            conn = dataFactory.getConnection();
            String query = "insert into carttbl(prodCode,prodName,prodImage,cartCount,prodPrice,id) values(?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, prodCode);
            pstmt.setString(2, prodName);
            pstmt.setString(3, prodImage);
            pstmt.setInt(4, cartCount);
            pstmt.setInt(5, prodPrice);
            pstmt.setString(6, id);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
         }catch (Exception e) {
            System.out.println("장바구니 등록 중 에러");
            e.printStackTrace();
         }
      }
   public  List<ProductFaqVO> selectFaq(Map<String, Integer> infoMap) {
         List<ProductFaqVO> productFaqList=new ArrayList<>();
         int tempCode=infoMap.get("tempCode");
         try {
            conn = dataFactory.getConnection();
               String query = "SELECT * FROM productFaqtbl WHERE prodKind=(select prodKind from productFaqtbl where prodCode=?)";
               pstmt = conn.prepareStatement(query);
               pstmt.setInt(1,tempCode  );
               pstmt.setInt(2,tempCode  );
               ResultSet rs = pstmt.executeQuery();
               while(rs.next ()) {
                  int prodCode = rs.getInt("prodCode");
                  int prodFaqNo = rs.getInt("prodFaqNo");
                  String prodTitle = rs.getString("prodTitle");
                  String prodContent = rs.getString("prodContent");
                  String adminId = rs.getString("adminId");
                  String adminContent = rs.getString("adminContent");
                  int hasComent = rs.getInt("hasComent");
                  String id = rs.getString("id");
                
                  ProductFaqVO productVO = new ProductFaqVO();
                  productVO.setProdCode(prodCode);
                  productVO.setProdFaqNo(prodFaqNo);
                  productVO.setProdTitle(prodTitle);
                  productVO.setProdContent(prodContent);
                  productVO.setAdminId(adminId);
                  productVO.setAdminContent(adminContent);
                  productVO.setHasComent(hasComent);
                  productVO.setId(id);
                  productFaqList.add(productVO);
               }
               rs.close();
               pstmt.close();
               conn.close();
            }catch (Exception e) {
               System.out.println("비슷한 상품 조회 중 에러");
               e.printStackTrace();
            }
            return productFaqList;
         }
   }