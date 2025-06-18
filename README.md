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
- **adminboard.bean**
    - `adminDTO.java`: 관리자페이지 테이블 변수명과 일치하는 DTO
    - `adminPaging.java`: 관리자페이지 페이징 처리
- **adminboard.dao**
    - `adminDAO.java`: 관리자페이지 DB 연동
- **adminboard.service**
    - `admin(기능)Service.java`: 관리자페이지 관련 기능 구현
- **com.control**
    - `CommandProcess.java`: 인터페이스 정의
    - `ControlServlet.java`: 서블릿
- **mapper**
    - `memberMapper.xml`: 회원 관련 SQL
    - `boardMapper.xml`: 게시판 관련 SQL
    - `adminboardMapper.xml`: 관리자게시판 관련 SQL
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

## ERD

<img src="https://storage.googleapis.com/next-step-assets/saosa/404 ERD.png" />

## 기능

- 회원
  - 회원가입(이메일 인증)
  - 로그인/로그아웃
  - 정보수정(프로필, 닉네임, 주소, 비밀번호, 전화번호)
  - 회원탈퇴
- 커뮤니티
  - 글 목록 보기(공지사항, 인기글, 최신글)
  - 글 상세보기
  - 글/댓글 작성/수정/삭제(이미지 첨부)
- 뉴스
  - 네이버 뉴스 페이지로 이동
- 캘린더
  - 구글 캘린더 API 적용
- 지도
  - 카카오 지도 API 적용 (강남 비트캠프 기준 지도 출력)
- 검색
  - 커뮤니티 내용 검색 기능

**역할 (BE/FE)**

- 프로젝트 팀장
  - 프로젝트 구조 및 기능 설계/구현
  - ERD 설계 및 usecase 작성
- BE
  - 회원 및 커뮤니티 기능 구현
  - MyBatis + NCP DB 연동 및 이미지 업로드
  - 카카오 로그인 적용
- FE
  - 전체 페이지 구성 및 스마트 에디터 적용
- CI/CD
  - NCP 서버 + Docker + Jenkins를 이용한 배포

## 성과

- MVC 프로젝트 설계 및 개발 숙달
- 다양한 API 사용 경험
- CI/CD 파이프라인 구축 경험

## 프로젝트 리뷰

- Keep: 팀원 역할 분담, 스마트 에디터 성공 적용
- Problem: 에디터 적용 난이도, API 기능 활용 부족

## 느낀점

- MVC 구조에 대한 실전 경험
- 반응형 미지원 문제 인식 → 다른 프로젝트에서 구현 예정

## 실행화면
### 메인화면
- 로그아웃
<img src="https://storage.googleapis.com/next-step-assets/saosa/404 main.png" />
- 로그인
<img src="https://storage.googleapis.com/next-step-assets/saosa/404 main-login.png" />

### 마이페이지
- 기본
<img src="https://storage.googleapis.com/next-step-assets/saosa/404 mypage.png" />
- 닉네임 변경
<img src="https://storage.googleapis.com/next-step-assets/saosa/404 mypage-nickname-update.png" />
- 회원정보 변경
<img src="https://storage.googleapis.com/next-step-assets/saosa/404 mypage-info-update.png" />

### 커뮤니티
- 글목록
<img src="https://storage.googleapis.com/next-step-assets/saosa/404 community.png" />
- 글 상세보기 & 댓글 작성
<img src="https://storage.googleapis.com/next-step-assets/saosa/404 readpage.png" />
- 글 작성 (SmartEditor 2.0)
<img src="https://storage.googleapis.com/next-step-assets/saosa/404 writepage.png" />

### 기능
- 지도
<img src="https://storage.googleapis.com/next-step-assets/saosa/404 map.png" />
- 캘린더
<img src="https://storage.googleapis.com/next-step-assets/saosa/404 calendar.png" />
    - 상품 등록/삭제

---
