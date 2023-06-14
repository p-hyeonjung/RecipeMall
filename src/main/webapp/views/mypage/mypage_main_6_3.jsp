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
<title>recipeMall</title>
<script src="https://kit.fontawesome.com/54880b83c5.js" crossorigin="anonymous"></script>
<script src="${contextPath}/js/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/js/jquery-ui.min.js"></script>
<script src="${contextPath}/mypage/js/mypage.js"></script>
<link rel="stylesheet" href="${contextPath}/mypage/css/mypage.css">
<link rel="stylesheet" href="${contextPath}/mypage/css/mypage_common.css">
<link rel="stylesheet" href="${contextPath}/mypage/css/mypage_6.css">
<link rel="stylesheet" href="${contextPath}/mypage/css/mypage_6_3.css">
<link rel="shortcut icon" href="${contextPath}/images/smalllogo.png" />
</head>

<body>
	<!--[s]전체 컨텐츠 영역  -->
	<!--[s]건너뛰기 링크-->
	<a id="skipNav" href="">본문 바로가기</a>
	<!--[e]건너뛰기 링크-->
	<!-- [s]Header 영역 -->
	<jsp:include page="/fix/mypageHeader.jsp" />
	<!-- [e]Header 영역 -->

	<!-- [s]main_content 영역 -->
	<div id="main_content" class="mypage_box">
		<!--[s]content_mypage_e -->
		<div id="mypage">
			<h2 class="mypage_title">
				<a href="${contextPath}/mypage/service/main.do?id=${log_id}">마이페이지</a>
			</h2>
			<!-- sidebar -->
			<jsp:include page="/fix/mypageSidebar.jsp" />
			<!-- sidebar -->
			<!--[s]공지사항 영역-->
			<div class="mypage_content">
				<!-- <h3 class="menu_title">고객센터</h3> -->
				<h2 class="notice_title">공지사항</h2>
				<!-- <div class="cs_center"></div> -->
				<div class="notice_content">
					<div class="n_search">
						<form class="search_form" action="">
							<select>
								<option>제목</option>
								<option>내용</option>
								<option>제목+내용</option>
							</select>
							<input type="search" name="search" class="search_in">
							<input type="submit" value="검색" class="search_do">
						</form>
					</div>
					<div class="notice_list">
						<div class="top">
							<div class="num">번호</div>
							<div class="title">제목</div>
							<div class="date">작성일</div>
						</div>
					<c:forEach var="notice" items="${noticeList}">
						<div>
							<div class="num">${notice.noticeNo}</div>
							<div class="title">
								<a href="${contextPath}/mypage/notice/noticeView.do?noticeNo=${notice.noticeNo}">${notice.noticeTitle}</a>
							</div>
							<div class="date">${notice.noticeDate}</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<!--[e]공지사항 영역-->
		</div>
		<!-- [s]content_mypage_e -->
	</div>
	<!-- [e]main_content 영역 -->

	<!-- [s]footer 영역 -->
	<jsp:include page="/fix/footer.jsp" />
	<!-- [e]footer 영역 -->
	<!--로그인 영역-->
	<jsp:include page="/fix/login.jsp"/>
	<!--로그인 영역-->
	
	<script src="${contextPath}/js/login.js"></script>
	<script src="${contextPath}/js/naver_login.js"></script>
	<script src="${contextPath}/js/kakao_login.js"></script>
	<link rel="stylesheet" href="${contextPath}/css/login.css">
	<link rel="stylesheet" href="${contextPath}/js/common.js">
</body>
</html>