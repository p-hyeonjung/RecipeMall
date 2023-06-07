<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RecipeMall-마이페이지</title>
    <script src="https://kit.fontawesome.com/54880b83c5.js" crossorigin="anonymous"></script>
    <script src="../js/jquery-3.6.4.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="${contextPath}/mypage/js/mypage.js"></script>
    <link rel="stylesheet" href="${contextPath}/mypage/css/mypage.css">
    <link rel="stylesheet" href="${contextPath}/mypage/css/mypage_common.css">
    <link rel="stylesheet" href="${contextPath}/mypage/css/mypage_6.css">
    <link rel="shortcut icon" href="../image/smalllogo.png" />
</head>
<body>
    <!--[s]건너뛰기 링크-->
    <a id="skipNav" href="">본문 바로가기</a>
    <!--[e]건너뛰기 링크-->
    <!-- [s]Header 영역 -->
    <jsp:include page="/fix/mypageHeader.jsp"/>
	<!-- [e]Header 영역 -->
   <!-- content_mypage_s -->
   <div id="main_content" class="mypage_box">
       <div id="mypage">
           <h2 class="mypage_title"><a href="mypage.html">마이페이지</a></h2>
           <!-- sidebar -->
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
                       <li><a href="mypage_user_info.html">내 정보</a></li>
                       <li><a href="#">주문/배송</a>
                           <ul class="sub_menu">
                               <li><a href="mypage_main_2_1.html">- 주문목록/배송조회</a></li>
                               <li><a href="mypage_main_2_2.html">- 취소/반품/교환 내역</a></li>
                               <li><a href="mypage_main_2_3.html">- 배송지 등록</a></li>
                               <li><a href="mypage_main_2_4.html">- 장바구니</a></li>
                           </ul>
                       </li>
                       <li><a href="#">상품</a>
                           <ul class="sub_menu">
                               <li><a href="mypage_main_3_1.html">- 상품 문의</a></li>
                               <li><a href="mypage_main_3_2.html">- 상품 리뷰</a></li>
                           </ul>
                       </li>
                       <li><a href="#">글/댓글 관리</a>
                           <ul class="sub_menu">
                               <li><a href="mypage_main_4_1.html">- 글 </a></li>
                               <li><a href="mypage_main_4_2.html">- 댓글</a></li>
                           </ul>
                       </li>
                       <li><a href="mypage_main_5.html">차단 목록</a></li>
                       <li><a href="">고객센터</a>
                           <ul class="sub_menu">
                               <li><a href="${contextPath}/mypage/service/faq.do">- 자주하는 질문</a></li>
                               <li><a href="mypage_main_6_2.html">- 일대일 문의</a></li>
                               <li><a href="mypage_main_6_3.html">- 공지사항</a></li>
                           </ul>
                       </li>
                   </ul>
               </div>
           </div>
           <!-- sidebar -->
		<c:if test="${isLogon == true }">
           <!-- mypage_content -->
            <div class="mypage_content">
                <h3 class="menu_title">고객센터</h3>
                <div class="cs_center">
                    <h4 class="c_title">자주하는 질문</h4>
                    <div class="accordions cs_faq">
                        <ul class="faq_list">
                        	<c:forEach var="faqList" items="${faqList}">
                        		<li class="accordion qna_box">
	                                <div class="accordion_title question">
	                                    <button class="click_btn">
	                                        <p class="qna_title">
	                                           <span class="i">Q.</span>
	                                            ${faqList.faqTitle}</p>
	                                        <span class="fa"><i class="fa-solid fa-chevron-up"></i></span>
	                                    </button>
	                                </div>
	                                <div class="accordion_body answer">
	                                    <div class="accordion_content">
	                                        <p>
	                                            ${faqList.faqContent}
	                                        </p>
	                                    </div>
	                                </div>
	                            </li>
                        	</c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- mypage_content -->
		</c:if>
		<c:if test="${isLogon != true}">
			<div>
				로그인 후 이용해주세요
			</div>
		</c:if>
        </div>
    </div>
    <!-- content_mypage_e -->

    <!-- footer_s -->
    <jsp:include page="/fix/footer.jsp"/>
    <!-- footer_e -->
</body>
</html>