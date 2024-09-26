<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>404:글 쓰기</title>
<link rel="stylesheet" href="../css/boardWriteForm.css">
<!-- 스마트에디터 CSS 파일 로드 -->
<link rel="stylesheet" type="text/css" href="../se2/css/ko_KR/smart_editor2_in.css">
<link rel="stylesheet" type="text/css" href="../se2/css/ko_KR/smart_editor2_out.css">
<link rel="stylesheet" type="text/css" href="../se2/css/ko_KR/smart_editor2.css">
<!-- 필수 자바스크립트 파일 로드 -->
<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
<div id="topwrap">
	<div id="header">
		<div id="topawrap">
			<div id="topnav">
			    <a href="../member/loginForm.do">로그인</a>&nbsp;|
				<a href="../index.do">홈</a>
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
				<li><a href="#">메인</a></li>
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
		
	</div>
	<div id="boardcontainer">
		<div id="boardnav">
			<ul>
				<li id="notice_list">공지사항</li>
				<li id="all_list">전체글</li>
				<li id="hot_list">인기글</li>
				<li id="latest_list">최신글</li>
			</ul>
		</div>
		<div id="boardlist">
			<div id="listwrap">
				<form id="editorForm">
					<input type="text" name="subject" id="subject" placeholder="제목 입력"/>
					<!-- 스마트에디터가 적용될 textarea -->
					<textarea name="ir1" id="ir1" cols="100" rows="10"></textarea>
					<br>
					<input type="button" value="글쓰기" onclick="submitContents(this);">
				</form>
			</div>
		</div>
	</div>
	<div id="footer">
		
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/se2/js/service/HuskyEZCreator.js"></script>
<script type="text/javascript" src="../js/boardWriteForm.js"></script>
<script type="text/javascript">
/*<!-- 스마트에디터 자바스크립트 초기화 -->*/
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "ir1",
    sSkinURI: "../se2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
	// 에디터의 내용이 textarea에 반영되도록 업데이트
	oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
	subject = document.getElementById("subject").value;
	content = document.getElementById("ir1").value;
	$.ajax({
		type:'post',
		url:'/miniWeb/board/boardWrite.do',
		data:{
			'subject':subject,
			'content':content
		},
		dataType:'text',
		success:function(data){
			alert('글을 작성하였습니다.');
			location.href = '/miniWeb/board/boardForm.do?pg=1';
		},
		error:function(e){
			console.log(e)
			alert('로그인이 필요합니다.')
		}
	});
}
</script>
</body>
</html>