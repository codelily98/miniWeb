<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 페이지</title>
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
                <li><a href="/miniWeb/news/newsList.do">뉴스</a></li>
                <li class="active"><a href="/miniWeb/board/boardForm.do?pg=1"><span>커뮤니티</span></a></li>
                <li><a href="#">달력</a></li>
                <li><a href="#">지도</a></li>
            </ul> 
        </div>
    </div>
</div>
<div id="wrap">
    <div id="container">
        <!-- 뉴스 검색 결과가 여기 표시될 예정 -->
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
                <!-- 네이버 뉴스 정보 표시 -->
                <div id="newsContainer"></div>
            </div>
        </div>
    </div>
    <div id="footer">
        
    </div>
</div>

<!-- jQuery 및 스크립트 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/boardForm.js"></script>
<script type="text/javascript" src="../js/search.js"></script>

<!-- 네이버 뉴스 API 데이터 출력 -->
<script type="text/javascript">
    // 서버로부터 전달된 JSON 데이터를 자바스크립트 변수에 할당
    const newsData = JSON.parse('<%= request.getAttribute("newsData") %>');
    const newsContainer = document.getElementById('newsContainer');
    const items = newsData.items;

    if (items && items.length > 0) {
        items.forEach(item => {
            const newsItem = document.createElement('div');
            newsItem.classList.add('news-item');

            // 뉴스 제목
            const title = document.createElement('a');
            title.href = item.link;
            title.target = "_blank";
            title.innerHTML = item.title.replace(/<[^>]+>/g, ""); // HTML 태그 제거
            newsItem.appendChild(title);

            // 뉴스 출처 및 날짜
            const pubDate = document.createElement('div');
            pubDate.classList.add('pub-date');
            pubDate.textContent = `출처: ${item.originallink} | 날짜: ${item.pubDate}`;
            newsItem.appendChild(pubDate);

            newsContainer.appendChild(newsItem);
        });
    } else {
        newsContainer.innerHTML = "<p>뉴스 기사가 없습니다.</p>";
    }
</script>
</body>
</html>