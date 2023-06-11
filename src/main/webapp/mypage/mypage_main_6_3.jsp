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
<script src="https://kit.fontawesome.com/54880b83c5.js"
	crossorigin="anonymous"></script>
<script src="${contextPath}/js/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/js/jquery-ui.min.js"></script>
<script src="${contextPath}/mypage/js/mypage.js"></script>
<link rel="stylesheet" href="${contextPath}/mypage/css/mypage.css">
<link rel="stylesheet"
	href="${contextPath}/mypage/css/mypage_common.css">
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
				<h3 class="menu_title">고객센터</h3>
				<div class="cs_center"></div>
				<div class="notice_area">
					<h2 class="notice_title">공지사항</h2>
				</div>
				<div class="notice_content">
					<div class="notice_list">
						<div class="top">
							<div class="num">번호</div>
							<div class="title">제목</div>
							<div class="date">작성일</div>
						</div>
						<div>
							<div class="num">7</div>
							<div class="title">
								<a href="view.html">가</a>
							</div>
							<div class="date">2023-5-17</div>
						</div>
						<div>
							<div class="num">6</div>
							<div class="title">
								<a href="view.html">나</a>
							</div>
							<div class="date">2023-5-17</div>
						</div>
						<div>
							<div class="num">5</div>
							<div class="title">
								<a href="view.html">다</a>
							</div>
							<div class="date">2023-5-17</div>
						</div>
						<div>
							<div class="num">4</div>
							<div class="title">
								<a href="view.html">라</a>
							</div>
							<div class="date">2023-5-17</div>
						</div>
						<div>
							<div class="num">3</div>
							<div class="title">
								<a href="view.html">마</a>
							</div>
							<div class="date">2023-5-17</div>
						</div>
						<div>
							<div class="num">2</div>
							<div class="title">
								<a href="view.html">바</a>
							</div>
							<div class="date">2023-5-17</div>
						</div>
						<div>
							<div class="num">1</div>
							<div class="title">
								<a href="view.html">사</a>
							</div>
							<div class="date">2023-5-17</div>
						</div>
					</div>
					<div class="pagnation_area">
						<ul class="pagnation">
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
						</ul>
					</div>

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
	<div id="modal">
		<div class="loginArea">
			<form action="member.js" method="post">
				<fieldset>
					<legend>입력 칸</legend>
					<div class="loginbox">
						<p>
							<label for="id"></label> <input type="text" id="id" name="id"
								placeholder="아이디" required>
						</p>
						<p>
							<label for="pass"></label> <input type="password" id="pxass"
								name="pass" placeholder="비밀번호" required>
						</p>
						<label for="login" class="loggin"><input type="checkbox"
							name="login" id="login"><span>로그인 상태 유지</span></label>
						<button type="submit" class="green">로그인</button>
						<p class="underBar">또는</p>
						<a id="naverIdLogin_loginButton" class="naver"
							href="javascript:void(0)"> <span>네이버 로그인</span>
						</a> <a id="kakao-login-btn" class="kakao_login"
							href="javascript:loginWithKakao()"> <img
							src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
							width="222" height="50" alt="카카오 로그인 버튼" />
						</a>
						<p id="token-result"></p>
						<a href="../join.html">회원가입</a> <a href="#">계정찾기</a> <a href="#">비밀번호
							찾기</a>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<script src="../js/login.js"></script>
	<script src="../js/naver_login.js"></script>
	<script src="../js/kakao_login.js"></script>
	<link rel="stylesheet" href="../css/login.css">
	<link rel="stylesheet" href="../js/common.js">

</body>

</html>