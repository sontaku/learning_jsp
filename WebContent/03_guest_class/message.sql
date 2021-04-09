DROP TABLE GuestTB;
DROP SEQUENCE seq_guestTB_messageId;

CREATE TABLE GuestTB
(	
	MESSAGE_ID		NUMBER primary key,
	GUEST_NAME		varchar2(10) NOT NULL,
	PASSWORD		varchar2(10) NOT NULL,
	MESSAGE			VARCHAR2(1024) NOT NULL
);

CREATE SEQUENCE seq_guestTB_messageId
INCREMENT BY 1 
START WITH 1;