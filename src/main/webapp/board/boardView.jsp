<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404: 글 보기</title>
<link rel="stylesheet" href="../css/boardView.css">
</head>
<body>
<c:set var="context" value="${pageContext.request.contextPath}"/>
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
		<input type="hidden" id="image1" name="image1" value="${image1}"/>
		<input type="hidden" id="imageName" name="imageName" value="${imageName}"/>
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
			<div id="btnwrap">
				<c:if test="${not empty sessionScope.memId}">
				<input type="button" id="writebtn" value="글쓰기" onclick="location.href='/miniWeb/board/boardWriteForm.do'">
				</c:if>
				<c:if test="${empty sessionScope.memId}">
				<input type="button" id="writebtn" value="로그인" onclick="location.href='/miniWeb/member/loginForm.do'">
				</c:if>
			</div>
			<div id="listwrap">
				<form id = boardViewForm>
					<input type = "hidden" name = "pg" value = "${requestScope.pg }">
					<input type = "hidden" name = "seq" value = "${list[0].seq}">
					<input type = "hidden" id = "pwd" value = "${memPwd}">
					<table>
						<tr>
							<th width="10%" align="left">글&nbsp;번&nbsp;호&nbsp;:</th>
							<td width=40% data-seq="${list[0].seq}" align="left">${list[0].seq}</td>
							<th width=10% align="right">작&nbsp;성&nbsp;일&nbsp;:</th>
							<td width="40%" align="right">							
								<fmt:formatDate pattern="yy년 MM월 dd일 [HH:mm:ss]" value="${list[0].logtime}"/>
							</td>
						</tr>
						<tr>
							<th width="10%" align="left" id="subject">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목&nbsp;:</th>
							<td colspan="3">${list[0].subject}</td>
							
						</tr>
						<tr>
							<th width=10% align="left">작&nbsp;성&nbsp;자&nbsp;:</th>
							<td width=60% align="left">${list[0].id}</td>
							<th width=10% align="right">조&nbsp;회&nbsp;수&nbsp;:</th>
							<td width=20% align="right">${list[0].hit}</td>
						</tr>
						<tr>
							<th align="left">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
							<td id = content colspan = "5" height = "300px">${list[0].content}</td>
						</tr>
						<tr>
							<td id="formbtn" align="right" colspan="6">
								<c:if test = "${memId != list[0].id}">
									<input type="button" id="onebtn"value="목록" onclick="location.href='./boardForm.do?pg=${requestScope.pg}'">
								</c:if>
								<c:if test="${memId == list[0].id}">
									<input id="deleteBtn" type="button" value="글 삭제"/>
									<input id="updateBtn" type="button" value="글 수정" 
									onclick="location.href = './boardUpdateForm.do?seq=${list[0].seq}'"/>
									<input id="listBtn" type="button" value="목록" onclick="location.href='./boardForm.do?pg=${requestScope.pg}'">
								</c:if>
							</td>
						</tr>
					</table>
				</form>
				<div id="pagewrap">
					${pagingHTML }
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	let seq = $('td[data-seq]').data('seq');
	let pwd = $('#pwd').val();
	$('#deleteBtn').click(function(){
		let password = prompt('비밀번호를 입력하세요.');
		if(password == pwd){
			$.ajax({
				type:'post',
				url:'./boardDelete.do',
				data:{'seq':seq},
				dataType:'text',
				success:function(data){
					alert('글을 삭제하였습니다.');
					location.href = './boardForm.do?pg=1';
				},
				error:function(e){
					alert('글을 삭제하는데 실패했습니다.');
					console.log(e);
				}
			});
		}
		else{
			alert('비밀번호가 일치하지 않습니다.');
		}
	});
	$('#updateBtn').click(function(){
		$('#boardViewForm').attr('action','./boardUpdateForm.do')
		$('#boardViewForm').submit();
	});
});
</script>
</body>
</html>