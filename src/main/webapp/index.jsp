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
    <title>recipeMall</title>
    <script src="https://kit.fontawesome.com/54880b83c5.js" crossorigin="anonymous"></script>
    <script src="js/jquery-3.6.4.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>

    <!-- bx슬라이더 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="shortcut icon" href="images/smalllogo.png" />
</head>
<script type="text/javascript">
function fn_loginCheck() {
	let _id=$('#id').val();
	let _pw=$('#pass').val();
	if(_id == "" || _pw == "") {
			alert('아이디 혹은 비밀번호를 입력해주세요.');
			return;
	} else {
		$.ajax({
			type: "post",
			async: true,
			dataType: "text",
			url: "${contextPath}/loginProc/login",
			data: {id:_id, pw:_pw},
			success: function(data, textStatus) {
				if(data=="true") {
					alert("로그인 성공");
				} else {
					$('.login_check').html('<p>아이디 혹은 비밀번호를 잘못 입력했습니다.</p>').css('color','red');
				}
			},
			error: function(data, textStatus, error) {
				alert('오류가 발생했습니다 => '+error);
			}
		});
	}
}
</script>
<body>
    <!--[s]전체 컨텐츠 영역  -->
    <!--[s]건너뛰기 링크-->
    <a id="skipNav" href="">본문 바로가기</a>
    <!--[e]건너뛰기 링크-->


    <!-- [s]광고배너 영역 -->
    <div class="adbanner">
        <p><a href="#">지금 가입하면 무료배송!<button class="banner_btn" onclick="close_div()"><i
                        class="fa-solid fa-x"></i></button></a></p>
    </div>
    <!--[e]광고배너 영역 -->


    <!-- [s]Header 영역 -->
    <header>
        <!-- [s]Header_top 영역 -->
        <div class="header_top flex_area_rsb">
            <!--[s]메인메뉴 영역 -->
            <div>
                <ul class="mainmenu flex_area_rsb">
                    <li class="main" title="메인페이지로 이동" onclick="location.href='index.html'"></li>
                    <li><a href="index.html" class="a_community">커뮤니티</a></li>
                    <li><a href="shopping/shopping_index.html" class="a_shopping">쇼핑</a></li>
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
						<li><a href="">${log_id}님</a></li>
	                    <li><a href="${contextPath}/loginProc/logout" class="logout">로그아웃</a></li>
					</c:if>
					<c:if test="${isLogon != true}">
	                    <li><a href="#" class="login">로그인</a></li>
	                    <li><a href="join.html">회원가입</a></li>
					</c:if>
                    <li><a href="" class="login">고객센터</a></li>
                    <li><button class="btn_write">글쓰기
                            <i class="fa-solid fa-chevron-down"></i>
                        </button></li>
                </ul>
            </div>
            <!--[e]서브 영역 -->
            <!--[s]글쓰기 하위메뉴 영역 -->
            <div class="btn_write_sub" hidden>
                <a class="a_btn_write" href="community/insert.html">
                    <div class="btn_write_icon">
                        <i class="fa-solid fa-book"></i>
                    </div>
                    <div class="btn_write_txt">
                        <div class="btn_write_t">레시피 글쓰기</div>
                        <div class="btn_write_c">나만의 레시피를 공유해보세요.</div>
                    </div>
                </a>
                <a class="a_btn_write" href="community/notice_write.html">
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
                    <li><a href="community/recipe.html" class="a_community">레시피</a></li>
                    <li><a href="community/best.html" class="a_community">베스트</a></li>
                    <li><a href="community/free_board.html" class="a_community">자유게시판</a></li>
                </ul>
            </div>
            <!--[e]카테고리 영역 -->

            <!--[s]실시간차트 영역-->
            <div class="block">
                <ul id="rank">
                    <li><a href="#">1 <i class="fa-solid fa-caret-up"></i> 레시피</a></li>
                    <li><a href="#">2 <i class="fa-solid fa-caret-up"></i> 베스트</a></li>
                    <li><a href="#">3 <i class="fa-solid fa-caret-up"></i> 쇼핑</a></li>
                    <li><a href="#">4 <i class="fa-solid fa-caret-up"></i> 자유게시판</a></li>
                </ul>
            </div>
            <!--[e]실시간차트 영역 -->
        </div>
        <!-- [e]Header_bottom 영역 -->
        <div class="textline cf"></div>
    </header>
    <!-- [s]Header 영역 -->



    <!-- [s]main_content 영역 -->
    <div id="main_content">
        <!-- [s]배너이미지+이미지슬라이드 영역 -->
        <section class="main_imageslider flex_area_rsb">
            <div class="fix_banner">
                <a href="#">
                    <img class="banner_img" src="images/fix_banner_img.jpg" alt="레시피이미지">
                    <div class="b_txt_area">
                        <div class="b_txt">감자 한박스 뽀개기 가능한 감자요리-☆</div>
                        <div class="id_img"></div>
                        <span class="id">소은맘</span>
                    </div>
                </a>
            </div>
            <div class="img_slide_area">
                <div class="img_slide">
                    <img class="slide_img" src="images/banner_slide1.PNG" alt="슬라이더1">
                    <img class="slide_img" src="images/banner_slide2.PNG" alt="슬라이더2">
                    <img class="slide_img" src="images/banner_slide3.PNG" alt="슬라이더3">
                    <img class="slide_img" src="images/banner_slide4.PNG" alt="슬라이더4">
                    <img class="slide_img" src="images/banner_slide5.PNG" alt="슬라이더5">
                </div>
                <div class="slide_num">1 / 5</div>
            </div>
        </section> 
        <!-- [e]배너이미지+이미지슬라이드 영역 -->
        <!-- [s]레시피 바로가기 영역-->
        <section class="direct_recipe">
            <div class="direct_menu_area flex_area_rsb">
                <div class="direct_menu">
                    <img src="images/disah_ko.png" alt="한식">
                    <p>한식</p>
                </div>
                <div class="direct_menu">
                    <img src="images/dish_ch.png" alt="중식">
                    <p>중식</p>
                </div>
                <div class="direct_menu">
                    <img src="images/dish_us.png" alt="양식">
                    <p>양식</p>
                </div>
                <div class="direct_menu">
                    <img src="images/dish_ja.png" alt="일식">
                    <p>일식</p>
                </div>
                <div class="direct_menu">
                    <img src="images/dish_bun.png" alt="분식">
                    <p>분식</p>
                </div>
                <div class="direct_menu">
                    <img src="images/dish_ba.png" alt="베이커리">
                    <p>베이커리</p>
                </div>
            </div>
        </section>
        <!-- [e]레시피 바로가기 영역 -->
        <!-- [s]오늘의 레시피  영역 -->
        <section class="today_recipe ">
            <h1 class="s_title">

                <span class="css_g_color">
                    <i class="fa-solid fa-quote-left"></i>
                    오늘의</span> 레시피

            </h1>
            <p class="btn_more"><a href="community/recipe.html">더보기</a></p>
            <div class="recipe_content_area flex_area_rsb">
                <div class="recipe_content">
                    <div class="r_img_area">
                        <img src="" alt="">
                    </div>
                    <p class="r_title">
                        <span class="r_title_c">집구석 레시피</span>
                        레시피 제목
                    </p>
                </div>
                <div class="recipe_content">
                    <div class="r_img_area">
                        <img src="" alt="">
                    </div>
                    <p class="r_title">
                        <span class="r_title_c">집구석 레시피</span>
                        레시피 제목
                    </p>
                </div>
                <div class="recipe_content">
                    <div class="r_img_area">
                        <img src="" alt="">
                    </div>
                    <p class="r_title">
                        <span class="r_title_c">집구석 레시피</span>
                        레시피 제목
                    </p>
                </div>
            </div>


        </section>
        <!-- [e]오늘의 레시피 영역 -->
        <!-- [s]자유게시판+광고 영역 -->
        <section class="board_advertise flex_area_rsb">
            <div class="board">
                <h1 class="s_title">
                    자유 <span class="css_g_color">게시판
                        <i class="fa-solid fa-clipboard"></i>
                </h1>
                <!-- cf : 예외 클래스 -->
                <p class="btn_more cf"><a href="community/free_board.html">더보기</a></p>
                </span>
                <ul class="board_content_area">
                    <li class="board_content">
                        <a href="#">HTML의 모든 것을 알려주마 샘플활용법</a>
                        <time datetime="2013-10-04">2013.10.04</time>
                    </li>
                    <li class="board_content">
                        <a href="#">W3C 사이트 리뉴얼 소식 및 공지사항</a>
                        <time datetime="2013-10-04">2013.10.04</time>
                    </li>
                    <li class="board_content">
                        <a href="#">KWCAG2.0 소식</a>
                        <time datetime="2013-10-04">2013.10.04</time>
                    </li>
                    <li class="board_content">
                        <a href="#">서버 점검으로 인한 사이트 이용안내입니다.</a>
                        <time datetime="2013-10-04">2013.10.04</time>
                    </li>
                    <li class="board_content">
                        <a href="#">여러분들이 생각하는 웹 접근성에 대해 이야기를 나누어 봅시다.</a>
                        <time datetime="2013-10-04">2013.10.04</time>
                    </li>
                </ul>

            </div>
            <div class="advertise">
                <img src="" alt="">
                <a href="#">광고영역</a>
            </div>
        </section>
        <!-- [e]자유게시판+광고 영역 -->
        <!-- [s]인기레시피 영역 -->
        <section class="ranking">
            <h1 class="s_title">
                <i class="fa-solid fa-medal"></i>
                <!-- <i class="fa-solid fa-ranking-star"></i> -->
                인기 레시피 <span class="css_g_color">BEST 5 </span>

            </h1>
            <div class="rank_recipe_content_area flex_area_rsb">
                <div class="rank_recipe_content">
                    <img src="" alt="">
                </div>
                <div class="rank_recipe_content">
                    <img src="" alt="">
                </div>
                <div class="rank_recipe_content">
                    <img src="" alt="">
                </div>
                <div class="rank_recipe_content">
                    <img src="" alt="">
                </div>
                <div class="rank_recipe_content">
                    <img src="" alt="">
                </div>
            </div>
        </section>
        <!-- [e]인기레시피영역 -->
        <!-- [s]베스트 상품 영역 -->
        <section class="best_product">
            <p class="btn_more"><a href="#">더보기</a></p>
            <h1 class="s_title"><span class="css_g_color">베스트</span> 상품</h1>
            <div class="btn_product_category_area">
                <button class="btn_clk">전체</button>
                <button>채소/과일</button>
                <button>정육</button>
                <button>해산물</button>
                <button>면/양념</button>
                <button>베이커리</button>
                <button>기타</button>
            </div>
            <div class="best_product_content_area cate1  flex_area_rsb ">
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
            </div>
            <div class="best_product_content_area cate2  flex_area_rsb ">
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
            </div>
            <div class="best_product_content_area cate3   flex_area_rsb ">
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
            </div>
            <div class="best_product_content_area cate4  flex_area_rsb ">
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
            </div>
            <div class="best_product_content_area cate5  flex_area_rsb ">
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
            </div>
            <div class="best_product_content_area cate6  flex_area_rsb ">
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
            </div>
            <div class="best_product_content_area cate7  flex_area_rsb ">
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
                <div class="best_product_content">
                    <div class="best_product_content_img">
                        <img src="" alt="">
                    </div>

                    <div class="best_product_content_txt">
                        <p>제품회사명</p>
                        <h2>간단한 제품소개 + 제품명</h2>
                        <h3>제품가격</h3>
                        <p>★4.9 리뷰 24,123</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- [e]베스트 상품 영역 -->

    </div>
    <!-- [e]main_content 영역 -->
    <!-- [s]footer 영역 -->
    <footer>
        <!--[s]푸터 컨테이너 영역 -->
        <div class="f_container flex_area_rsb">
            <!--[s] footer left & 안내 영역 -->
            <div class="information f_left">
                <p class="infor"><a href="#">고객센터</a></p>
                <p class="infor">1670-0876</p>
                <span>09:00 ~ 16:00</span>
                <p class="inquiry">평일:전체 문의 상담 가능</p>
                <p class="inquiry">주말,공휴일:영업종료</p>
                <p class="kakao">카톡 상담(평일) 09:00 ~ 16:00</p>
                <button class="emailbtn" onclick="">이메일문의</button>
            </div>
            <!--[e]footer left & 안내 영역-->
            <!--[s]footer middle & 회사 소개 영역-->
            <div class="company_introduction1 f_middle flex_area_rsb">
                <ul>
                    <li><a href="#">회사 소개</a></li>
                    <li><a href="#">채용 정보</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#"><strong>개인정보 처리 방침</strong></a></li>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">안전거래센터</a></li>
                </ul>
                <ul>
                    <li><a href="#">입점신청</a></li>
                    <li><a href="#">제휴/광고 문의</a></li>
                    <li><a href="#">사업자구매 회원</a></li>
                    <li><a href="#">파트너 안내</a></li>
                    <li><a href="#">상품광고 소개</a></li>
                    <li><a href="#">고객의 소리</a></li>
                </ul>
            </div>
            <!--[e]footer middle & 회사 소개 영역-->
            <!--[s]footer right 영역-->


            <!--[e]footer right 영역-->
            <div class="f_right">
                <!--[e]회사 소개2 영역 -->
                <div class="company_introduction2">
                    <address>
                        (주)이젠아카데미 <span class="icon_1">공동대표 한끼일동</span><br>
                        서울 종로구 winner@1119.com <span class="icon_2">사업자등록번호 166-3453-34-4431<br>
                            <Strong>사업자정보확인</Strong> <br>
                            통신판매업신고번호 제2023-4-23 서울 종로 - 12045호
                    </address>
                </div>
                <!--[s]안전거래 영역 -->
                <div class="save flex_area_rsb">
                    <div class="save1">
                        <i class="fa-brands fa-servicestack"></i>
                        <span>레시피몰 운영</span><br>
                        <p>2021-05-01 ~ 2026-07-09</p>
                    </div>
                    <div class="save2">
                        <i class="fa-solid fa-helmet-safety"></i><span>고객님이 현금결재한 금액에 대해<br>
                            우리은행과 채무지급 보증 계약을 체결하여 <br> 안전거래를
                            보장 하고 있습니다.</span>
                    </div>


                </div>
                <!--[e]안전거래 영역 -->
                <!--[s]셀러 영역 -->
                <div class="seller">
                    <span>(주)이젠아카데미는 통신판매업중개자로 당사자가 아니므로,<br> 판매자가 등록한 상품정보 및 거래 등에 대해 책임을 지지 않습니다.
                        <br>단 (주)이젠아카데미가 판매자로 등록한 상품은 판매자로서 책임을 부담합니다.</span>
                </div>
                <!--[e]셀러 영역 -->

                <!--[s]소셜네트워크 영역 -->
                <div class="img_icon">
                    <a href="https://www.instagram.com/"><i class="fa-brands fa-instagram"></i></a>
                    <a href="https://www.facebook.com/"><i class="fa-brands fa-facebook"></i></a>
                    <a href="https://twitter.com/"><i class="fa-brands fa-twitter"></i></a>
                    <a href="www.youtube.com"><i class="fa-brands fa-youtube"></i></a>
                </div>
                <!--[e]소셜네트워크 영역 -->

                <!--[s]카피라이터 영역 -->
                <div class="copyright">
                    <p>Copyright 2014. buketplace, Co.,Ltd All rights reserved</p>
                </div>
                <!--[e]카피라이터 영역 -->
            </div>
        </div>
        <!--[e]푸터 컨테이너 영역 -->
    </footer>
    <!-- [e]footer 영역 -->
     <!--로그인 영역-->
     <div id="modal">
        <div class="loginArea">
            <form name="frm_login" method="post">
                <fieldset>
                    <legend>입력 칸</legend>
                    <div class="loginbox">
                            <p>
                                <label for="id"></label>
                                <input type="text" id="id" name="id" placeholder="아이디" required>
                            </p><p>
                                <label for="pass"></label>
                                <input type="password" id="pass" name="pass" placeholder="비밀번호" required>
                            </p>
                            <label for="login" class="loggin"><input type="checkbox" name="login" id="login"><span>로그인 상태 유지</span></label>
                            <div class="login_check"></div>
                            <button type="submit" class="green" onclick="fn_loginCheck()">로그인</button>    
                            <p class="underBar">또는</p>
                            <a id="naverIdLogin_loginButton" class="naver" href="javascript:void(0)">
                                <span>네이버 로그인</span>
                            </a>
                            <a id="kakao-login-btn" class="kakao_login" href="javascript:loginWithKakao()">
                            <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" height="50"
                                alt="카카오 로그인 버튼" />
                            </a>
                            <p id="token-result"></p>
                            <a href="join.html">회원가입</a>
                            <a href="#">계정찾기</a>
                            <a href="#">비밀번호 찾기</a>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
    <script src="js/login.js"></script>
    <script src="js/naver_login.js"></script>
    <script src="js/kakao_login.js"></script>
    <link rel="stylesheet" href="css/login.css">
    <script src="js/common.js"></script>
    <script src="js/index.js"></script>
</body>

</html>