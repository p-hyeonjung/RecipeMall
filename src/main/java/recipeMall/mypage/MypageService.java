package recipeMall.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import recipeMall.order.OrderDVO;
import recipeMall.order.OrderVO;
import recipeMall.shopping.ProductVO;

public class MypageService {
   MypageDAO dao;
   
   public MypageService() {
      dao=new MypageDAO();
   }
   
   public Map selectServiceOrder(String id) {
      Map orderMap= new HashMap();
      List<OrderVO> orderList1=dao.selectOrder1(id);
      List<OrderDVO> orderList2=dao.selectOrder2(orderList1);
      List<ProductVO> orderList3=dao.selectOrder3(orderList2);
      orderMap.put("orderList1", orderList1);
      orderMap.put("orderList2", orderList2);
      orderMap.put("orderList3", orderList3);
      return orderMap;
   }
}