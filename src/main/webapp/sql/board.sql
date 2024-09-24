-- [MySQL TABLE] 게시판 테이블
CREATE TABLE BOARD(
     seq INTEGER PRIMARY KEY AUTO_INCREMENT,	-- 글번호
     id VARCHAR(20) NOT NULL,          			-- 아이디
     name VARCHAR(40) NOT NULL,        			-- 이름
     email VARCHAR(100),						-- 이메일
     subject VARCHAR(255) NOT NULL,    			-- 제목
     content VARCHAR(4000) NOT NULL,   			-- 내용
     image1 VARCHAR(200) DEFAULT NULL,			-- 이미지 파일(파일이름)
     ref int NOT NULL,               			-- 그룹번호
     lev int DEFAULT 0 NOT NULL,     			-- 단계
     step int DEFAULT 0 NOT NULL,    			-- 글순서
     pseq int DEFAULT 0 NOT NULL,    			-- 원글번호
     reply int DEFAULT 0 NOT NULL,   			-- 답변수
     hit int DEFAULT 0,              			-- 조회수
     logtime TIMESTAMP DEFAULT NOW()			-- 작성일
 );