-- [MySQL TABLE] 회원 테이블
CREATE TABLE MINIMEMBER (
    id VARCHAR(15) PRIMARY KEY,    		-- 아이디, 필수, 기본키
    pwd VARCHAR(255) NOT NULL,     		-- 비밀번호, 필수
    nickname VARCHAR(50) NOT NULL,		-- 닉네임, 필수
    name VARCHAR(50) NOT NULL,     		-- 이름, 필수
    gender CHAR(1) NOT NULL,        	-- 성별, 필수
    email1 VARCHAR(100) NOT NULL, 		-- 이메일 아이디
    email2 VARCHAR(100) NOT NULL, 		-- 이메일 주소
    tel1 VARCHAR(3),               		-- 전화번호 앞자리
    tel2 VARCHAR(4),               		-- 전화번호 중간자리
    tel3 VARCHAR(4),               		-- 전화번호 뒷자리
    zipcode VARCHAR(20),           		-- 우편번호
    addr1 VARCHAR(255),            		-- 주소
    addr2 VARCHAR(255),            		-- 상세주소
    profile VARCHAR(200) DEFAULT NULL,	-- 프로필 사진(가입 시 입력 X)
    admin CHAR(1) DEFAULT 0 NOT NULL,  	-- 관리자 권한((0 -> 일반 사용자), (1 -> 관리자)
    logtime TIMESTAMP DEFAULT NOW()		-- 가입일
);