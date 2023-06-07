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
    <!-- [s]Header 영역 -->
    <header>
	<!-- [s]Header_top 영역 -->
	<div class="header_top flex_area_rsb">
	    <!--[s]메인메뉴 영역 -->
	    <div>
	        <ul class="mainmenu flex_area_rsb">
	            <li class="main" title="메인페이지로 이동" onclick="location.href='../index.html'"></li>
	            <li><a href="../index.html" class="a_community">커뮤니티</a></li>
	            <li><a href="../shopping/shopping_index.html" class="a_shopping">쇼핑</a></li>
	        </ul>
	    </div>
	    <!--[e]메인메뉴 영역 -->
	
	    <!--[s]검색 영역 -->
	    <form action="" class="search_form">
	        <div class="search_area  flex_area_rsb">
	            <input id="" name="" type="search" title="검색어 입력" maxlength="255" class="" placeholder=" 통합검색">
	            <div class="btn_search">
	                <i class="fa-solid fa-magnifying-glass"></i>
	            </div>
	        </div>
	    </form>
	    <!--[e]검색 영역-->
	
	    <!--[s]서브 영역 -->
	    <div>
	        <ul class="submenu">
	            <!-- <li><a href="#"><i class="fa-sharp fa-regular fa-cart-shopping"></i></a></li> -->
	            <li><a href="#"><i class="fa-solid fa-cart-plus"></i></a></li>
			<c:if test="${isLogon == true}">
				<li><a href="${contextPath}/mypage/mypage.html">${log_id}님</a></li>
                <li><a href="${contextPath}/loginProc/logout" class="logout">로그아웃</a></li>
			</c:if>
			<c:if test="${isLogon != true}">
                <li><a href="#" class="login">로그인</a></li>
                <li><a href="join.html">회원가입</a></li>
			</c:if>
	            <li><a href="#">고객센터</a></li>
	            <li><button class="btn_write">글쓰기
	                    <i class="fa-solid fa-chevron-down"></i>
	                </button></li>
	        </ul>
	    </div>
	    <!--[e]서브 영역 -->
	    <!--[s]글쓰기 하위메뉴 영역 -->
	    <div class="btn_write_sub" hidden>
	        <a class="a_btn_write" href="recipe/insert.html">
	            <div class="btn_write_icon">
	                <i class="fa-solid fa-book"></i>
	            </div>
	            <div class="btn_write_txt">
	                <div class="btn_write_t">레시피 글쓰기</div>
	                <div class="btn_write_c">나만의 레시피를 공유해보세요.</div>
	            </div>
	        </a>
	        <a class="a_btn_write" href="board/notice_write.html">
	            <div class="btn_write_icon">
	                <i class="fa-solid fa-clipboard-list"></i>
	            </div>
	            <div class="btn_write_txt">
	                <div class="btn_write_t">자유게시판 글쓰기</div>
	                <div class="btn_write_c">레시피몰의 회원들과 자유롭게 이야기를 나눠보세요.</div>
	            </div>
	        </a>
	        <a class="a_btn_write" href="">
	            <div class="btn_write_icon">
	                <i class="fa-regular fa-thumbs-up"></i>
	            </div>
	            <div class="btn_write_txt">
	                <div class="btn_write_t">상품 리뷰하기</div>
	                <div class="btn_write_c">상품 후기를 공유해보세요.</div>
	            </div>
	        </a>
	    </div>
	    <!--[e]글쓰기 하위메뉴 영역 -->
	</div>
	<!-- [e]Header_top 영역 -->

	<div class="textline"></div>
	
	<!-- [s]Header_bottom 영역 -->
	<div class="header_bottom flex_area_rsb">
	    <!--[s]카테고리 영역 -->
	    <div class="flex_area_rsb">
	        <ul class="category">
	            <li><a href="../community/recipe.html" class="a_community">레시피</a></li>
	            <li><a href="../community/best.html" class="a_community">베스트</a></li>
	            <li><a href="../community/free_board.html" class="a_community">자유게시판</a></li>
	        </ul>
	    </div>
	    <!--[e]카테고리 영역 -->
	
	    <!--[s]실시간차트 영역-->
	    <div class="rank">
	        <ul>
	            <li><a href="#">1.레시피</a></li>
	        </ul>
	    </div>
	    <!--[e]실시간차트 영역 -->
	</div>
	<!-- [e]Header_bottom 영역 -->
	   <div class="textline cf"></div>
	</header>
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
                               <li><a href="mypage_main_6_1.html">- 자주하는 질문</a></li>
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