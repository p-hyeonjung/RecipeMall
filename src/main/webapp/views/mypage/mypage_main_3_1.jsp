<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
session.getAttribute("isLogon");
session.getAttribute("log_id");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RecipeMall-마이페이지</title>
<script src="https://kit.fontawesome.com/54880b83c5.js" crossorigin="anonymous"></script>
<script src="${contextPath}/views/js/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/views/js/jquery-ui.min.js"></script>
<script src="${contextPath}/views/mypage/js/mypage_3_1.js"></script>
<link rel="stylesheet" href="${contextPath}/views/mypage/css/mypage.css">
<link rel="stylesheet" href="${contextPath}/views/mypage/css/mypage_common.css">
<link rel="stylesheet" href="${contextPath}/views/mypage/css/mypage_3_1.css">
<link rel="shortcut icon" href="${contextPath}/views/images/smalllogo.png" />
</head>

<body>
	<!--[s]건너뛰기 링크-->
	<a id="skipNav" href="">본문 바로가기</a>
	<!--[e]건너뛰기 링크-->
	<!-- [s]Header 영역 -->
	<!-- [s]Header 영역 -->
	<jsp:include page="/views/fix/mypageHeader.jsp"/>
	<!-- [s]Header 영역 -->
	<!-- [s]Header 영역 -->
	<!-- content_mypage_s -->
	<div id="main_content" class="mypage_box">
		<div id="mypage">
			<h2 class="mypage_title">
				<a href="mypage.html">마이페이지</a>
			</h2>
			<!-- sidebar -->
			<div class="side_bar">
				<!-- user_info:회원 프로필사진,포인트,출석체크 -->
				<div class="user_info_box">
					<div class="user_profile">
						<img src="../images/user.png" alt="user">
					</div>
					<p>현재 포인트 14330</p>
					<button class="check_attend">로그아웃</button>
				</div>
				<!-- mypage menu -->
				<div class="mypage_menu">
					<ul class="main_menu">
						<li><a href="mypage_user_info.html">내 정보</a></li>
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
								<li><a href="mypage_main_6_1.html">- 자주하는 질문</a></li>
								<li><a href="mypage_main_6_2.html">- 일대일 문의</a></li>
								<li><a href="mypage_main_6_3.html">- 공지사항</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<!-- sidebar -->
			<!-- mypage_content -->
			<div class="mypage_content">
				<h3>문의내역 / 답글보기</h3>
				<hr>
			</div>
			<div class="mypage_product_area">
				<div class="mypage_product_qna">
					<div class="mypage_product_q">
						<span class="txt_q">Q.</span>
						<h4>재출고 날짜가 언제인가요?</h4>
						<h6>(쇼핑 > 신선식품)</h6>
						<p>유기농 고랭지 배추 재출고 날짜가 궁금해 문의 드립니다.</p>
					</div>
					<button type="button" class="btn_product" data-review-id="1">
						<i class="fa-solid fa-chevron-down"></i>
					</button>
					<div class="mypage_product_a" id="review_form_1">
						<span class="txt_a">A.</span>
						<p>해당상품은 입고 되는 즉시 재출고 됩니다. 감사합니다.</p>
					</div>
				</div>
				<div class="mypage_product_qna">
					<div class="mypage_product_q">
						<span class="txt_q">Q.</span>
						<h4>원산지가 어디인가요?</h4>
						<h6>(쇼핑 > 신선식품)</h6>
						<p>판매중인 우유 원산지 문의 드립니다.</p>
					</div>
					<button type="button" class="btn_product" data-review-id="2">
						<i class="fa-solid fa-chevron-down"></i>
					</button>
					<div class="mypage_product_a" id="review_form_2">
						<span class="txt_a">A.</span>
						<p>해당상품은 저도 모릅니다. 수고하세요.</p>
					</div>
				</div>
			</div>
			<!-- mypage_content -->
		</div>
	</div>
	<!-- content_mypage_e -->
	<!-- [s]footer 영역 -->
	<jsp:include page="/views/fix/footer.jsp"/>
	<!-- [e]footer 영역 -->

</body>
</html>