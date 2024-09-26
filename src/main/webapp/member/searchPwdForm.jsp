<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>function(){}: searchPwd</title>
<link rel="stylesheet" href="../css/loginForm.css">
</head>
<body>
	<div id="wrap">
		<div id="findpwdForm">
			<div id="titlewrap">
				<div class="title">
					<span>비밀번호 찾기</span>
				</div>
			</div>
			<div class="inputwrap">
				<input type="text" id="id" name="id" placeholder="아이디" required="required">
				<div id="idDiv"></div>
			</div>
			<div class="inputwrap">
				<input type="text" id="name" name="name" placeholder="이름" required="required">
				<div id="nameDiv"></div>
			</div>
			<div class="inputwrap">
				<input type="text" id="email" name="email" placeholder="이메일" required="required">
				<div id="emailDiv"></div>
			</div>
			<div class="inputwrap">
				<input type="text" id="checknumber" name="checknumber" placeholder="인증번호" required="required">
				<div id="checknumberDiv"></div>
			</div>
			<div class="btnwrap">
				<input type="button" id="searchIdBtn" value="인증번호발송">
			</div>
			<div id="result">
				
			</div>
			<div class="awrap">
				<a href="../member/loginForm.do">로그인</a>&nbsp;|&nbsp; 
				<a href="../member/searchIdForm.do">아이디 찾기</a>&nbsp;|&nbsp;
				<a href="../member/joinForm.do">회원가입</a>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/searchPwdForm.js"></script>
</html>