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
    <link rel="stylesheet" href="css/recipe_insert.css">
    <link rel="shortcut icon" href="images/smalllogo.png" />
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
        <h1 class="t_area">
            레시피 등록
            <i class="fa-solid fa-pen-to-square"></i>
        </h1>
        <!-- [s]레시피 등록 내용 영역 -->
        <form action="${contextPath}/community/insert.do" method="post" enctype="multipart/form-data">
            <div class="r_content_area">
                <!-- [s]레시피 소개 영역 -->
                <section class="r_info">
                    <div class="r_txt">레시피 제목</div>
                    <textarea type="text" name="title" placeholder="예)김치찌개 끓이기"></textarea>
                    <div class="r_in_photo ">
                        <label for="rec_file">
                            <div class="file_upload_btn">
                                요리 대표사진을 등록해주세요 <br>
                                <i class="fa-solid fa-image"></i>
                            </div>
                        </label>
                        <input type="file" data-ax-path="file" name="rec_file" id="rec_file" multiple="multiple">  
                    </div>
                    <div class="r_txt">요리 소개</div>
                    <textarea type="text" name="intro" placeholder="이 레시피에 관련된 소개를 적어주세요"></textarea>
                    <div class="r_txt">동영상</div>
                    <textarea type="text" name="link" class="video cf" placeholder="레시피와 관련된 youtube 동영상이 있을 시 링크를 입력해주세요"></textarea>
                    <div class="r_in_video">
                        동영상 썸네일<br>
                        <i class="fa-solid fa-video"></i>   
                    </div>
                    <div class="r_txt">카테고리</div>
                    <select name="cate" id="r_in_category">
                        <option value="ko">한식</option>
                        <option value="ch">중식</option>
                        <option value="us">양식</option>
                        <option value="ja">일식</option>
                        <option value="bun">분식</option>
                        <option value="ba">베이커리</option>
                    </select>
                    <div class="r_txt cf">요리정보</div>
                    <div class="r_in_num">
                        <span class="r_info_txt">인원</span>
                        <select name="serv" id="r_in_num">
                            <option value="num1">1인분</option>
                            <option value="num2">2인분</option>
                            <option value="num3">3인분</option>
                            <option value="num4">4인분 이상</option>
                        </select>
                    </div>
                    <div class="r_in_time">
                        <span class="r_info_txt">시간</span>
	                    <select name="time" id="r_in_time">
	                        <option value="5m">5분</option>
	                        <option value="10m">10분</option>
	                        <option value="20m">20분</option>
	                        <option value="30m">30분</option>
	                        <option value="1h">1시간</option>
	                        <option value="2h">2시간 이상</option>
	                    </select>
                    </div>
                    <div class="r_in_lev">
                        <span class="r_info_txt">난이도</span>
                        <select name="diff" id="r_in_lev">
                        <option value="lev1">아무나</option>
                        <option value="lev2">초급</option>
                        <option value="lev3">중급</option>
                        <option value="lev4">고수</option>
                    </select>
                    </div>
                </section>
                <div class="textline"></div>
                <!-- [e]레시피 소개 영역 -->

                <!-- [s]재료 영역 -->
                <section class="r_ing_container ">
                    <div class="r_ing flex_area_rsb">
                        <div class="r_txt">재료등록</div>
                        <div class="ing_category">
                            <input name="matetype" type="text" placeholder="재료"><br>
                            <button type="button" class="btn_ing_del_all">
                                <i class="fa-solid fa-xmark"></i>
                                묶음삭제
                            </button>
                        </div>
                        <div class="r_ing_content">
                            <div class="ing_name_amount">
                                <div class="ing_input_area">
                                    <input name="mate_name" type="text" placeholder="예)돼지고기">
                                    <input name="mate_amount" type="text" placeholder="예)300g">  
                                </div>
                                
                                
                                <div class="ing_input_area">
                                    <input  name="mate_name" type="text" placeholder="예)양배추">
                                    <input  name="mate_amount" type="text" placeholder="예)1/2개">  
                                    <div class="btn_del">
                                        <button type="button">
                                            <i class="fa-solid fa-circle-xmark"></i>
                                        </button>
                                    </div>
                                </div>
                                
                                <div class="ing_input_area">
                                    <input  name="mate_name" type="text" placeholder="예)참기름">
                                    <input  name="mate_amount" type="text" placeholder="예)1T">
                                    <div class="btn_del">
                                        <button type="button">
                                            <i class="fa-solid fa-circle-xmark"></i>
                                        </button>
                                    </div>
                                </div>
                                
                                <div class="ing_input_area">
                                    <input  name="mate_name" type="text" placeholder="예)소금">
                                    <input  name="mate_amount" type="text" placeholder="예)2t">
                                    <div class="btn_del">
                                        <button type="button" >
                                            <i class="fa-solid fa-circle-xmark"></i>
                                        </button>
                                    </div>
                                </div>
                                

                                <button type="button" name="btn_add" class="btn_add_s">
                                    <i class="fa-solid fa-circle-plus"></i>
                                    추가
                                </button>
                            </div>
                        </div>
                        
                    </div>
                    <div class="r_ing_ex_area">
                        <div class="textline "></div>
                        <p class="r_in_ex">※양념, 양념장, 소스, 드레싱, 토핑, 시럽, 육수, 밑간 등으로 구분해서 작성해주세요.</p>
                        <button type="button" class="btn_add">재료/양념 묶음 추가</button>
                    </div>
                </section>
                <div class="textline"></div>
                <!-- [e]재료 영역 -->
                
                <!-- [s]순서 영역 -->
                <section class="r_seq">
                    <div class="seq_content_area flex_area_rsb">
                        <div class="r_txt ">요리순서</div>
                        <h2>Step1</h2>
                        <textarea name="step_ex" id="step_ex" cols="30" rows="10" placeholder="예)소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요."></textarea>
                        <div class="seq_step_pho seq_step_pho1">
                            <label for="rec_file_step1">
                                <div class="file_upload_btn">
                                    <i class="fa-solid fa-plus"></i>
                                </div>
                            </label>
                            <input type="file" data-ax-path="file" name="rec_file_step1" id="rec_file_step1" multiple="multiple"> 
                        </div>
                    </div>
                    <div class="btn_add_area">
                        <button type="button" class="btn_add">순서 추가</button>
                    </div>
                    <div class="seq_pho_area flex_area_rsb">
                        <div class="r_txt">요리 완성 사진
                            <p class="r_seq_ex" >※완성 사진은 최대 4장까지 업로드 하실 수 있습니다.</p>
                        </div>
                        <div class="seq_phos">
                            <div class="seq_pho">
                                <label for="rec_file_com">
                                    <div class="file_upload_btn">
                                        <i class="fa-solid fa-plus"></i>
                                    </div>
                                </label>
                                <input type="file" data-ax-path="file" name="rec_file_com" id="rec_file_com" multiple="multiple">  
                            </div>
                            <div class="seq_pho">
                                <label for="rec_file_com">
                                    <div class="file_upload_btn">
                                        
                                        <i class="fa-solid fa-plus"></i>
                                    </div>
                                </label>
                                <input type="file" data-ax-path="file" name="rec_file_com" id="rec_file_com" multiple="multiple">  
                            </div>
                            <div class="seq_pho">
                                <label for="rec_file_com">
                                    <div class="file_upload_btn">
                                        <i class="fa-solid fa-plus"></i>
                                    </div>
                                </label>
                                <input type="file" data-ax-path="file" name="rec_file_com" id="rec_file_com" multiple="multiple">  
                            </div>
                            <div class="seq_pho">
                                <label for="rec_file_com">
                                    <div class="file_upload_btn">
                                        <i class="fa-solid fa-plus"></i>
                                    </div>
                                </label>
                                <input type="file" data-ax-path="file" name="rec_file_com" id="rec_file_com" multiple="multiple">  
                            </div>
                           
                        </div>
                    </div>
                    
                </section>
                <div class="textline"></div>
                <!-- [e]순서 영역 -->

                <!-- [s]기타 영역 -->
                <section class="r_ect flex_area_rsb">
                    <div class="r_txt">요리팁</div>
                    <textarea name="tip" id="" cols="30" rows="10" placeholder="예)고기요리에는 소금보다 설탕을 먼저 넣어야 단맛이 겉돌지 않고 육질이 부드러워요"></textarea>
                </section>
                <div class="textline"></div>
                <!--[e]기타 영역 -->
            
            </div>
        
        
        <!-- [e]레시피 등록 내용 영역 -->

        <!-- [s]버튼 영역 -->
        <section class="btn_r_insert">
            <input class="btn_in" type="submit" value="게시하기">
            <input class="btn_can" type="reset" value="취소">
        </section>
        <!-- [e]버튼 영역 -->
        </form>
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
    <script src="js/insert.js"></script>
</body>
</html>