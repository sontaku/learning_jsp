# 테이블 명 : comment_tab
게시글번호	comment_no			NUMBER			primary key
작성자		user_id				VARCHAR2(30)
게시글		comment_content		VARCHAR2(600)
등록일		reg_date			DATE

## 레코드 추가
INSERT INTO comment_tab 
VALUES(seq_message_messageid.nextval, '홍길동', '안녕하세요', SYSDATE);
