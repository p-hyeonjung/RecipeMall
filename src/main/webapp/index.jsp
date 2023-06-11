<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
session = request.getSession(false);
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
<title>recipeMall</title>
<script src="https://kit.fontawesome.com/54880b83c5.js" crossorigin="anonymous"></script>
<script src="${contextPath}/js/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/js/jquery-ui.min.js"></script>

<!-- bx슬라이더 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link rel="stylesheet" href="${contextPath}/css/common.css">
<link rel="stylesheet" href="${contextPath}/css/index.css">
<link rel="shortcut icon" href="${contextPath}/images/smalllogo.png" />
</head>
<script type="text/javascript">
function fn_loginCheck() {
	let _id = $('#id').val();
	let _pw = $('#pass').val();
	if (_id == "" || _pw == "") {
		alert('아이디 혹은 비밀번호를 입력해주세요.');
		return;
	} else {
		$.ajax({
			type : "post",
			async : true,
			dataType : "text",
			url : "${contextPath}/loginProc/login",
			data : {
				id : _id,
				pw : _pw
			},
			success : function(data, textStatus) {
				if (data == "true") {
					alert("로그인 성공");
				} else {
					$('.login_check').html('<p>아이디 혹은 비밀번호를 잘못 입력했습니다.</p>').css('color', 'red');
				}
			},
			error : function(data, textStatus, error) {
				alert('오류가 발생했습니다 => ' + error);
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
		<p>
			<a href="#">지금 가입하면 무료배송!
				<button class="banner_btn" onclick="close_div()">
					<i class="fa-solid fa-x"></i>
				</button>
			</a>
		</p>
	</div>
	<!--[e]광고배너 영역 -->

	<!-- [s]Header 영역 -->
	<jsp:include page="/fix/indexHeader.jsp"/>
	<!-- [s]Header 영역 -->

	<!-- [s]main_content 영역 -->
	<div id="main_content">
		<!-- [s]배너이미지+이미지슬라이드 영역 -->
		<section class="main_imageslider flex_area_rsb">
			<div class="fix_banner">
				<a href="#"> <img class="banner_img"
					src="${contextPath}/images/fix_banner_img.jpg" alt="레시피이미지">
					<div class="b_txt_area">
						<div class="b_txt">감자 한박스 뽀개기 가능한 감자요리-☆</div>
						<div class="id_img"></div>
						<span class="id">소은맘</span>
					</div>
				</a>
			</div>
			<div class="img_slide_area">
				<div class="img_slide">
					<img class="slide_img" src="${contextPath}/images/banner_slide1.PNG" alt="슬라이더1">
					<img class="slide_img" src="${contextPath}/images/banner_slide2.PNG" alt="슬라이더2">
					<img class="slide_img" src="${contextPath}/images/banner_slide3.PNG" alt="슬라이더3">
					<img class="slide_img" src="${contextPath}/images/banner_slide4.PNG" alt="슬라이더4">
					<img class="slide_img" src="${contextPath}/images/banner_slide5.PNG" alt="슬라이더5">
				</div>
				<div class="slide_num">1 / 5</div>
			</div>
		</section>
		<!-- [e]배너이미지+이미지슬라이드 영역 -->
		<!-- [s]레시피 바로가기 영역-->
		<section class="direct_recipe">
			<div class="direct_menu_area flex_area_rsb">
				<div class="direct_menu">
					<img src="${contextPath}/images/disah_ko.png" alt="한식">
					<p>한식</p>
				</div>
				<div class="direct_menu">
					<img src="${contextPath}/images/dish_ch.png" alt="중식">
					<p>중식</p>
				</div>
				<div class="direct_menu">
					<img src="${contextPath}/images/dish_us.png" alt="양식">
					<p>양식</p>
				</div>
				<div class="direct_menu">
					<img src="${contextPath}/images/dish_ja.png" alt="일식">
					<p>일식</p>
				</div>
				<div class="direct_menu">
					<img src="${contextPath}/images/dish_bun.png" alt="분식">
					<p>분식</p>
				</div>
				<div class="direct_menu">
					<img src="${contextPath}/images/dish_ba.png" alt="베이커리">
					<p>베이커리</p>
				</div>
			</div>
		</section>
		<!-- [e]레시피 바로가기 영역 -->
		<!-- [s]오늘의 레시피  영역 -->
		<section class="today_recipe ">
			<h1 class="s_title">

				<span class="css_g_color"> <i class="fa-solid fa-quote-left"></i>
					오늘의
				</span> 레시피

			</h1>
			<p class="btn_more">
				<a href="community/recipe.html">더보기</a>
			</p>
			<div class="recipe_content_area flex_area_rsb">
				<div class="recipe_content">
					<div class="r_img_area">
						<img src="" alt="">
					</div>
					<p class="r_title">
						<span class="r_title_c">집구석 레시피</span> 레시피 제목
					</p>
				</div>
				<div class="recipe_content">
					<div class="r_img_area">
						<img src="" alt="">
					</div>
					<p class="r_title">
						<span class="r_title_c">집구석 레시피</span> 레시피 제목
					</p>
				</div>
				<div class="recipe_content">
					<div class="r_img_area">
						<img src="" alt="">
					</div>
					<p class="r_title">
						<span class="r_title_c">집구석 레시피</span> 레시피 제목
					</p>
				</div>
			</div>


		</section>
		<!-- [e]오늘의 레시피 영역 -->
		<!-- [s]자유게시판+광고 영역 -->
		<section class="board_advertise flex_area_rsb">
			<div class="board">
				<h1 class="s_title">
					자유 <span class="css_g_color">게시판 <i
						class="fa-solid fa-clipboard"></i>
				</h1>
				<!-- cf : 예외 클래스 -->
				<p class="btn_more cf">
					<a href="community/free_board.html">더보기</a>
				</p>
				</span>
				<ul class="board_content_area">
					<li class="board_content"><a href="#">HTML의 모든 것을 알려주마
							샘플활용법</a> <time datetime="2013-10-04">2013.10.04</time></li>
					<li class="board_content"><a href="#">W3C 사이트 리뉴얼 소식 및
							공지사항</a> <time datetime="2013-10-04">2013.10.04</time></li>
					<li class="board_content"><a href="#">KWCAG2.0 소식</a> <time
							datetime="2013-10-04">2013.10.04</time></li>
					<li class="board_content"><a href="#">서버 점검으로 인한 사이트
							이용안내입니다.</a> <time datetime="2013-10-04">2013.10.04</time></li>
					<li class="board_content"><a href="#">여러분들이 생각하는 웹 접근성에 대해
							이야기를 나누어 봅시다.</a> <time datetime="2013-10-04">2013.10.04</time></li>
				</ul>

			</div>
			<div class="advertise">
				<img src="" alt=""> <a href="#">광고영역</a>
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
			<p class="btn_more">
				<a href="#">더보기</a>
			</p>
			<h1 class="s_title">
				<span class="css_g_color">베스트</span> 상품
			</h1>
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
	<jsp:include page="/fix/footer.jsp"/>
	<!-- [e]footer 영역 -->
	<!--로그인 영역-->
	<jsp:include page="/fix/login.jsp" />
	<!--로그인 영역-->
	<script src="${contextPath}/js/login.js"></script>
	<script src="${contextPath}/js/naver_login.js"></script>
	<script src="${contextPath}/js/kakao_login.js"></script>
	<link rel="stylesheet" href="${contextPath}/css/login.css">
	<script src="${contextPath}/js/common.js"></script>
	<script src="${contextPath}/js/index.js"></script>
</body>

</html>