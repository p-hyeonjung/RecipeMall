<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
session=request.getSession(false);
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
<title>RecipeMall-마이페이지</title>
<script src="https://kit.fontawesome.com/54880b83c5.js" crossorigin="anonymous"></script>
<script src="${contextPath}/js/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/js/jquery-ui.min.js"></script>
<script src="${contextPath}/mypage/js/mypage.js"></script>
<link rel="stylesheet" href="${contextPath}/mypage/css/mypage.css">
<link rel="stylesheet" href="${contextPath}/mypage/css/mypage_common.css">
<link rel="stylesheet" href="${contextPath}/mypage/css/mypage_6.css">
<link rel="shortcut icon" href="${contextPath}/images/smalllogo.png" />
<script type="text/javascript">
function fn_inqForm() {
	location.href="${contextPath}/mypage/service/inqForm.do?id=${log_id}";
}
</script>
</head>
<body>
	<!--[s]건너뛰기 링크-->
	<a id="skipNav" href="">본문 바로가기</a>
	<!--[e]건너뛰기 링크-->
	<!-- [s]Header 영역 -->
	<!-- [s]Header 영역 -->
	<jsp:include page="/fix/mypageHeader.jsp" />
	<!-- [s]Header 영역 -->
	<!-- [s]Header 영역 -->
	<!-- content_mypage_s -->
	<div id="main_content" class="mypage_box">
		<div id="mypage">
			<h2 class="mypage_title">
				<a href="${contextPath}/mypage/service/main.do?id=${log_id}">마이페이지</a>
			</h2>
			<!-- sidebar -->
			<jsp:include page="/fix/mypageSidebar.jsp"/>
			<!-- sidebar -->
			<!-- mypage_content -->
			<div class="mypage_content">
				<h3 class="menu_title">고객센터</h3>
				<div class="inq_list">
					<div class="inq_select">
						<ul class="inq_s">
							<li>
								<div class="inq_class">
									<ul class="inq_menu">
										<li class="board_all menu_li active"><a class="active_a"
											href="#">전체</a></li>
										<li class="board_community menu_li"><a href="#">커뮤니티</a></li>
										<li class="board_shopping menu_li"><a href="#">쇼핑</a></li>
									</ul>
								</div>
							</li>
							<li>
								<div class="inq_date_s inq_h">
									<ul>
										<li><a href="#">처음</a></li>
										<li><a href="#">최신</a></li>
									</ul>
								</div>
							</li>
							<li>
								<div class="inq_cnt inq_h">
									<select name="" id="">
										<option value="">10개</option>
										<option value="">30개</option>
									</select>
								</div>
							</li>
							<li><button class="inq_view_btn">보기</button></li>
						</ul>
					</div>
					<div class="my_inq_list">
						<table class="inq_list_tb">
							<thead>
								<tr>
									<th>번호</th>
									<th>분류</th>
									<th>제목</th>
									<th>작성일</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
							<c:choose>
								<c:when test="${empty inqueryList}">
									<tr><td colspan="5">등록된 문의가 없습니다.</td></tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="inquery" items="${inqueryList}">
										<tr>
											<td class="inq_n"><a href="#">${inquery.inqNo}</a></td>
											<td id="inq_bd" class="inq_board">
										<c:choose>
											<c:when test="${inquery.inqCate == 1}">
												쇼핑
											</c:when>
											<c:when test="${inquery.inqCate == 2}">
												커뮤니티
											</c:when>
										</c:choose>
											</td>
											<td class="inq_title"><a href="${contextPath}/mypage/service/inqView.do?id=${log_id}&inqNo=${inquery.inqNo}">${inquery.inqTitle}</a></td>
											<td class="inq_date"><a href="#">${inquery.inqDate}</a></td>
											<td class="inq_status">
										<c:choose>
											<c:when test="${inquery.hasRe == 0}">
												답변 대기중
											</c:when>
											<c:when test="${inquery.hasRe == 1}">
												답변 완료
											</c:when>
										</c:choose>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
					</div>
					<button class="inquering btn_c" type="button" onclick="location.href='${contextPath}/mypage/service/inqForm.do';">문의하기</button>
					<div class="paging_box">
						<ul>
							<li><a href="#">&lt;</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">&gt;</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- mypage_content -->
		</div>
	</div>
	<!-- content_mypage_e -->
	<jsp:include page="/fix/login.jsp"/>
	<!-- footer_s -->
	<jsp:include page="/fix/footer.jsp" />
	<!-- footer_e -->
	<script src="${contextPath}/js/login.js"></script>
    <script src="${contextPath}/js/naver_login.js"></script>
    <script src="${contextPath}/js/kakao_login.js"></script>
    <link rel="stylesheet" href="${contextPath}/css/login.css">
</body>
</html>