<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="css/view.css">
    <link rel="shortcut icon" href="../images/smalllogo.png" />
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

    <div class="free_board_area">
        <!--[s] 자유게시판 타이틀-->
        <div class="title_free_board">
            <h1>자유게시판 <i class="fa-regular fa-pen-to-square"></i></h1>
        </div>
        <div class="title_sub">
            <h4>자유롭게 회원들과 소통합시다</h4>
            <h4>*폭언 욕설은 블랙리스트를 당할 수 있습니다.*</h4>
        </div>
    </div>

    <div class="view_area">
        <div class="title_top">
            <h1>글의 제목</h1>
        </div>
        <div class="more_information">
            <div class="more_area">
                <div class="writer_s">작성자닉네임</div>
                <div class="date">
                    <p>2023-05-17</p>
                </div>
            </div>
            <div class="btn_fow">
                <div class="fal"><button class="fow_btn">+ 팔로우</button></div>
            </div>
        </div>
        <div class="view_area_see">
            <div class="view_article">
                <p>글을 읽는 공간입니다.</p>
            </div>
        </div>
        <div class="Several_area">
            <div class="Several_good">좋아요<span>9</span></div>
            <div class="Several_comment">댓글<span>2</span></div>
            <div class="Several_num">조회<span>33</span></div>
        </div>

        <div class="comment_area">
            <div class="comment_write_area">
                <div class="comment_title_area">
                    <div class="comment_title">
                        <h3>댓글</h3>
                    </div>
                    <div class="btn_area">
                        <button class="recomment1" type="button">
                            <span><a href=""><i class="fa-regular fa-heart"></i></a></span>
                        </button>
                        <button class="recomment2" type="button">
                            <span><a href="free_board.jsp">목록보기</a></span>
                        </button>
                    </div>
                </div>
                <form class="comment_write">
                    <i class="fa-solid fa-user"></i> <input type="text" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :D">
                    <button type="submit" disabled>입력</button><!--text 입력시 disabled해제-->
                </form>
            </div>
            <div class="anser">
                <h3></h3><!--댓글 영역 남겨둠-->
            </div>
        </div>
    </div>

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
    <script src="../js/index.js"></script>
</body>
</html>