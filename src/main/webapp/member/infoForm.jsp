<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>404: 회원정보</title>
<link rel="stylesheet" href="../css/infoForm.css">
</head>
<body>
<c:set var="context" value="${pagecontext.request.contextpath}"/>
<div id="topwrap">
	<div id="header">
		<div id="topawrap">
			<div id="topnav">
				<c:if test="${empty sessionScope.memId}">
			    <a href="/miniWeb/member/loginForm.do">로그인</a>&nbsp;|
			    </c:if>
			    <c:if test="${not empty sessionScope.memId}">
			    <a href="/miniWeb/member/infoForm.do">회원정보</a>&nbsp;|
			    <a href="/miniWeb/member/logout.do">로그아웃</a>&nbsp;|
				</c:if>
				<a href="/miniWeb/index.do">홈</a>
			</div>
		</div>
		<div id="logowrap">
			<div id="logo">
				<div id="formwrap">
					<div id="searchwrap">
						<span id="gomain" onclick="location.href='../index.do'">404</span>
						<input type="text" id="search" name="search" placeholder="검색할 내용을 입력해주세요">
					</div> 
				</div>
			</div>
		</div>
		<div id="menunav">
			<ul>
				<li><a href="/miniWeb/index.do">메인</a></li>
				<li><a href="#">뉴스</a></li>
				<li class="active"><a href="/miniWeb/board/boardForm.do?pg=1"><span>커뮤니티</span></a></li>
				<li><a href="#">달력</a></li>
				<li><a href="#">지도</a></li>
			</ul> 
		</div>
	</div>
</div>
<div id="wrap">
	<div id="container">
      <form id="updateForm">
         <div id="datawrap">
         	<div id="infowrap">
         		<div id="topbtnwrap">
         			<div id="deleteInfo">
         				<a href="#">계정 삭제</a>
         			</div>
         		</div>
         		<div id="mainwrap">
         			<div id="leftwrap">
         				<div id="profilewrap">
         					<div id="profileimg">
         						프로필 이미지 DB에서 불러오기
         					</div>
         					<div id="profilebtnwrap">
         						<input type="button" value="프로필 변경" id="profileBtn">
         					</div>
         				</div>
         				<div id="nicknamewrap">
         					<div id="nicknameView">
         						닉네임 DB에서 불러오기
         					</div>
         					<div id="nicknameUpdate">
         						<!-- 닉네임 수정 버튼 누르면 나타남 -->
         					</div>
         					<div id="nicknameBtn">
         						<input type="button" value="닉네임 변경" id="nicknameBtn">
         					</div>
         				</div>
         			</div>
         			<div id="rightwrap">
         				회원정보 DB에서 불러오기
         			</div>
         		</div>
         		<div id="bottombtnwrap">
         			<div id="adminGet">
         				<a href="#">관리자 권한 신청</a>
         			</div>
         		</div>
         	</div>
         </div>
      </form>
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/infoForm.js"></script>
</body>
</html>