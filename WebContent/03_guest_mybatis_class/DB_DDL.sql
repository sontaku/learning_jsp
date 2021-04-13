-- 테이블, 시퀀스 제거
DROP TABLE comment_tab;
DROP SEQUENCE seq_message_messageid;

-- 테이블 생성
CREATE TABLE comment_tab (
    comment_no NUMBER primary key,
    user_id VARCHAR2(30),
    comment_content VARCHAR2(600),
    reg_date DATE);

-- 시퀀스 생성
CREATE SEQUENCE seq_message_messageid;

-- 데이터 주입
INSERT INTO comment_tab VALUES(seq_message_messageid.nextval, '홍길동', '안녕하세요1', SYSDATE);
INSERT INTO comment_tab VALUES(seq_message_messageid.nextval, '박길동', '안녕하세요2', SYSDATE);
INSERT INTO comment_tab VALUES(seq_message_messageid.nextval, '장길동', '안녕하세요3', SYSDATE);
INSERT INTO comment_tab VALUES(seq_message_messageid.nextval, '김길동', '안녕하세요4', SYSDATE);

commit;