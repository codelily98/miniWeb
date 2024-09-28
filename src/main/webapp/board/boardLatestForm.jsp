<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404: 커뮤니티</title>
<link rel="stylesheet" href="../css/boardForm.css">
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
			    <a href="/miniWeb/member/loout.do">로그아웃</a>&nbsp;|
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
				<table>
					<thead>
						<tr>
							<th width="10%">번호</th>
							<th width="40%">제목</th>
							<th width="25%">작성자</th>
							<th width="15%">작성일</th>
							<th width="10%">조회수</th>
						</tr>
					</thead>
					<tbody>
						<!-- DB에서 불러와서 입력 -->
						<c:if test="${list != null}">
						<c:forEach var = "boardDTO" items = "${list}">
							<c:set var="startnum" value="${startnum + 1}"/>
							<tr>
								<td><input class="seq" type="hidden" id="seq" value="${boardDTO.seq}">
									<span>${startnum}</span>
								</td>
								<td class="asubject" id="titleStyle">
								<input type = "hidden" id = "pg" class = "pg" value = "${requestScope.pg}" />
								<input type = "hidden" id = "memNickname" class = "memNickname" value = "${memNickname}" />
								<input type = "hidden" id = "postId" class = "postId" value = "${boardDTO.id}" />
									<span id="title">${boardDTO.subject}</span>
								</td>
								<td>${boardDTO.nickname}</td>
								<td>
									<fmt:formatDate pattern = "yy.MM.dd." value = "${boardDTO.logtime}"/>
								</td>
								<td>${boardDTO.hit }</td>
							</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				<div id="pagewrap">
					${pagingHTML }
				</div>
			</div>
			<div id="btnwrap">
				<c:if test="${not empty sessionScope.memId}">
				<input type="button" id="writebtn" value="글쓰기" onclick="location.href='/miniWeb/board/boardWriteForm.do'">
				</c:if>
				<c:if test="${empty sessionScope.memId}">
				<input type="button" id="writebtn" value="로그인" onclick="location.href='/miniWeb/member/loginForm.do'">
				</c:if>
			</div>
		</div>
	</div>
	<div id="footer">
		
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/boardForm.js"></script>
<script type="text/javascript" src="../js/search.js"></script>
<script type="text/javascript">
function boardPaging(pg) {
    location.href = "boardLatestForm.do?pg=" + pg;
}
</script>
</body>
</html>