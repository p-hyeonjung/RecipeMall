package recipeMall.shopping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ShoppingService {
   ShoppingDAO shoppingDAO;
   
   public ShoppingService() {
      shoppingDAO = new ShoppingDAO();
   }
   
   public Map listMatarial(Map<String, Integer> pagingMap) {
      Map matarialMap = new HashMap();
      List<ProductVO> matarialList = shoppingDAO.selectAllMatarial(pagingMap);
      int totMatarial = shoppingDAO.selectToMatarial();
      matarialMap.put("matarialList", matarialList);
      matarialMap.put("totMatarial", totMatarial);
      return matarialMap;
   }
   
   public List<ProductVO> bestReview() {
      List<ProductVO> reviewList = shoppingDAO.slelectReview();
      return reviewList;
   }
   public Map selectProdInfo(Map<String, Integer> infoMap) {
      Map productInfoMap = new HashMap();
      List<ProductVO> productList =shoppingDAO.selectCode(infoMap);
      List<ReviewVO> reviewList= shoppingDAO.selectReview(infoMap);
      List<ProductVO> similarList= shoppingDAO.selectSimilarProduct(infoMap);
      productInfoMap.put("productList", productList);
      productInfoMap.put("reviewList", reviewList);
      productInfoMap.put("similarList", similarList);
      return productInfoMap;
   }
   
}