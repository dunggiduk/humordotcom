/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		mId                           		VARCHAR2(20)		 NOT NULL,
		mPassword                     		VARCHAR2(30)		 NOT NULL,
		mMail                         		VARCHAR2(40)		 NOT NULL,
		mNick                         		VARCHAR2(30)		 NOT NULL
);

COMMENT ON TABLE member is '회원';
COMMENT ON COLUMN member.mId is '아이디';
COMMENT ON COLUMN member.mPassword is '비밀번호';
COMMENT ON COLUMN member.mMail is '이메일';
COMMENT ON COLUMN member.mNick is '닉네임';


/**********************************/
/* Table Name: 게시글 */
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

COMMENT ON TABLE board is '게시글';
COMMENT ON COLUMN board.bNo is '보드넘버';
COMMENT ON COLUMN board.mId is '아이디';
COMMENT ON COLUMN board.bNick is '보드닉네임';
COMMENT ON COLUMN board.bPassword is '보드비밀번호';
COMMENT ON COLUMN board.bTitle is '보드제목';
COMMENT ON COLUMN board.bContent is '보드내용';
COMMENT ON COLUMN board.bTime is '보드시간';
COMMENT ON COLUMN board.bViews is '조회수';


/**********************************/
/* Table Name: 댓글 */
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

COMMENT ON TABLE bReply is '댓글';
COMMENT ON COLUMN bReply.bNo is '보드번호';
COMMENT ON COLUMN bReply.rNo is '댓글번호';
COMMENT ON COLUMN bReply.mId is '아이디';
COMMENT ON COLUMN bReply.rNick is '댓글닉네임';
COMMENT ON COLUMN bReply.rPassword is '댓글비밀번호';
COMMENT ON COLUMN bReply.rContent is '댓글내용';
COMMENT ON COLUMN bReply.rTime is '댓글시간';



ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (mId);

ALTER TABLE board ADD CONSTRAINT IDX_board_PK PRIMARY KEY (bNo);
ALTER TABLE board ADD CONSTRAINT IDX_board_FK0 FOREIGN KEY (mId) REFERENCES member (mId);

ALTER TABLE bReply ADD CONSTRAINT IDX_bReply_PK PRIMARY KEY (rNo);
ALTER TABLE bReply ADD CONSTRAINT IDX_bReply_FK0 FOREIGN KEY (bNo) REFERENCES board (bNo);
ALTER TABLE bReply ADD CONSTRAINT IDX_bReply_FK1 FOREIGN KEY (mId) REFERENCES member (mId);

