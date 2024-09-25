<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>function(){}: Join</title>
<link rel="stylesheet" href="../css/joinForm.css">
</head>
<body>
<div id="wrap">
	<div id="joinformwrap">
		<form id="joinForm">
			<div id="joinwrap">
				<div id="titlewrap">
					<div class="title">
						<span>회원가입</span>
					</div>
				</div>
				<div class="inputwrap">
					<div id="idwrap">
						<input type="text" id="id" name="id" placeholder="아이디" required="required">					
					</div>
					<div id="pwdwrap">
						<input type="password" id="pwd" name="pwd" placeholder="비밀번호" required="required">						
					</div>
					<div id="repwdwrap">
						<input type="password" id="repwd" name="repwd" placeholder="비밀번호 확인" required="required">
					</div>
					<div id="nicknamewrap">
						<input type="text" id="nickname" name="nickname" placeholder="닉네임" required="required">
					</div> 
					<div id="namewrap">
						<input type="text" id="name" name="name" placeholder="이름" required="required">	
					</div>
					<div id="genderwrap">
						<label for="gender">남자</label>
						<input type="radio" id="gender" name="gender" value="M">
						<label for="gender">여자</label>
						<input type="radio" id="gender" name="gender" value="F">
					</div>
					<div id="emailwrap">
						<input type="email" id="email" name="email" placeholder="이메일" required="required">
						<input type="button" id="emailbtn" value="이메일 인증"> 					
					</div>
					<div id="zipcodewrap">
						<input type="text" id="zipcode" placeholder="우편번호" name="zipcode">
						<input type="button" id="zipcodebtn" value="우편번호 검색">
					</div>
					<div id="addrwrap2">
						<input type="text" id="addr1" placeholder="주소" name="addr1">
					</div>
					<div id="addrwrap2">
						<input type="text" id="addr2" placeholder="상세주소" name="addr2">
					</div>
				</div>
				<div class="btnwrap">
					<input type="button" id="joinbtn" value="회원가입">
					<input type="reset" id="resetbtn" value="다시입력">
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>