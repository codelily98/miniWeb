<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404: 회원가입</title>
<link rel="stylesheet" href="../css/joinForm.css">
</head>
<body>
<div id="wrap">
   <div id="joinformwrap">
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
                  <input type="hidden" id="authCode" name="authCode">
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/joinForm.js">
</script>
</body>
</html>