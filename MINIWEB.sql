-- MINIWEB TABLE과 변수명 (테이블의 요소와 변수명(DTO)를 일치 --
-- [MINIWEB_MEMBER 테이블] --
CREATE TABLE MINIWEB_MEMBER (
    id VARCHAR2(15) PRIMARY KEY,   	-- 아이디, 필수, 기본키
    pwd VARCHAR2(255) NOT NULL,		-- 비밀번호, 필수
    name VARCHAR2(50) NOT NULL,		-- 이름, 필수
    gender CHAR(1) NOT NULL,		-- 성별, 필수
    email1 VARCHAR2(100),			-- 이메일 아이디
    email2 VARCHAR2(100),			-- 이메일 주소
    tel1 VARCHAR2(3),				-- 전화번호 앞자리
    tel2 VARCHAR2(4),				-- 전화번호 중간자리
    tel3 VARCHAR2(4),				-- 전화번호 뒷자리
    zipcode VARCHAR2(20),			-- 우편번호
    addr1 VARCHAR2(255),			-- 주소
    addr2 VARCHAR2(255),			-- 상세주소
    logtime DATE,					-- 가입일
    profile VARCHAR2(500) DEFAULT null	-- 프로필 사진 경로저장
);

-- [MINIWEB_BOARD 테이블] --
CREATE TABLE MINIWEB_BOARD (
    seq NUMBER NOT NULL,				-- 글번호 (시퀀스 객체 이용)
    id VARCHAR2(20) NOT NULL, 			-- 아이디
    name VARCHAR2(40) NOT NULL, 		-- 이름
    email VARCHAR2(40), 				-- 이메일
    subject VARCHAR2(255) NOT NULL,		-- 제목
    content VARCHAR2(4000) NOT NULL,		-- 내용 
    file_path VARCHAR2(500),				-- 사진 경로 저장
    ref NUMBER NOT NULL, 				-- 그룹번호
    lev NUMBER DEFAULT 0 NOT NULL, 		-- 단계
    step NUMBER DEFAULT 0 NOT NULL,		-- 글순서
    pseq NUMBER DEFAULT 0 NOT NULL,		-- 원글번호
    reply NUMBER DEFAULT 0 NOT NULL, 	-- 답변수
    hit NUMBER DEFAULT 0, 				-- 조회수
    logtime DATE DEFAULT SYSDATE		-- 작성일
);

-- [MINIWEB_BOARD 시퀀스] --
CREATE SEQUENCE SEQ_MINIWEB_BOARD
START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

-- [MINIWEB_BOARD 페이징] --
SELECT * FROM (SELECT ROWNUM RN, TT.* FROM (SELECT * FROM MINIWEB_BOARD ORDER BY seq DESC) TT) WHERE RN >= 1 AND RN <= 5;

-- [전체 게시글 COUNT] --
select count(*) from MINIWEB_BOARD;