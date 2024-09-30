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
				<form id = boardViewForm>
					<input type="hidden" name="pg" value="${requestScope.pg }">
					<input type="hidden" id="seq" name="seq" value="${list[0].seq}">
					<input type="hidden" id="pwd" value="${memPwd}">
					<table>
						<tr>
							<th width="10%" align="left">글&nbsp;번&nbsp;호&nbsp;:</th>
							<td width=55% data-seq="${list[0].seq}" align="left">${list[0].seq}</td>
							<th width=10% align="right">작&nbsp;성&nbsp;일&nbsp;:</th>
							<td id="logtimeStyle" width="25%" align="right">
								<fmt:formatDate pattern="yy.MM.dd. HH:mm:ss" value="${list[0].logtime}"/>
							</td>
						</tr>
						<tr>
							<th width="10%" align="left" id="subject">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목&nbsp;:</th>
							<td colspan="3">${list[0].subject}</td>
							
						</tr>
						<tr>
							<th align="left">작&nbsp;성&nbsp;자&nbsp;:</th>
							<td align="left" class="tdtd">
								<div id="imgimg">
									<img class="boardWriterImg" src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-97/upload/${list[0].profile}" alt="${sessionScope.profile}" width="30px" height="30px" style="border-radius: 15px;">
								</div>
								<div id="nicknick">
									${list[0].nickname}
								</div>
							</td>
							<th align="right">조&nbsp;회&nbsp;수&nbsp;:</th>
							<td id="hitStyle" align="right">${list[0].hit}</td>
						</tr>
						<tr>
							<td id = content colspan = "6" height = "500px">${list[0].content}</td>
						</tr>
						<tr>
							<td id="formbtn" align="right" colspan="6">
								<c:if test = "${memId != list[0].id}">
									<input type="button" id="onebtn"value="목록" onclick="location.href='./boardForm.do?pg=${requestScope.pg}'">
								</c:if>
								<c:if test="${memId == list[0].id}">
									<input id="deleteBtn" type="button" value="글 삭제"/>
									<input id="updateBtn" type="button" value="글 수정" onclick="location.href='./boardUpdateForm.do?pg=${requestScope.pg}&seq=${list[0].seq}'"/>
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
			<c:if test="${not empty sessionScope.memId}">
				<div id="btnwrap">
					<input type="hidden" id="id" name="name" value="${sessionScope.memId}">
					<input type="hidden" id="nickname" name="nickname" value="${sessionScope.memNickname}">
					<input type="hidden" id="profile" name="profile" value="${sessionScope.profile}">
					<input type="button" id="comentShowBtn" value="댓글 작성" class="hide1">
					<input type="button" id="comentHideBtn" value="댓글 닫기" class="show1">
					<input type="button" id="writebtn" value="글쓰기" onclick="location.href='/miniWeb/board/boardWriteForm.do'">		
				</div>
				<div id="commentWritewrap" class="show1">
				    <div class="comment-input-area">
				        <div class="profile-pic">
				            <img width="30px" height="30px" src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-97/upload/${sessionScope.profile}" alt="${profile}">
				            <span class="nickname">${sessionScope.memNickname}</span>
				        </div>
				        <div class="comment-input">
				            <textarea id="comment" name="comment" placeholder="댓글을 남겨보세요"></textarea>
				            <div class="comment-actions">
				                <input type="button" id="commentSubmitBtn" value="등록">
				            </div>
				        </div>
				    </div>
				</div>
				<c:forEach var="commentDTO" items="${Clist}">
					<div id="commentViewwrap">
						<div class="profile-pic">
							<div id="InsertImg">
								<c:if test="${not empty commentDTO.profile}">
				            		<img width="30px" height="30px" src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-97/upload/${commentDTO.profile}" alt="${commentDTO.profile}">
				           		</c:if>
				           		<c:if test="${empty commentDTO.profile}">
				            		<img width="30px" height="30px" src="../image/default.png" alt="default">
				            	</c:if>
							</div>
							<div id="InsertNickname">
								<span class="nickname" id="insertNickname">${commentDTO.nickname}</span>
							</div>
							<div id="InsertDate">
								<span><fmt:formatDate pattern="yy.MM.dd. HH:mm" value="${commentDTO.logtime}"/></span>
							</div>
				        </div>
						<div id="insertComment" name="insertComment">
							<div id="borderwrap">${commentDTO.content}</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${empty sessionScope.memId}">
				<div id="btnwrap">
					<input type="button" id="writebtn" value="로그인" onclick="location.href='/miniWeb/member/loginForm.do'">	
				</div>
			</c:if>
		</div>
	</div>
	<div id="footer">
		
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/boardForm.js"></script>
<script type="text/javascript" src="../js/commentWrite.js"></script>
<script type="text/javascript" src="../js/boardDelete.js"></script>
<script type="text/javascript" src="../js/search.js"></script>
</body>
</html>