<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
				<div class="side_bar">
				<!-- user_info:회원 프로필사진,포인트,출석체크 -->
				<div class="user_info_box">
					<div class="user_profile">
						<img src="${contextPath}/images/user.png" alt="user">
					</div>
					<p>현재 포인트 14330</p>
					<button class="check_attend">로그아웃</button>
				</div>
				<!-- mypage menu -->
				<div class="mypage_menu">
					<ul class="main_menu">
						<li><a href="${contextPath}/user/userInfo.do?id=${log_id}">내 정보</a></li>
						<li><a href="#">주문/배송</a>
							<ul class="sub_menu">
								<li><a href="mypage_main_2_1.html">- 주문목록/배송조회</a></li>
								<li><a href="mypage_main_2_2.html">- 취소/반품/교환 내역</a></li>
								<li><a href="mypage_main_2_3.html">- 배송지 등록</a></li>
								<li><a href="mypage_main_2_4.html">- 장바구니</a></li>
							</ul></li>
						<li><a href="#">상품</a>
							<ul class="sub_menu">
								<li><a href="mypage_main_3_1.html">- 상품 문의</a></li>
								<li><a href="mypage_main_3_2.html">- 상품 리뷰</a></li>
							</ul></li>
						<li><a href="#">글/댓글 관리</a>
							<ul class="sub_menu">
								<li><a href="mypage_main_4_1.html">- 글 </a></li>
								<li><a href="mypage_main_4_2.html">- 댓글</a></li>
							</ul></li>
						<li><a href="mypage_main_5.html">차단 목록</a></li>
						<li><a href="">고객센터</a>
							<ul class="sub_menu">
								<li><a href="${contextPath}/mypage/service/faq.do">- 자주하는 질문</a></li>
								<li><a href="${contextPath}/mypage/service/inqList.do?id=${log_id}">- 일대일 문의</a></li>
								<li><a href="${contextPath}/mypage/service/notice.do">- 공지사항</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>