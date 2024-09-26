<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>404:글 쓰기</title>
<!-- 스마트에디터 CSS 파일 로드 -->
<link rel="stylesheet" type="text/css" href="../se2/css/ko_KR/smart_editor2_in.css">
<link rel="stylesheet" type="text/css" href="../se2/css/ko_KR/smart_editor2_out.css">
<link rel="stylesheet" type="text/css" href="../se2/css/ko_KR/smart_editor2.css">

<!-- 필수 자바스크립트 파일 로드 -->
<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
<form id="editorForm">
	<input type="text" name="subject" id="subject" placeholder="제목 입력"/>
	<!-- 스마트에디터가 적용될 textarea -->
	<textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>
	<br>
	<input type="button" value="글쓰기" onclick="submitContents(this);">
</form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
<!-- 스마트에디터 자바스크립트 초기화 -->
	var oEditors = [];

	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "ir1",
		sSkinURI: "../se2/SmartEditor2Skin.html",  // 스킨 파일 경로 확인
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
			alert('글쓰기를 실패했습니다.')
		}
	});
}
</script>
</body>
</html>