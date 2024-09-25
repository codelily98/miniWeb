<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404: 로그인</title>
<link rel="stylesheet" href="../css/loginForm.css">
</head>
<body>
<div id="wrap">
	<div id="loginformwrap">
		<form id="loginForm">
			<div id="loginwrap">
				<div id="titlewrap">
					<div class="title">
						<span id="gomain">404</span>
					</div>
				</div>
				<div class="inputwrap">
					<input type="text" id="id" name="id" placeholder="아이디" required="required">
				</div>
				<div class="inputwrap">
					<input type="password" id="pwd" name="pwd" placeholder="비밀번호" required="required">
				</div>
				<div class="btnwrap">
					<input type="button" value="SIGN IN">
				</div>
				<div class="awrap">
					<a href="">아이디 찾기</a>&nbsp;|&nbsp; 
					<a href="">비밀번호 찾기</a>&nbsp;|&nbsp; 
					<a href="../member/joinForm.do">회원가입</a>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/loginForm.js"></script>
</body>
</html>