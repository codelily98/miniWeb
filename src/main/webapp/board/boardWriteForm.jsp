<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>404:글 쓰기</title>
<link rel="stylesheet" href="../css/boardWriteForm.css">
<!-- 스마트에디터 CSS 파일 로드 -->
<link rel="stylesheet" type="text/css" href="../se2/css/smart_editor2_in.css">
<link rel="stylesheet" type="text/css" href="../se2/css/smart_editor2_out.css">
<link rel="stylesheet" type="text/css" href="../se2/css/smart_editor2.css">
<!-- 필수 자바스크립트 파일 로드 -->
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
<div id="topwrap">
	<div id="header">
		<div id="topawrap">
			<div id="topnav">
			    <c:if test="${empty sessionScope.memId}">
			    <a href="../member/loginForm.do">로그인</a>&nbsp;|
			    </c:if>
			    <c:if test="${not empty sessionScope.memId}">
			    <a href="../member/infoForm.do">회원정보</a>&nbsp;|
			    <a href="../member/loout.do">로그아웃</a>&nbsp;|
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
				<li><a href="https://news.naver.com/section/105">뉴스</a></li>
				<li class="active"><a href="/miniWeb/board/boardForm.do?pg=1"><span>커뮤니티</span></a></li>
				<li><a href="/miniWeb/calender/CalendarForm.do">캘린더</a></li>
				<li><a href="/miniWeb/map/mapForm.do">지도</a></li>
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
					<input type="hidden" id="profile" name="profile" value="${sessionScope.profile}">
					<input type="text" name="subject" id="subject" placeholder="제목 입력"/>
					<!-- 스마트에디터가 적용될 textarea -->
					<textarea name="ir1" id="ir1" cols="100" rows="10"></textarea>
					<br>
					<input type="hidden" value="${admin}" id="admin">
					<c:if test="${admin != '1'}">
						<input type="button" value="글쓰기" onclick="submitContents(this);">
					</c:if>
					<c:if test="${admin == '1'}">
						<input type="button" value="공지사항 등록" onclick="submitContents(this);">
					</c:if>
				</form>
			</div>
		</div>
	</div>
	<div id="footer">
		
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="../js/boardForm.js"></script>
<script type="text/javascript" src="../js/search.js"></script>
<script type="text/javascript">
/*<!-- 스마트에디터 자바스크립트 초기화 -->*/
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "ir1",
    sSkinURI: "../se2/SmartEditor2Skin.html",
    fCreator: "createSEditor2",
    htParams : { 
        // 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
        bUseToolbar : true, 
        // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
        bUseVerticalResizer : false, 
        // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
        bUseModeChanger : true,
        fOnBeforeUnload: function(){},
        I18N_LOCALE: "ko_KR",
        // 이미지 업로드 플러그인 사용 설정
        se2M_AttachImage: {
            sUploadURL: "/miniWeb/board/imageUpload.do"  // 이미지 업로드 경로 (서버측 업로드 핸들러)
        }
	}
});

function submitContents(elClickedObj) {
	// 에디터의 내용이 textarea에 반영되도록 업데이트
	oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
	let subject = document.getElementById("subject").value;
	let content = document.getElementById("ir1").value;
	let admin = document.getElementById("admin").value;
	let profile = document.getElementById("profile").value;

	// 본문 내용에서 첫 번째 이미지 태그 찾기
	let imgTag = content.match(/<img[^>]+src="([^">]+)"/);
	let imgName = ''; // 기본값 설정

	let imageName = null;

	if (imgTag) {
	    // src 속성에서 전체 URL 추출
	    var src = imgTag[1]; // match로 찾은 그룹 1을 사용
	    imgName = src; // 전체 src를 사용
	}	
	
	// FormData 객체 생성
	let formData = new FormData();
	formData.append('subject', subject);
	formData.append('content', content);
	formData.append('admin', admin);
	formData.append('profile', profile);
	
	// 이미지가 있는 경우에만 추가
	if (imgName) {
	    formData.append('image1', imgName);
	}
	
	if(subject != '' && content != '') {
		$.ajax({
			type: 'post',
			enctype: 'multipart/form-data',
			url: '/miniWeb/board/boardWrite.do',
			processData: false,
			contentType: false,
			data: formData,
			dataType: 'text',
			success: function(data) {
				alert('글을 작성하였습니다.');
				location.href = '/miniWeb/board/boardForm.do?pg=1';
			},
			error: function(e) {
				console.log(e);
				alert('로그인이 필요합니다.');
			}
		});
	} else {
		alert("제목과 내용을 입력해주세요.");
	}	
}
</script>
</body>
</html>