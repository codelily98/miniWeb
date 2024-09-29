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
         				<a href="#" onclick="delete()">&lt;계정 삭제&gt;</a>
         			</div>
         		</div>
         		<div id="mainwrap">
         			<div id="leftwrap">
         				<div id="profilewrap">
         					<div id="profileimgwrap">
         						<div id="profileImg">
         							<c:if test="${list[0].profile != null}">
										<img class="image" src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-97/upload/${list[0].profile}" alt="${profileName}"/>
									</c:if>
									<c:if test="${list[0].profile == null}">
										<img class="image" src="../image/default.png" alt="default"/>
									</c:if>
         						</div>
         					</div>
         					<div id="profilebtnwrap">
         						<input type="button" value="프로필 변경" id="profileBtn">
         						<input type="file" id="profile" name="profile" style="display:none;">
         					</div>
         				</div>
         				<div id="nicknamewrap">
         					<div id="nicknameView" class="hide1">
         						${list[0].nickname}
         					</div>
         					<div id="nicknameUpdate" class="show1">
         						<input type="text" id="nickname" name="nickname" value="${list[0].nickname}" class="show1"/>
         					</div>
         					<div id="hide1Btn" class="hide1">
         						<input type="button" value="닉네임 변경" id="hideBtn1" class="hide1">
         					</div>
         					<div id="nicknameBtn" class="show1">
         						<input type="button" value="닉네임 변경" id="nickupdateBtn" class="show1">
         						<input type="button" value="뒤로" id="resetBtn" onclick="location.reload()" class="show1">
         					</div>
         				</div>
         			</div>
         			<div id="rightwrap">
         				<div id="memberinfowrap">
         					<div class="infoWrap">
	         					<div id="idwrap" class="infoDiv">
	         						<div id="textDiv">아이디 : ${list[0].id}</div>
	         						<input type="hidden" id="id" name="id" value="${list[0].id}"/>
	         					</div>
	         					<div id="namewrap" class="infoDiv">
	         						<div id="textDiv">이름 : ${list[0].name}</div>
	         						<input type="hidden" id="name" name="name" value="${list[0].name}"/>
	         					</div>
	         					<div id="textDiv" class="infoDiv">
	         						<div id="textDiv" class="hide2">
	         						성별 : <c:if test = "${list[0].gender == 'M'}">남자</c:if><c:if test = "${list[0].gender == 'F'}">여자</c:if>
	         						</div>
	         						<input type="hidden" id="name" name="name" value="${list[0].name}"/>
	         					</div>
	         					<div id="emailwrap" class="infoDiv">
                              	<div id="textDiv" class="hide2">이메일 : ${list[0].email}</div>
									<input type="email" id="email" name="email" value="${list[0].email}" class="show2"/>
									<input type="button" id="emailVertifyBtn" value="인증번호" class="show2"/>
								</div>
								<div id="checkemailwrap" class="infoDiv">
								   <input type="text" id="chechnum" name="chechnum" class="show2"/>
								   <input type="button" id="checkEmailBtn" value="확인" class="show2"/>
								   <input type="hidden" id="authCode">
								</div>
	         					<div id="zipcodewrap" class="infoDiv">
	         						<div id="textDiv" class="hide2">우편번호 : ${list[0].zipcode}</div>
	         						<input type="text" id="zipcode" name="zipcode" value="${list[0].zipcode}" class="show2"/>
	         						<input type="button" id="zipcodeBtn" onclick="checkPost(); return false;" value="우편번호 검색" class="show2"/>
	         					</div>
	         					<div id="addr1wrap" class="infoDiv">
	         						<div id="textDiv" class="hide2">주소 : ${list[0].addr1}</div>
	         						<input type="text" id="addr1" name="addr1" value="${list[0].addr1}" class="show2"/>
	         					</div>
	         					<div id="addr2wrap" class="infoDiv">
	         						<div id="textDiv" class="hide2">상세주소 : ${list[0].addr2}</div>
	         						<input type="text" id="addr2" name="addr2" value="${list[0].addr2}" class="show2"/>
	         					</div>
	         					<div id="checkwrap" class="show2">
	         						<div id="textDiv" id="checkDiv" class="show2"></div>
	         					</div>
         					</div>
         					<div id="middlebtnwrap" class="btnDiv">
         						<input type="button" id="hideBtn2" value="회원정보 수정" class="hide2"/>
         						<input type="button" id="updateBtn" value="회원정보 수정" class="show2"/>
         						<input type="button" id="resetBtn" value="뒤로" onclick="location.reload()" class="show2"/>
         					</div>
         				</div>
         			</div>
         		</div>
         		<div id="bottombtnwrap">
         			<div id="adminGet">
         				<div id="backwrap">
         					<a href="#" onclick="history.back()">&lt;뒤로가기&gt;</a>
         				</div>
         				<div id="adminBtnwrap">
							<input type="text" id="adminCode" class="show3" style="border-color:#bfbfbf;">
							<input type="hidden" id="adminCodeCheck" value="1234">
	                        <a href="#" id="hideandshow" class="hide3">&lt;관리자 권한 신청&gt;</a>
	                        <a href="#" id="abtn" class="show3">&lt;관리자 권한 신청&gt;</a>
	                     </div>
         			</div>
         		</div>
         	</div>
         </div>
      </form>
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/infoForm.js"></script>
<script type="text/javascript" src="../js/search.js"></script>
</body>
</html>