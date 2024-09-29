<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404: 달력</title>
<link rel="stylesheet" href="../css/Map_Calender.css">
<script async defer src="https://apis.google.com/js/api.js"></script>
</head>
<body>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<div id="topwrap">
	<div id="header">
		<div id="topawrap">
			<div id="topnav">
			    <c:if test="${empty sessionScope.memId}">
			    <a href="/miniWeb/member/loginForm.do">로그인</a>&nbsp;|
			    </c:if>
			    <c:if test="${not empty sessionScope.memId}">
			    <a href="/miniWeb/member/infoForm.do">회원정보</a>&nbsp;|
			    <a href="/miniWeb/member/loout.do">로그아웃</a>&nbsp;|
				</c:if>
				<a href="/miniWeb/index.do">홈</a>
			</div>
		</div>
		<div id="logowrap">
			<div id="logo">
				<div id="formwrap">
					<div id="searchwrap">
						<span id="gomain" onclick="location.href='../index.do'">404</span>
							<input type="text"id="search" name="search" placeholder="검색할 내용을 입력해주세요">
					</div> 
				</div>
			</div>
		</div>
		<div id="menunav">
			<ul>
				<li><a href="/miniWeb/index.do">메인</a></li>
				<li><a href="https://news.naver.com/section/105">뉴스</a></li>
				<li><a href="/miniWeb/board/boardForm.do?pg=1"><span>커뮤니티</span></a></li>
				<li class="active"><a href="/miniWeb/calender/CalendarForm.do"><span>캘린더</span></a></li>
				<li><a href="/miniWeb/map/mapForm.do">지도</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="wrap">
	<div id="container">
		
	</div>
	<div id="boardcontainer">
		<div class="iframeWrap">
        	<iframe class="Iframe" src="https://calendar.google.com/calendar/u/0/embed?src=aa67f271e2858ca8b241ef5c3657a8400235c3c3d00d0963e53db004a0272453@group.calendar.google.com&ctz=Asia/Seoul" style="border-width:0; border-radius: 10px;" width="900" height="600" frameborder="0" scrolling="no"></iframe>
    	</div>
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/boardForm.js"></script>
<script type="text/javascript" src="../js/search.js"></script>
</body>
</html>