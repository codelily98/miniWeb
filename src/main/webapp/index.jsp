<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>404: 메인</title>
<link rel="stylesheet" href="./css/index.css">
</head>
<body>
<div id="topwrap">
	<div id="topnav">
		<ul>
			<li><a href="./index.do">홈</a></li>
			<li><a href="./member/loginForm.do" id="loginlink">로그인</a></li>			
		</ul>
	</div>
</div>
<div id="wrap">
	<div id="header">
		<div id="logowrap">
			<h1 id="gomain">404</h1>
		</div>
	</div>
	<div id="container">
		<div id="section">
			<div id="formwrap">
				<input type="text" id="search" name="search" placeholder="검색할 내용을 입력해주세요"> 
			</div>
			<div id="menulist">
				<ul>
					<li><div class="menuli">
						<a class="awrap" href="./member/loginForm.do">
							<div class="imgwrap">
								<img class="menuliimg" src="./image/login.png" alt="로그인">
							</div>
							<div class="menuliname">
								<span>로그인</span>
							</div>					
						</a>
					</div></li>
					<li><div class="menuli">
						<a class="awrap" href="">
							<div class="imgwrap">
								<img class="menuliimg" src="./image/newsicon.png" alt="뉴스">
							</div>
							<div class="menuliname">
								<span>뉴스</span>
							</div>					
						</a>
					</div></li>
					<li><div class="menuli">
						<a class="awrap" href="./board/boardForm.do?pg=1">
							<div class="imgwrap">
								<img class="menuliimg" src="./image/community.png" alt="커뮤니티">
							</div>
							<div class="menuliname">
								<span>커뮤니티</span>
							</div>					
						</a>
					</div></li>
					<li><div class="menuli">
						<a class="awrap" href="">
							<div class="imgwrap">
								<img class="menuliimg" src="./image/calender.png" alt="달력">
							</div>
							<div class="menuliname">
								<span>달력</span>
							</div>					
						</a>
					</div></li>
					<li><div class="menuli">
						<a class="awrap" href="">
							<div class="imgwrap">
								<img class="menuliimg" src="./image/map.png" alt="지도">
							</div>
							<div class="menuliname">
								<span>지도</span>
							</div>					
						</a>
					</div></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="./js/index.js"></script>
</body>
</html>