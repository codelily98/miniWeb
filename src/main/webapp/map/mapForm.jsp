<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404: 지도</title>
<link rel="stylesheet" href="../css/Map_Calender.css">
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
				<li><a href="/miniWeb/calender/CalendarForm.do">캘린더</a></li>
				<li class="active"><a href="/miniWeb/map/mapForm.do"><span>지도</span></a></li>
			</ul>
		</div>
	</div>
</div>
<div id="wrap">
	<div id="container">
		
	</div>
	<div id="boardcontainer">
		<div class="iframeWrap">
			<iframe class ="Iframe"
                 src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3168.1234567890!2d127.02857431535217!3d37.49794397982256!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca30b234d41bd%3A0x5d35e0323c1e6cb9!2sGangnam%20Station!5e0!3m2!1sen!2skr!4v1698261838315"
                 width="900"
                 height="600"
                 style="border:0; border-radius: 10px;"
                 allowfullscreen=""
                 loading="lazy">
            </iframe>
		</div>
		<div id="footer">
			
		</div>
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/boardForm.js"></script>
<script type="text/javascript" src="../js/search.js"></script>
</body>
</html>
