/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE member(
		mId                           		VARCHAR2(20)		 NOT NULL,
		mPassword                     		VARCHAR2(30)		 NOT NULL,
		mMail                         		VARCHAR2(40)		 NOT NULL,
		mNick                         		VARCHAR2(30)		 NOT NULL
);

COMMENT ON TABLE member is 'ȸ��';
COMMENT ON COLUMN member.mId is '���̵�';
COMMENT ON COLUMN member.mPassword is '��й�ȣ';
COMMENT ON COLUMN member.mMail is '�̸���';
COMMENT ON COLUMN member.mNick is '�г���';


/**********************************/
/* Table Name: �Խñ� */
/**********************************/
CREATE TABLE board(
		bNo                           		NUMBER(10)		 NOT NULL,
		mId                           		VARCHAR2(20)		 NOT NULL,
		bNick                         		VARCHAR2(30)		 NOT NULL,
		bPassword                     		VARCHAR2(30)		 NOT NULL,
		bTitle                        		VARCHAR2(100)		 NOT NULL,
		bContent                      		VARCHAR2(10000)		 NOT NULL,
		bTime                         		VARCHAR2(20)		 NOT NULL,
		bViews                        		NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE board is '�Խñ�';
COMMENT ON COLUMN board.bNo is '����ѹ�';
COMMENT ON COLUMN board.mId is '���̵�';
COMMENT ON COLUMN board.bNick is '����г���';
COMMENT ON COLUMN board.bPassword is '�����й�ȣ';
COMMENT ON COLUMN board.bTitle is '��������';
COMMENT ON COLUMN board.bContent is '���峻��';
COMMENT ON COLUMN board.bTime is '����ð�';
COMMENT ON COLUMN board.bViews is '��ȸ��';


/**********************************/
/* Table Name: ��� */
/**********************************/
CREATE TABLE bReply(
		bNo                           		NUMBER(10)		 NOT NULL,
		rNo                           		NUMBER(10)		 NOT NULL,
		mId                           		VARCHAR2(20)		 NOT NULL,
		rNick                         		VARCHAR2(30)		 NOT NULL,
		rPassword                     		VARCHAR2(30)		 NOT NULL,
		rContent                      		VARCHAR2(10000)		 NOT NULL,
		rTime                         		VARCHAR2(20)		 NOT NULL
);

COMMENT ON TABLE bReply is '���';
COMMENT ON COLUMN bReply.bNo is '�����ȣ';
COMMENT ON COLUMN bReply.rNo is '��۹�ȣ';
COMMENT ON COLUMN bReply.mId is '���̵�';
COMMENT ON COLUMN bReply.rNick is '��۴г���';
COMMENT ON COLUMN bReply.rPassword is '��ۺ�й�ȣ';
COMMENT ON COLUMN bReply.rContent is '��۳���';
COMMENT ON COLUMN bReply.rTime is '��۽ð�';



ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (mId);

ALTER TABLE board ADD CONSTRAINT IDX_board_PK PRIMARY KEY (bNo);
ALTER TABLE board ADD CONSTRAINT IDX_board_FK0 FOREIGN KEY (mId) REFERENCES member (mId);

ALTER TABLE bReply ADD CONSTRAINT IDX_bReply_PK PRIMARY KEY (rNo);
ALTER TABLE bReply ADD CONSTRAINT IDX_bReply_FK0 FOREIGN KEY (bNo) REFERENCES board (bNo);
ALTER TABLE bReply ADD CONSTRAINT IDX_bReply_FK1 FOREIGN KEY (mId) REFERENCES member (mId);

