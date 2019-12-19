package com.heeeun.boardsite.board;

import java.util.List;
import java.util.Map;

public interface BoardService {

	void setBoardDao(BoardDao boardDao);

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
	boolean deleteBoard(Board board) throws Exception;

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
	boolean deleteComment(BReply bReply) throws Exception;

	/****************select****************/
	/*
	 7. selectBAll
	 */
	List<Board> selectBAll() throws Exception;

	/*
	 8. selectBByNo
	 */
	List<Map> selectBByNo(int bNo) throws Exception;

	/*
	 9. selectBById		
	 */
	List<Map> selectBById(String mId) throws Exception;

	/*
	 내가 쓴 글 정보		
	 */
	int selectBByIdd(String mId) throws Exception;
	/**************search*************/
	/*
	 10. selectBByNick
	 */
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

	Board selectBByCommentRno(BReply bReply) throws Exception;
	
	/*
	 14. selectBByCommentNick
	 */
	List<Map> selectBByCommentNick(String rNick) throws Exception;

	/*
	 15. selectBByCommentNick
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
	
	/************Vote*************/
	int insertVote(Vote vote) throws Exception;
	
	int deleteVote(Vote vote) throws Exception;
	
	int voteCheck(Vote vote) throws Exception;

	List<Board> main_bestOfbest() throws Exception;

	int minusBvote(Vote vote) throws Exception;

	int plusBvote(Vote vote) throws Exception;

	List<Board> main_bestOfToday() throws Exception;

	List<Board> selectBByAdmin() throws Exception;


	

}