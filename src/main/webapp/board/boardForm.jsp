<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404: 커뮤니티</title>
<link rel="stylesheet" href="../css/boardForm.css">
</head>
<body>
<div id="topwrap">
	<div id="topnav">
		<ul>
			<li><a href="../index.do">홈</a></li>
			<li><a href="../member/loginForm.do" id="loginlink">로그인</a></li>			
		</ul>
	</div>
</div>
<div id="wrap">
	<div id="header">
		<div id="logowrap">
			<h1 id="gomain" onclick="location.href='../index.do'">404</h1>
		</div>
	</div>
	<div id="container">
		<div id="section">
			<div id="menulist">
				<ul>
					<li><div class="menuli">
						<a class="awrap" href="../member/loginForm.do">
							<div class="imgwrap">
								<img class="menuliimg" src="../image/peo.png" alt="로그인">
							</div>
							<div class="menuliname">
								<span>로그인</span>
							</div>					
						</a>
					</div></li>
					<li><div class="menuli">
						<a class="awrap" href="">
							<div class="imgwrap">
								<img class="menuliimg" src="../image/news.png" alt="뉴스">
							</div>
							<div class="menuliname">
								<span>뉴스</span>
							</div>					
						</a>
					</div></li>
					<li><div class="menuli">
						<a class="awrap" href="../board/boardForm.do">
							<div class="imgwrap">
								<img class="menuliimg" src="../image/comu.png" alt="커뮤니티">
							</div>
							<div class="menuliname">
								<span>커뮤니티</span>
							</div>					
						</a>
					</div></li>
					<li><div class="menuli">
						<a class="awrap" href="">
							<div class="imgwrap">
								<img class="menuliimg" src="../image/cale.png" alt="달력">
							</div>
							<div class="menuliname">
								<span>달력</span>
							</div>					
						</a>
					</div></li>
					<li><div class="menuli">
						<a class="awrap" href="">
							<div class="imgwrap">
								<img class="menuliimg" src="../image/naver.png" alt="네이버1">
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
	<div id="boardcontainer">
		<div id="boardnav">
			<ul>
				<li>공지사항</li>
				<li>전체글</li>
				<li>인기글</li>
				<li>최신글</li>
			</ul>
		</div>
		<div id="boardlist">
			<div id="listwrap">
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<!-- DB에서 불러와서 입력 -->
						<tr>
							<td>1</td>
							<td>게시물 작성</td>
							<td>admin</td>
							<td>24.09.26 23:55</td>
							<td>5</td>
						</tr>
						<tr>
							<td>2</td>
							<td>디자인이 어려워요</td>
							<td>myid</td>
							<td>24.09.26 23:22</td>
							<td>11</td>
						</tr>
						<tr>
							<td>3</td>
							<td>테스트 작성</td>
							<td>test</td>
							<td>24.09.26 21:32</td>
							<td>24</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div id="footer">
		<div id="section">
			<div id="formwrap">
				<input type="text" id="search" name="search" placeholder="검색할 내용을 입력해주세요"> 
			</div>
		</div>
	</div>
</div>
</body>
</html>