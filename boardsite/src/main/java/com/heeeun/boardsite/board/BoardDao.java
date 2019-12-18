package com.heeeun.boardsite.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface BoardDao {

	void setSqlSession(SqlSession sqlSession);

	/***************board****************/

	/*
	 1. insert board
	 */
	boolean insertBoard(Board board) throws Exception;
	
	/*
	 2. update board
	 */
	boolean updateBoard(Board board) throws Exception;

	/*
	 3. delete board
	 */
	boolean deleteBoard(int bNo) throws Exception;

	/***************board Comment****************/

	/*
	 4. insert board Comment
	 */
	boolean insertComment(BReply bReply) throws Exception;

	/*
	 5. update board Comment
	 */
	boolean updateComment(BReply bReply) throws Exception;

	/*
	 6. delete board Comment
	 */
	boolean deleteComment(int rNo) throws Exception;

	/****************select****************/
	List<Board> selectBAll() throws Exception;

	/*
	 8. selectBByNo
	 */
	List<Map> selectBByNo(int bNo) throws Exception;

	/*
	 update views
	 */
	void updateviews(int bNo) throws Exception;

	/*
	 9. selectBById		
	 */
	List<Map> selectBById(String mId) throws Exception;
	/*
	 게시글 수
	 */
	int selectBByIdd(String mId) throws Exception;

	/**************search*************/
	List<Map> selectBByNick(String bNick) throws Exception;

	/*
	 11. selectBByTitle
	 */
	List<Map> selectBByTitle(String bTitle) throws Exception;

	/*
	 12. selectBByContent
	 */
	List<Map> selectBByContent(String bContent) throws Exception;

	/*
	 13. selectBByTitleNContent
	 */
	List<Map> selectBByTitleNContent(String keyword) throws Exception;
	
	/*
	 13. selectBByCommentRno
	 */
	Board selectBByCommentRno(BReply bReply) throws Exception;
	
	/*
	 14. selectBByCommentNick
	 */
	List<Map> selectBByCommentNick(String rNick) throws Exception;

	/*
	 15. selectBByCommentId
	 */
	List<Map> selectBByCommentId(String mId) throws Exception;
	
	/*
	 16. selectBByCommentContent
	 */
	List<Map> selectBByCommentContent(String rContent) throws Exception;

	/*
	 17. selectBByCommentNickNContent
	 */
	List<Map> selectBByCommentNickNContent(String keyword) throws Exception;

	/*
	 18. selectBAllAround
	 */
	List<Map> selectBAllAround(String keyword) throws Exception;

	int postCount() throws Exception;

	List<Board> find_boardList(int startRow, int endRow) throws Exception;
	
	/*************Vote*******************/
	
	int insertVote(Vote vote) throws Exception;
	
	int deleteVote(Vote vote) throws Exception;
	
	int voteCheck(Vote vote) throws Exception;

	List<Board> main_bestOfbest() throws Exception;

	int plusBvote(Vote vote) throws Exception;

	int minusBvote(Vote vote) throws Exception;

	List<Board> main_bestOfToday() throws Exception;

	List<Board> selectBByAdmin() throws Exception;

	

	

}