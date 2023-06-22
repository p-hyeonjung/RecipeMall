<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>   
<%
   request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>recipeMall</title>
    <script src="https://kit.fontawesome.com/54880b83c5.js" crossorigin="anonymous"></script>
   
    <link rel="stylesheet" href="${contextPath}/views/css/common.css">
    <link rel="stylesheet" href="${contextPath}/views/community/css/recipe.css">
    
	<!-- 공통 -->
    <script src="${contextPath}/views/js/jquery-3.6.4.min.js"></script>
    <script src="${contextPath}/views/js/jquery-ui.min.js"></script>
    <script src="${contextPath}/views/js/login.js"></script>
    <script src="${contextPath}/views/js/naver_login.js"></script>
    <script src="${contextPath}/views/js/kakao_login.js"></script>
    <link rel="stylesheet" href="${contextPath}/views/css/login.css">
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
    integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>

</head>

<body>
    <!--[s]전체 컨텐츠 영역  -->
    <!--[s]건너뛰기 링크-->
    <a id="skipNav" href="">본문 바로가기</a>
    <!--[e]건너뛰기 링크-->

    <!-- [s]Header 영역 -->
    <jsp:include page="/views/fix/indexHeader.jsp"/>
    <!-- [s]Header 영역 -->


    <!-- [s]main_content 영역 -->
    <div id="main_content">

        <!-- [s]레시피 바로가기 영역-->
        <section class="direct_recipe">
            <div class="direct_menu_area flex_area_rsb">
                <div class="direct_menu">
                    <img src="${contextPath}/views/images/disah_ko.png" alt="한식">
                    <p>한식</p>
                </div>
                <div class="direct_menu">
                    <img src="${contextPath}/views/images/dish_ch.png" alt="중식">
                    <p>중식</p>
                </div>
                <div class="direct_menu">
                    <img src="${contextPath}/views/images/dish_us.png" alt="양식">
                    <p>양식</p>
                </div>
                <div class="direct_menu">
                    <img src="${contextPath}/views/images/dish_ja.png" alt="일식">
                    <p>일식</p>
                </div>
                <div class="direct_menu">
                    <img src="${contextPath}/views/images/dish_bun.png" alt="분식">
                    <p>분식</p>
                </div>
                <div class="direct_menu">
                    <img src="${contextPath}/views/images/dish_ba.png" alt="베이커리">
                    <p>베이커리</p>
                </div>
            </div>
        </section>
        <!-- [e]레시피 바로가기 영역 -->

        <!-- [s]레시피 검색 영역 -->
        <section class="r_search_area ">
            <form action="">
                <fieldset class="flex_area_rsb">
                    <div class="select_searchbox flex_area_rsb">
                        <select name="" id="">
                            <option value="">제목</option>
                            <option value="">셰프</option>
                        </select>
                        <div class="r_input_btn flex_area_rsb">
                            <input id="" name="" type="search" title="검색어 입력" maxlength="255" class="">
                            <div class="r_btn_search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                        </div>
                    </div>
                    <div class="btn_category_area">
                        <button>최신순</button>
                        <button>좋아요순</button>
                    </div>
                </fieldset>
            </form>
        </section>
        <!-- [e]레시피 검색 영역 -->


        <!-- [s]레시피 리스트 영역 -->
        <section class="r_list">
            <ul class="r_content_area flex_area_rsb">
                <li class="r_content">
                    <div class="r_thumb">
                    </div>
                    <div class="r_title_area">
                        <p class="r_title">글 제목</p>
                        <div class="cnt_like_area">
                            <span class="cnt_like">좋아요 수 </span>
                            <i class="fa-regular fa-heart"></i>
                        </div>
                        <p class="r_id">닉네임</p>
                    </div>
                </li>
                <li class="r_content">
                    <div class="r_thumb">
                    </div>
                    <div class="r_title_area">
                        <p class="r_title">글 제목</p>
                        <div class="cnt_like_area">
                            <span class="cnt_like">좋아요 수 </span>
                            <i class="fa-regular fa-heart"></i>
                        </div>
                        <p class="r_id">닉네임</p>
                    </div>
                </li>
                <li class="r_content">
                    <div class="r_thumb">
                    </div>
                    <div class="r_title_area">
                        <p class="r_title">글 제목</p>
                        <div class="cnt_like_area">
                            <span class="cnt_like">좋아요 수 </span>
                            <i class="fa-regular fa-heart"></i>
                        </div>
                        <p class="r_id">닉네임</p>
                    </div>
                </li>
                <li class="r_content">
                    <div class="r_thumb">
                    </div>
                    <div class="r_title_area">
                        <p class="r_title">글 제목</p>
                        <div class="cnt_like_area">
                            <span class="cnt_like">좋아요 수&nbsp;</span>
                            <i class="fa-regular fa-heart"></i> &nbsp;&nbsp;&nbsp;
                        </div>
                        <p class="r_id">닉네임</p>
                    </div>
                </li>
            </ul>
            <div class="pagnation_area">
                <ul class="pagnation">
                    <li>
                        <a href="#">1</a>
                    </li>
                    <li>
                        <a href="#">2</a>
                    </li>
                </ul>
            </div>
        </section>

        <!-- [e]레시피 리스트 영역 -->

    </div>
    <!-- [e]main_content 영역 -->
    <!-- [s]footer 영역 -->
    <jsp:include page="/views/fix/footer.jsp"/>
    <!-- [e]footer 영역 -->
  
    <script src="${contextPath}/views/js/common.js"></script>
    <script src="${contextPath}/views/community/js/recipe.js"></script>
</body>

</html>