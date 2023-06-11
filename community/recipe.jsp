<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>   
<%
   request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>recipeMall</title>
    <script src="https://kit.fontawesome.com/54880b83c5.js" crossorigin="anonymous"></script>
    <script src="../js/jquery-3.6.4.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="css/recipe_spe.css">
    <link rel="shortcut icon" href="../images/disah_ko.png" />

    <!-- bx슬라이더 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
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
                <li class="main" title="메인페이지로 이동" onclick="location.href='../index.jsp'"></li>
                <li><a href="../index.jsp" class="a_community">커뮤니티</a></li>
                <li><a href="../shopping/shopping_index.jsp" class="a_shopping">쇼핑</a></li>
            </ul>
        </div>
        <!--[e]메인메뉴 영역 -->

        <!--[s]검색 영역 -->
        <form action="" class="search_form">
            <div class="search_area  flex_area_rsb">
                <input id="" name="" type="search" title="검색어 입력" maxlength="255" class="">
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

                <li><a href="#" class="login">로그인</a></li>
                <li><a href="../join.jsp">회원가입</a></li>
                <li><a href="" class="login">고객센터</a></li>
                <li><button class="btn_write">글쓰기
                        <i class="fa-solid fa-chevron-down"></i>
                    </button></li>
            </ul>
        </div>
        <!--[e]서브 영역 -->
        <!--[s]글쓰기 하위메뉴 영역 -->
        <div class="btn_write_sub" hidden>
            <a class="a_btn_write" href="insert.jsp">
                <div class="btn_write_icon">
                    <i class="fa-solid fa-book"></i>
                </div>
                <div class="btn_write_txt">
                    <div class="btn_write_t">레시피 글쓰기</div>
                    <div class="btn_write_c">나만의 레시피를 공유해보세요.</div>
                </div>
            </a>
            <a class="a_btn_write" href="notice_write.jsp">
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
                <li><a href="recipe.jsp" class="a_community">레시피</a></li>
                <li><a href="best.jsp" class="a_community">베스트</a></li>
                <li><a href="free_board.jsp" class="a_community">자유게시판</a></li>
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
     <!-- [s]레시피 등록 내용 영역 -->
        <div class="r_content_area">
            <!-- [s] 좋아요 영역 -->
            <div class="like_area">
                <button class="btn_like">
                    <!-- <i class="fa-solid fa-heart"></i> 눌린 하트 -->
                    <i class="fa-regular fa-heart"></i>
                </button>
                <div class="cnt_like">1</div>
            </div>
        <!-- [e] 좋아요 영역 -->
            <!-- [s]레시피 소개 영역 -->
            <section class="r_info">
                <div class="r_info_img">
                </div>
                <div class="r_info_ex_area">
                        <h1 class="r_info_ex_title">달래장 훈제오리 비빔밥 만들기</h1>
                        <div class="r_info_ex_in" id="recipe_explain">
                            봄 제철 채소인 달래로 만든 양념장은 고소한 오리고기와 잘 어울려요.
                        </div>
                        <div class="r_info_sum flex_area_rsb">
                            <span class="r_in_num">
                                <i class="fa-solid fa-user-group"></i><br>
                                <span>1인분</span>
                            </span>
                            <span class="r_in_time">
                                
                                <i class="fa-solid fa-clock"></i><br>
                                <span>5분이내</span>
                            </span>
                            <span class="r_in_lev">
                                <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><br>
                                <span>초급</span>
                            </span>
                        </div>
                </div>
                <div class="writer_area">
                    <!-- background로 이미지 들어감 -->
                    <span class="writer_img"></span>
                    <span class="writer_id">수은맘</span>
                    <span class="write_date">23.07.07</span>
                    <span class="writer_block">
                        <i class="fa-solid fa-ban"></i>
                        차단하기
                    </span>
                </div>
               
            </section>
            <div class="textline"></div>
            <!-- [e]레시피 소개 영역 -->
            <!-- [s]재료 영역 -->
            <section class="r_ing_area">
                <!-- recipe ingredient container -->
                <div class="r_ing_con">
                    <div class="r_txt">
                        <i class="fa-solid fa-utensils"></i>
                        재료
                    </div>
                    <div class="r_ings ">
                        <ul class="r_ing">
                                <h3 class="ing_t">[재료]</h3>
                                <!-- recipe ingredient content -->
                                <li class="r_ing_c flex_area_rsb">
                                    <span class="r_ing_name">다진마늘</span>
                                    <div class="txt_al_r">
                                        <span  class="r_ing_amount">1작은술</span>
                                        
                                    </div>
                                    
                                </li>
                                <li class="r_ing_c flex_area_rsb">
                                    <span class="r_ing_name">다진마늘</span>
                                    <div class="txt_al_r">
                                        <span class="r_ing_amount">1작은술</span>
                                        
                                    </div>
                                </li>
                                <li class="r_ing_c flex_area_rsb">
                                    <span class="r_ing_name">다진마늘</span>
                                    <div class="txt_al_r">
                                        <span class="r_ing_amount">1작은술</span>
                                        
                                    </div>
                                </li>
                                <li class="r_ing_c flex_area_rsb">
                                    <span class="r_ing_name">다진마늘</span>
                                    <div class="txt_al_r">
                                        <span class="r_ing_amount">1작은술</span>
                                        
                                    </div>
                                </li>
                            </ul>

                            <ul  class="r_ing">
                                <li class="r_ing_c flex_area_rsb">
                                    <h3 class="ing_t">[고기밑간]</h3>
                                    <li class="r_ing_c flex_area_rsb flex_area_rsb">
                                        <span class="r_ing_name">다진마늘</span>
                                        <div class="txt_al_r">
                                            <span  class="r_ing_amount">1작은술</span>
                                        </div>
                                    </li>
                                    <li class="r_ing_c flex_area_rsb">
                                        <span class="r_ing_name">다진마늘</span>
                                        <div class="txt_al_r">
                                            <span class="r_ing_amount">1작은술</span>
                                        </div>
                                    </li>
                                    <li class="r_ing_c flex_area_rsb">
                                        <span class="r_ing_name">다진마늘</span>
                                        <div class="txt_al_r">
                                            <span class="r_ing_amount">1작은술</span>
                                        </div>
                                    </li>
                                    <li class="r_ing_c flex_area_rsb">
                                        <span class="r_ing_name">다진마늘</span>
                                        <div class="txt_al_r">
                                            <span class="r_ing_amount">1작은술</span>
                                        </div>
                                    </li>
                                </li>
                        </ul>
                        <ul class="r_ing">
                            <h3 class="ing_t">[양념]</h3>
                            <li class="r_ing_c flex_area_rsb flex_area_rsb">
                                <span class="r_ing_name">다진마늘</span>
                                <div class="txt_al_r">
                                    <span  class="r_ing_amount">1작은술</span>
                                    
                                </div>
                                
                            </li>
                            <li class="r_ing_c flex_area_rsb">
                                <span class="r_ing_name">다진마늘</span>
                                <div class="txt_al_r">
                                    <span class="r_ing_amount">1작은술</span>
                                    
                                </div>
                            </li>
                            <li class="r_ing_c flex_area_rsb">
                                <span class="r_ing_name">다진마늘</span>
                                <div class="txt_al_r">
                                    <span class="r_ing_amount">1작은술</span>
                                    
                                </div>
                            </li>
                            <li class="r_ing_c flex_area_rsb">
                                <span class="r_ing_name">다진마늘</span>
                                <div class="txt_al_r">
                                    <span class="r_ing_amount">1작은술</span>
                                    
                                </div>
                            </li>
                    </ul>
                    </div>
                </div>
            </section>
            <div class="textline"></div>
            <!-- [e]재료 영역 -->
            
            
            <!-- [s]동영상 영역 -->
            <section class="r_video">
                <div class="r_video_container" >
                    <div class="r_txt">
                        <i class="fa-solid fa-video"></i>
                         동영상
                    </div>
                    <div class="video_area">
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/6xocL617Hrk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                    </div>
                </div>   
            </section>
            <div class="textline videoLine"></div>
            
            <!-- [e]동영상 영역 -->
            
            <!-- [s]순서 영역 -->
            <section class="r_seq">
                <div class="r_txt">
                    <i class="fa-solid fa-kitchen-set"></i>
                    조리순서
                </div>
                <div class="seq_content_area ">
                    <div class="seq_content">
                        <h2 class="seq_num">Step1</h2>
                        <span class="seq_txt">
                            이는 김순기 작가가 올해 새롭게 선보인 6분 48초 분량의 멀티미디어 작품 ‘주석 정원-템플(Stock Garden Temple)’이다. 김 작가는 이 작품을 통해 자본주의적 가치에 의존하는 현대인들의 삶과 그 내면을 극대화시킨다. 우리를 집어삼키며 지우는 숫자들의 질주가, 나를 잊음으로써 나를 찾는 불교의 깨달음과 만나는 역설이 ‘주식 정원-템플’의 아이러니다. 이 둘은 단지 현저한 대조로도 동행하지 못한다는 것이 작업의 울림을 증폭시킨다.
                        </span>
                        <div  class="seq_img">
                            <img src="../images/temp_imgslider.gif" alt="">
                        </div>
                    </div>
                    <div class="seq_content">
                        <h2 class="seq_num">Step2</h2>
                        <span class="seq_txt">음식을 볶아줍니다.</span>
                        <div class="seq_img">
                            <img src="../images/temp_imgslider.gif" alt="">
                        </div>
                    </div>
                    <div class="seq_content">
                        <h2 class="seq_num">Step3</h2>
                        <span class="seq_txt">음식을 볶아줍니다.</span>
                        <div class="seq_img">
                            <img src="../images/temp_imgslider.gif" alt="">
                        </div>
                    </div>
                </div>
                <div class="seq_pho_area ">
                    <div class="r_txt cf">
                        <i class="fa-solid fa-camera-retro"></i>
                        요리 완성 사진
                    </div>
                    <!-- 이미지 슬라이더 영역 -->
                    <div class="seq_phos">
                        <!-- 슬라이더 패널  -->
                        <div class="seq_pho">
                            <img class="seq_slider_img" src="../images/temp_imgslider1.jpg" alt="temp">
                            <img class="seq_slider_img" src="../images/temp_imgslider2.gif" alt="temp">
                            <img class="seq_slider_img" src="../images/temp_imgslider3.gif" alt="temp">
                            <img class="seq_slider_img" src="../images/temp_imgslider.gif" alt="temp">
                        </div>
                    </div>    
                </div>
            </section>
            <div class="textline"></div>
            <!-- [e]순서 영역 -->

            <!-- [s]기타 영역 -->
            <section class="r_ect ">
                <div class="r_txt">
                    <i class="fa-solid fa-triangle-exclamation"></i>
                    팁/주의사항
                </div>
                <p class="r_ect_content">잡채를 볶을 때 센불에 볶지마세요</p>            
            </section>
            <div class="textline"></div>
            <!--[e]기타 영역 -->
        </div>
        <!-- [e]레시피 등록 내용 영역 -->

        <!-- [s]댓글 영역 -->
        <section>
            <div class="r_txt">댓글</div>
        </section>
        <!-- [e]댓글 영역 -->
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
                <ul >
                    <li><a href="#">회사 소개</a></li>
                    <li><a href="#">채용 정보</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#"><strong>개인정보 처리 방침</strong></a></li>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">안전거래센터</a></li>
                </ul>
                <ul >
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
                        서울 종로구 winner@1119.com <span class="icon_2">사업자등록번호 166-3453-34-4431
                            <Strong>사업자정보확인</Strong> <br>
                            통신판매업신고번호 제2023-4-23 서울 종로 - 12045호
                    </address>
                </div>
                    <!--[s]안전거래 영역 -->
                    <div class="save">
                    <img src="#" alt="서비스운영"> <span>레시피몰 서비스 운영</span><br>
                    <span>2021-05-01 ~ 2026-07-09</span>
                    <img src="#" alt="안전거래"> <span>고객님이 현금결재한 금액에 대해<br> 우리은행과
                        채무지급 보증 계약을 체결하여 안전거래를
                        보장 하고 있습니다.</span>
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
                    <a href=""><img src="#" alt="인스타그램"></a>
                    <a href=""><img src="#" alt="페이스북"></a>
                    <a href=""><img src="#" alt="트위터"></a>
                    <a href=""><img src="#" alt="유튜브"></a>
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
            <form action="member.js" method="post">
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
                            <button type="submit" class="green">로그인</button>    
                            <p class="underBar">또는</p>
                            <a id="naverIdLogin_loginButton" class="naver" href="javascript:void(0)">
                                <span>네이버 로그인</span>
                            </a>
                            <a id="kakao-login-btn" class="kakao_login" href="javascript:loginWithKakao()">
                            <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" height="50"
                                alt="카카오 로그인 버튼" />
                            </a>
                            <p id="token-result"></p>
                            <a href="../join.jsp">회원가입</a>
                            <a href="#">계정찾기</a>
                            <a href="#">비밀번호 찾기</a>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
    <script src="../js/login.js"></script>
    <script src="../js/naver_login.js"></script>
    <script src="../js/kakao_login.js"></script>
    <link rel="stylesheet" href="../css/login.css">
    <script src="../js/common.js"></script>
    <script src="js/recipe_spe.js"></script>
</body>
</html>