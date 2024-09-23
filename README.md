## MiniWeb 프로젝트

### 팀원

- **김태훈** - codelily98@gmail.com
- **김효진** - yellomouse05@gmail.com
- **신재영** - shinja0829@naver.com
- **추현식** - gustlr887@naver.com

---

### 프로젝트 구조

### 1. **JAVA**

- **main.service**
    - `IndexService.java`: 홈페이지 `.do` 연결 담당
- **member.bean**
    - `MemberDTO.java`: 테이블 변수명과 일치하는 회원 관련 DTO
- **member.dao**
    - `MemberDAO.java`: 회원 DB 연동
- **member.service**
    - `Member(기능)Service.java`: 회원 관련 기능 구현
- **board.bean**
    - `BoardDTO.java`: 게시판 테이블 변수명과 일치하는 DTO
    - `BoardPaging.java`: 게시판 페이징 처리
- **board.dao**
    - `BoardDAO.java`: 게시판 DB 연동
- **board.service**
    - `Board(기능)Service.java`: 게시판 관련 기능 구현
- **imageboard.bean**
    - `ImageboardDTO.java`: 이미지게시판 테이블 변수명과 일치하는 DTO
    - `ImageboardPaging.java`: 이미지게시판 페이징 처리
- **imageboard.dao**
    - `ImageboardDAO.java`: 이미지게시판 DB 연동
- **imageboard.service**
    - `Imageboard(기능)Service.java`: 이미지게시판 관련 기능 구현
- **com.control**
    - `CommandProcess.java`: 인터페이스 정의
    - `ControlServlet.java`: 서블릿
- **mapper**
    - `memberMapper.xml`: 회원 관련 SQL
    - `boardMapper.xml`: 게시판 관련 SQL
    - `imageboardMapper.xml`: 이미지게시판 관련 SQL
- setting
    - `db.properties`: DB 연결 설정
    - `mybatis-config.xml`: MyBatis 설정

### 2. **Webapp**

- **main**
    - `index.jsp`: 홈페이지 관련 기능
- **member**
    - 회원가입/로그인 관련 페이지 및 기능
- **board**
    - 게시판 관련 페이지 및 기능
- **css**
    - 각 페이지의 CSS 파일
- **image**
    - 이미지 파일 모음
- **js**
    - 각 페이지의 기능적 JS 파일
- **sql**
    - SQL 파일
- **WEB-INF**
    - lib
        - `jstl.jar`
        - `lombok.jar`
        - `mybatis-3.5.16.jar`
        - `ojdbc11.jar`
        - `standard-1.1.2.jar`
        - `cos-05Nov2002.jar`

### 3. **페이지 구성**

- `index.jsp`: 홈페이지 메인 페이지

---

### 필수 구현 기능

1. **회원 시스템**
    - 회원가입, 로그인, 회원정보 수정, 회원탈퇴
    - **이메일 인증** 기능 구현 (참고: 인터넷 검색)
2. **게시판 기능**
    - 글쓰기, 목록 보기, 작성한 글 확인, 덧글 기능
    - 글 수정 및 삭제
    - 사진 첨부기능
    - **스마트 에디터** 도입 (참고: [스마트 에디터 설치 가이드](https://beforb.tistory.com/53))
3. **게시판 검색 및 페이징**
    - 검색 조건: 기간, 제목 또는 작성자
    - 검색할 input 제공, 결과 페이징 처리
4. **관리자 페이지**
    - 공지사항 등록/삭제
    - 상품 등록/삭제

---
