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
    <script src="js/mypage.js"></script>
    <link rel="stylesheet" href="css/mypage.css">
    <link rel="stylesheet" href="css/mypage_common.css">
    <link rel="stylesheet" href="css/mypage_6.css">
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
                              <li><a href="${contextPath}/mypage/service/faq.do">- 자주하는 질문</a></li>
                              <li><a href="mypage_main_6_2.html">- 일대일 문의</a></li>
                              <li><a href="mypage_main_6_3.html">- 공지사항</a></li>
                          </ul>
                      </li>
                  </ul>
              </div>
          </div>
          <!-- sidebar -->
          <!-- mypage_content -->
            <div class="mypage_content">
                <h3 class="menu_title">고객센터</h3>
                <div class="cs_center">
                    <h4>일대일 문의</h4>
                    <div class="one_inquery">
                        <form action="">
                            <table class="inquery_tbl">
                                <caption>일대일 문의</caption>
                                <tbody>
                                    <tr>
                                        <th>분류</th>
                                        <td>
                                            <select>
                                                <option value="">커뮤니티</option>
                                                <option value="">쇼핑</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>제목</th>
                                        <td><input type="text" name="inq_title" id="inq_title"></td>
                                    </tr>
                                    <tr>
                                        <th>이메일</th>
                                        <td>
                                            <input type="email" name="email" id="email">
                                            <input type="checkbox" name="email_comm_ok" id="email_comm_ok">
                                            답변 받기
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>내용</th>
                                        <td>
                                            <textarea name="inq_content" id="inq_content" class="inq_txta" cols="90" rows="20"></textarea>
                                        </td>
                                    </tr>
                                    <tr class="file_area">
                                        <th>파일첨부</th>
                                        <td>
                                            <label for="inq_file">
                                                <div class="file_upload_btn">파일 첨부</div>
                                            </label>
                                            <input type="file" data-ax-path="file" name="inq_file" id="inq_file" multiple="multiple">
                                            <div class="file_list"></div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="subm_btn">
                                <input type="submit" name="" class="inq_btn btn_c" value="문의하기">
                                <input type="button" name="" class="inq_btn cancel" value="취소">
                                <!-- <button class="cancel inq_btn">취소</button> -->
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- mypage_content -->
        </div>
    </div>
    <!-- content_mypage_e -->

    <!-- footer_s -->
    <jsp:include page="/fix/footer.jsp"/>
    <!-- footer_e -->
</body>
</html>