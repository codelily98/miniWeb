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
				<li class="active"><a href="/miniWeb/board/boardform.do?pg=1"><span>커뮤니티</span></a></li>
				<li><a href="#">달력</a></li>
				<li><a href="#">지도</a></li>
			</ul> 
		</div>
	</div>
</div>
<div id="wrap">
	<div id="container">
		      <form id="joinForm">
         <div id="joinwrap">
            <div id="titlewrap">
               <div class="title">
                  <span id="gomain">404</span>
               </div>
            </div>
            <div class="inputwrap">
               <div id="idwrap">
                  <input type="text" id="id" name="id" placeholder="아이디" required="required">
                  <input type="hidden" id="checkid" value="">
               </div>
               <div id="pwdwrap">
                  <input type="password" id="pwd" name="pwd" placeholder="비밀번호" required="required">              
               </div>
               <div id="repwdwrap">
                  <input type="password" id="repwd" name="repwd" placeholder="비밀번호 확인" required="required">
               </div>
               <div id="nicknamewrap">
                  <input type="text" id="nickname" name="nickname" placeholder="닉네임" required="required">
                  <input type="hidden" id="checknick" value="">
               </div> 
               <div id="namewrap">
                  <input type="text" id="name" name="name" placeholder="이름" required="required">
                  <div id="check1" class="check"></div>
               </div>
               <div id="genderwrap">
                  <input type="radio" id="gender1" name="gender" value="M">
                  <label for="gender1">남자</label>
                  <input type="radio" id="gender2" name="gender" value="F">
                  <label for="gender2">여자</label>
               </div>
               <div id="emailwrap">
                  <input type="email" id="email" name="email" placeholder="이메일" required="required">
                  <input type="button" id="emailcheck" name="emailcheck" value="이메일 인증">
               </div>
               <div>
                  <input type="text" id="ckechnum" name="ckechnum" placeholder="인증번호" required="required">
                  <input type="button" id="emailchecknum" value="인증번호 확인">
                  <div id="check2" class="check"></div>
               </div>
               <div id="zipcodewrap">
                  <input type="text" id="zipcode" placeholder="우편번호" name="zipcode">
                  <input type="button" id="zipcodebtn" value="우편번호 검색" onclick="checkPost(); return false;">
               </div>
               <div id="addrwrap1">
                  <input type="text" id="addr1" placeholder="주소" name="addr1">
               </div>
               <div id="addrwrap2">
                  <input type="text" id="addr2" placeholder="상세주소" name="addr2">
               </div>
            </div>
            <div class="btnwrap">
               <input type="button" id="joinbtn" value="회원가입">
               <input type="reset" value="다시작성">
            </div>
         </div>
      </form>
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</body>
</html>