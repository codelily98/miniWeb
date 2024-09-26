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
				<li><a href="">뉴스</a></li>
				<li><a href="#">커뮤니티</a></li>
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
				<li>공지사항</li>
				<li>전체글</li>
				<li>인기글</li>
				<li>최신글</li>
			</ul>
		</div>
		<div id="boardlist">
			<div id="btnwrap">
				<input type="button" id="writebtn" value="글쓰기">
			</div>
			<div id="listwrap">
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<!-- DB에서 불러와서 입력 -->
						<c:if test="${list != null}">
						<c:forEach var = "boardDTO" items = "${list}">
							<tr>
								<td>${boardDTO.seq }</td>
								<td>${boardDTO.subject }</td>
								<td>${boardDTO.nickname }</td>
								<td>
									<fmt:formatDate pattern = "yyyy.MM.dd HH:mm" value = "${boardDTO.logtime}"/>
								</td>
								<td>${boardDTO.hit }</td>
							</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div id="footer">
	${pagingHTML }
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
function boardPaging(pg){
	location.href = "boardForm.do?pg=" + pg;
}
</script>
</body>
</html>