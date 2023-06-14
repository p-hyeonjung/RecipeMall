<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RecipeMall-관리자</title>
    <script src="https://kit.fontawesome.com/fd4a2f2bab.js" crossorigin="anonymous"></script>
    <script src="${contextPath}/views/js/jquery-3.6.4.min.js"></script>
    <script src="${contextPath}/views/js/jquery-ui.min.js"></script>
	<!-- <script src="js/admin.js"></script> -->
	<link rel="stylesheet" href="${contextPath}/views/admin/css/admin.css">
    <link rel="stylesheet" href="${contextPath}/views/admin/css/select.css">
</head>
<body>
    <div id="box">
    <c:choose>
    	<c:when test="${isLogon == true}">
	        <jsp:include page="/views/fix/adminSide.jsp"/>
				<div class="container">
					<div class="new_today new">
						<div class="c_title">
							오늘 올라온 것
						</div>
						<div class="s_box today">
							<ul>
								<li>새 주문</li>
								<li>배송대기</li>
								<li>답변대기 문의</li>
							</ul>
						</div>
					</div>
					<div class="new_inquery new">
						<div class="c_title">
							문의/리뷰
						</div>
						<div class="s_box inq">
							<ul>
								<li>문의1</li>
								<li>리뷰1</li>
								<li>문의2</li>
							</ul>
						</div>
					</div>
					<div class="new_board new">
						<div class="c_title">
							게시판
						</div>
						<div class="s_box post">
							<ul>
								<li>글1</li>
								<li>댓글1</li>
								<li>글2</li>
								<li>댓글2</li>
								<li>글3</li>
								<li>댓글3</li>
							</ul>
						</div>
					</div>
				</div>
	        </div>
    	</c:when>
    	<c:otherwise>
    		<jsp:forward page="/views/admin/adminLogin.jsp"/>
    	</c:otherwise>
    </c:choose>
    </div>
</body>
</html>