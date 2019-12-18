package com.heeeun.boardsite.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired 
	private BoardDao boardDao;

	@Override
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	

	/***************board****************/
	
	/*
	 1. insert board
	 */
	@Override
	public boolean insertBoard(Board board) throws Exception {
		boolean isOk = boardDao.insertBoard(board);
		return isOk;
	}
	
	
	/*
	 2. update board
	 */
	@Override
	public boolean updateBoard(Board board) throws Exception {
		return boardDao.updateBoard(board);
	}
	
	/*
	 3. delete board
	 */
	@Override
	public boolean deleteBoard(int bNo) throws Exception {
		return boardDao.deleteBoard(bNo);
	}
	
	/***************board Comment****************/
	
	/*
	 4. insert board Comment
	 */
	@Override
	public boolean insertComment(BReply bReply) throws Exception {
		return boardDao.insertComment(bReply);
	}
	
	/*
	 5. update board Comment
	 */
	@Override
	public boolean updateComment(BReply bReply) throws Exception {
		return boardDao.updateComment(bReply);
	}
	
	/*
	 6. delete board Comment
	 */
	@Override
	public boolean deleteComment(int rNo) throws Exception {
		return boardDao.deleteComment(rNo);
	}
	
	/****************select****************/
	/*
	 7. selectBAll
	 */
	@Override
	public List<Board> selectBAll() throws Exception {
		return boardDao.selectBAll();
	}
	
	/*
	 8. selectBByNo
	 */
	@Override
	public List<Map> selectBByNo(int bNo) throws Exception {
		boardDao.updateviews(bNo);
		return boardDao.selectBByNo(bNo);
	}
	
	/*
	 9. selectBById		
	 */
	@Override
	public List<Map> selectBById(String mId) throws Exception {
		return boardDao.selectBById(mId);
	}
	
	/*
	 내가 쓴 글 정보		
	 */
	@Override
	public int selectBByIdd(String mId) throws Exception {
		return boardDao.selectBByIdd(mId);
	}
	
	@Override
	public List<Board> selectBByAdmin() throws Exception {
		return boardDao.selectBByAdmin();
	}
	
	@Override
	public List<Board> main_bestOfbest() throws Exception {
		return boardDao.main_bestOfbest();
	}
	
	@Override
	public List<Board> main_bestOfToday() throws Exception {
		return boardDao.main_bestOfToday();
	}
	/**************search*************/
	/*
	 10. selectBByNick
	 */
	@Override
	public List<Map> selectBByNick(String bNick) throws Exception {
		return boardDao.selectBByNick(bNick);
	}
	
	/*
	 11. selectBByTitle
	 */
	@Override
	public List<Map> selectBByTitle(String bTitle) throws Exception {
		return boardDao.selectBByTitle(bTitle);
	}
	
	/*
	 12. selectBByContent
	 */
	@Override
	public List<Map> selectBByContent(String bContent) throws Exception {
		return boardDao.selectBByContent(bContent);
	}
	
	/*
	 13. selectBByTitleNContent
	 */
	@Override
	public List<Map> selectBByTitleNContent(String keyword) throws Exception {
		return boardDao.selectBByTitleNContent(keyword);
	}
	
	/*
	 14. selectBByCommentRno
	 */
	@Override
	public Board selectBByCommentRno(BReply bReply) throws Exception {
		return boardDao.selectBByCommentRno(bReply);
	}
	
	/*
	 14. selectBByCommentNick
	 */
	@Override
	public List<Map> selectBByCommentNick(String rNick) throws Exception {
		return boardDao.selectBByCommentNick(rNick);
	}
	
	/*
	 15. selectBByCommentId
	 */
	@Override
	public List<Map> selectBByCommentId(String mId) throws Exception {
		return boardDao.selectBByCommentId(mId);
	}
	
	/*
	 15. selectBByCommentContent
	 */
	@Override
	public List<Map> selectBByCommentContent(String rContent) throws Exception {
		return boardDao.selectBByCommentContent(rContent);
	}
	
	/*
	 16. selectBByCommentNickNContent
	 */
	@Override
	public List<Map> selectBByCommentNickNContent(String keyword) throws Exception {
		return boardDao.selectBByCommentNickNContent(keyword);
	}
	
	/*
	 17. selectBAllAround
	 */
	@Override
	public List<Map> selectBAllAround(String keyword) throws Exception {
		return boardDao.selectBAllAround(keyword);
	}
	
	/**************paging*************/
	
	/***************Vote*******************/
	public int insertVote(Vote vote) throws Exception {
		return boardDao.insertVote(vote);
		   
	}
	
	   @Override
	   public int plusBvote(Vote vote) throws Exception {
		   return boardDao.plusBvote(vote);
	   }
	   
	public int deleteVote(Vote vote) throws Exception {
		return boardDao.deleteVote(vote);
	}
	
	   @Override
	   public int minusBvote(Vote vote) throws Exception {
		   return boardDao.minusBvote(vote);
	   }
	   
   
	public int voteCheck(Vote vote) throws Exception {
		return boardDao.voteCheck(vote);
	}
}
