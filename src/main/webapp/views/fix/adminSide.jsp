<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div id="sidebar">
           <div class="side header">
               RecipeMall
           </div>
           <div class="move">
               <a href=""><i class="fa-solid fa-up-right-from-square"></i>사이트 바로가기</a>
           </div>
           <div class="manage">
               <div class="title">사이트 관리</div>
               <div class="menu">
                   <ul class="main_menu">
					<li><a href="${contextPath}/views/admin/user.jsp">회원 관리</a></li>
					<li><a href="${contextPath}/views/admin/product.jsp">상품 관리</a></li>
					<li><a href="${contextPath}/views/admin/order.jsp">주문 관리</a></li>
					<li><a href="${contextPath}/views/admin/shipping.jsp">배송 관리</a></li>
					<li><span class="lnb">문의 관리</span>
						<ul class="sub">
							<li><a href="${contextPath}/views/admin/notice.jsp">공지사항</a></li>
							<li><a href="${contextPath}/views/admin/faq.jsp">자주하는 질문</a></li>
							<li><a href="${contextPath}/views/admin/prodInquery.jsp">상품 문의</a></li>
							<li><a href="${contextPath}/views/admin/userInquery.jsp">일대일문의</a></li>
						</ul>
					</li>
					<li><a href="${contextPath}/views/admin/board.jsp">게시판 관리</a></li>
				</ul>
               </div>
           </div>
       </div>
        <div id="content">
            <div class="cont header">
            	<span>관리자 ${log_adminId}님 </span>
                <a class="home" href="${contextPath}/views/admin/main.jsp">메인</a>
                <a class="log" href="${contextPath}/admin/logout.do">로그아웃</a>
            </div>