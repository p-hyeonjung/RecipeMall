package recipeMall.mypage;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import recipeMall.order.OrderDVO;
import recipeMall.order.OrderVO;
import recipeMall.shopping.ProductVO;

public class MypageDAO {
   private Connection conn;
   private PreparedStatement pstmt;
   private DataSource dataFactory;   // 서버 가동시 db정보 전달, 클라 요청할 때마다 db연결
   
   public MypageDAO(){
      try {
         Context ctx=new InitialContext();
         Context envContext=(Context)ctx.lookup("java:/comp/env");
         dataFactory=(DataSource)envContext.lookup("jdbc/oracle");
      } catch (Exception e) {
         System.out.println("DB연결 오류");
      }
   }
   //배송지 목록 메서드
   public List<ShippingAddrVO> listShippingAddr(String id){
      List<ShippingAddrVO> shippigAddrList=new ArrayList();
      try {
         conn=dataFactory.getConnection();
         String query = "select shippingName,shippingTitle,shippingZonecode,shippingAddress,shippingAddressSub,shippingPhone,shippingCellphone from shippingaddrtbl where id=?";
         System.out.println(query);
         pstmt=conn.prepareStatement(query);
         pstmt.setString(1, id);
         ResultSet rs= pstmt.executeQuery();
         while(rs.next()) {
            String shippingName=rs.getString("shippingName");
            String ShippingTitle=rs.getString("ShippingTitle");
            int shippingZonecode=rs.getInt("shippingZonecode");
            String shippingAddress=rs.getString("shippingAddress");
            String shippingAddressSub=rs.getString("shippingAddressSub");
            String shippingPhone=rs.getString("shippingPhone");
            String shippingCellphone=rs.getString("shippingCellphone");
            ShippingAddrVO shipVo=new ShippingAddrVO(shippingName,ShippingTitle,shippingZonecode,
                  shippingAddress,shippingAddressSub,shippingPhone,shippingCellphone);
            shippigAddrList.add(shipVo);
         }
         rs.close();
         pstmt.close();
         conn.close();
      } catch (Exception e) {
         System.out.println("배송지 목록 가져오는중에러!");
         e.printStackTrace();
      }
      return shippigAddrList;
   }
   //배송지추가메서드
   public void addShipping(ShippingAddrVO shipVo) {
      try {
         conn=dataFactory.getConnection();
         String shippingName=shipVo.getShippingName();
         String shippingTitle=shipVo.getShippingTitle();
         String id=shipVo.getId();
         int shippingZonecode=shipVo.getShippingZonecode();
         String shippingAddress=shipVo.getShippingAddress();
         String shippingAddressSub=shipVo.getShippingAddressSub();
         String shippingPhone=shipVo.getShippingPhone();
         String shippingCellphone=shipVo.getShippingCellphone();
         String query="insert into shippingaddrtbl(shippingName,shippingTitle,id,shippingZonecode,shippingAddress,"
               + " shippingAddressSub,shippingPhone,shippingCellphone) values(?,?,?,?,?,?,?,?)";
         pstmt=conn.prepareStatement(query);
         pstmt.setString(1, shippingName);
         pstmt.setString(2, shippingTitle);
         pstmt.setString(3, id);
         pstmt.setInt(4, shippingZonecode);
         pstmt.setString(5, shippingAddress);
         pstmt.setString(6, shippingAddressSub);
         pstmt.setString(7, shippingPhone);
         pstmt.setString(8, shippingCellphone);
         pstmt.executeUpdate();
         pstmt.close();
         conn.close();
      } catch (Exception e) {
         System.out.println("배송지등록 중 오류!!");
         e.printStackTrace();
      }
   }
   //배송지 삭제
   public void deleteShipping(String shippingName ,String id) {
      try {
         conn=dataFactory.getConnection();
         String query="delete from shippingaddrtbl where id=? and shippingName=?";
         System.out.println(query);
         pstmt=conn.prepareStatement(query);
         pstmt.setString(1, id);
         pstmt.setString(2, shippingName);
         pstmt.executeUpdate();
         pstmt.close();
         conn.close();
      } catch (Exception e) {
         System.out.println("배송지 삭제중 에러");
         e.printStackTrace();
      }
   }
   //장바구니 조회
   public List<CartVO> cartSelect(String id){
      List<CartVO> cartList= new ArrayList();
      try {
         conn=dataFactory.getConnection();
         System.out.println(id);
         String query="select prodCode, cartCount, prodPrice, prodImage, prodName from carttbl where id=?";
         System.out.println(query);
         pstmt=conn.prepareStatement(query);
         pstmt.setString(1, id);
         ResultSet rs= pstmt.executeQuery();
         while(rs.next()) {
            int prodCode=rs.getInt("prodCode");
            int cartCount=rs.getInt("cartCount");
            int prodPrice=rs.getInt("prodPrice");
            String prodImage=rs.getString("prodImage");
            String prodName=rs.getString("prodName");
            System.out.println(prodCode);
            System.out.println(cartCount);
            System.out.println(prodPrice);
            System.out.println(prodImage);
            System.out.println(prodName);
            CartVO cartVo= new CartVO(prodCode,cartCount,prodPrice,prodImage,prodName);
            cartList.add(cartVo);
         }
         rs.close();
         pstmt.close();
         conn.close();
      } catch (Exception e) {
         System.out.println("장바구니조회중 에러");
         e.printStackTrace();
      }
      return cartList;
   }
   //장바구니 삭제 
   public void deleteCart(int prodCode,String id) {
      try {
         conn=dataFactory.getConnection();
         String query="delete from carttbl where prodCode=? and id=?";
         System.out.println(query);
         pstmt=conn.prepareStatement(query);
         pstmt.setInt(1, prodCode);
         pstmt.setString(2, id);
         pstmt.executeUpdate();
         pstmt.close();
         conn.close();
      } catch (Exception e) {
         System.out.println("장바구니삭제중 에러");
         e.printStackTrace();
      }
   }
   //장바구니 업데이트
   public void upadteCart(int cartCount,String id,String prodName1) {
      try {
         conn=dataFactory.getConnection();
         String query="update carttbl set cartCount=? where id=? and prodName=?";
         System.out.println(query);
         pstmt=conn.prepareStatement(query);
         pstmt.setInt(1, cartCount);
         pstmt.setString(2, id);
         pstmt.setString(3, prodName1);
         pstmt.executeUpdate();
         pstmt.close();
         conn.close();
      } catch (Exception e) {
         System.out.println("장바구니 업데이트중 오류");
         e.printStackTrace();
      }
   }
   //상품구매 리트스 가져오기
   public List<OrderVO> selectOrder1(String id) { 
      List<OrderVO> orderList1=new ArrayList();
      try {
         conn=dataFactory.getConnection();
         String query="select orderCode,orderDate from ordertbl where id=?";
         pstmt=conn.prepareStatement(query);
         pstmt.setString(1, id);
         ResultSet rs= pstmt.executeQuery();
         while(rs.next()){
            int orderCode=rs.getInt("orderCode");
            Date orderDate=rs.getDate("orderDate");
            OrderVO orderVo=new OrderVO();
            orderVo.setOrderCode(orderCode);
            orderVo.setOrderDate(orderDate);
            System.out.println(orderCode);
            System.out.println(orderDate);
            orderList1.add(orderVo);
         }
         rs.close();
           pstmt.close();
           conn.close();
      } catch (Exception e) {
         System.out.println("상품구매리스트1가져오던중에러");
         e.printStackTrace();
      }
      return orderList1;
   }
   //상품상세구매조회
   public List<OrderDVO> selectOrder2(List<OrderVO> orderList1){
      List<OrderDVO> orderList2=new ArrayList();
      int orderCode = 0;
      if(orderList1.size() !=0) {
    	  orderCode=orderList1.get(0).getOrderCode();
      }
      try {
         conn=dataFactory.getConnection();
         String query="select prodCode,orderAmount from orderdtbl where orderCode=?";
         pstmt=conn.prepareStatement(query);
         pstmt.setInt(1, orderCode);
         ResultSet rs= pstmt.executeQuery();
         while(rs.next()) {
            int prodCode=rs.getInt("prodCode");
            int orderAmount=rs.getInt("orderAmount");
            OrderDVO orderDvo=new OrderDVO();
            orderDvo.setProdCode(prodCode);
            orderDvo.setOrderAmount(orderAmount);
            System.out.println(prodCode);
            System.out.println(orderAmount);
            orderList2.add(orderDvo);
         }
         rs.close();
           pstmt.close();
           conn.close();
      } catch (Exception e) {
         System.out.println("상품구매리스트2가져오던중에러");
         e.printStackTrace();
      }
      return orderList2;
   }
   //상품가격조회
   public List<ProductVO> selectOrder3(List<OrderDVO> orderList2) {
      List<ProductVO> orderList3=new ArrayList();
      int prodCode=0;
      if(orderList2.size() !=0) { 
    	  prodCode=orderList2.get(0).getProdCode();
      }
      try {
         conn=dataFactory.getConnection();
         String query="select prodPrice,prodName from producttbl where prodCode=?";
         pstmt=conn.prepareStatement(query);
         pstmt.setInt(1, prodCode);
         ResultSet rs= pstmt.executeQuery();
         while(rs.next()) {
            int prodPrice=rs.getInt("prodPrice");
            String prodName=rs.getString("prodName");
            ProductVO prodVo=new ProductVO();
            prodVo.setProdPrice(prodPrice);
            prodVo.setProdName(prodName);
            System.out.println(prodPrice);
            System.out.println(prodName);
            orderList3.add(prodVo);
         }
         rs.close();
           pstmt.close();
           conn.close();
      } catch (Exception e) {
         System.out.println("상품구매리스트3가져오던중에러");
         e.printStackTrace();
      }
      return orderList3;
   }
}