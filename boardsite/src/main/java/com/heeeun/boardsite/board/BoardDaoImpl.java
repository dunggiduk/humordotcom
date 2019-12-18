package com.heeeun.boardsite.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {

	public static final String namespace = "com.heeeun.boardsite.mapper.boardMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	/***************board****************/
	
	/*
	 1. insert board
	 */
	@Override
	public boolean insertBoard(Board board) throws Exception {
		boolean insertOk = false;
	
		if(board.getmId()==null) {
			board.setmId("nullId98456");
		}
		if(board.getbImage()==null) {
			board.setbImage(" ");
		}
		
		int resultNumber = sqlSession.insert(namespace +"insertBoard", board);
		if(resultNumber == 1) {
			insertOk = true;
		}
		return insertOk;
	}
	
	/*
	 2. update board
	 */
	@Override
	public boolean updateBoard(Board board) throws Exception {
		boolean updateOk = false;
		int resultNumber = sqlSession.update(namespace +"updateBoard", board);
		if(resultNumber == 1) {
			updateOk = true;
		}
		return updateOk;
	}
	
	/*
	 3. delete board
	 */
	@Override
	public boolean deleteBoard(int bNo) throws Exception {
		boolean deleteOk = false;
		int resultNumber = sqlSession.delete(namespace +"deleteBoard", bNo);
		if(resultNumber == 1) {
			deleteOk = true;
		}
		return deleteOk;
	}
	
	/***************board Comment****************/
	
	/*
	 4. insert board Comment
	 */
	@Override
	public boolean insertComment(BReply bReply) throws Exception {
		boolean insertOk = false;
		int resultNumber = sqlSession.insert(namespace +"insertBoardC", bReply);
		if(resultNumber == 1) {
			insertOk = true;
		}
		return insertOk;
	}
	
	/*
	 5. update board Comment
	 */
	@Override
	public boolean updateComment(BReply bReply) throws Exception {
		boolean updateOk = false;
		int resultNumber = sqlSession.update(namespace +"updateBoardC", bReply);
		if(resultNumber == 1) {
			updateOk = true;
		}
		return updateOk;
	}
	
	/*
	 6. delete board Comment
	 */
	@Override
	public boolean deleteComment(int rNo) throws Exception {
		boolean deleteOk = false;
		int resultNumber = sqlSession.delete(namespace +"deleteBoardC", rNo);
		if(resultNumber == 1) {
			deleteOk = true;
		}
		return deleteOk;
	}
	
	/****************select****************/
	/*
	 7. selectBAll
	 */
	@Override
	public List<Board> selectBAll() throws Exception {
		List<Board> boards = sqlSession.selectList(namespace + "selectBAll");
		return boards;
	}
	
	/*
	 8. selectBByNo
	 */
	@Override
	public List<Map> selectBByNo(int bNo) throws Exception {
		List<Map> board = sqlSession.selectList(namespace +"selectBByNo", bNo);
		return board;
	}
			/*
			 update views
			 */
			@Override
			public void updateviews(int bNo) throws Exception {
				sqlSession.update(namespace +"updateviews", bNo);
			}
	
	/*
	 9. selectBById		
	 */
	@Override
	public List<Map> selectBById(String mId) throws Exception {
		List<Map> boards = sqlSession.selectList(namespace +"selectBById", mId);
		return boards;
	}
	
	/*
	 내가 쓴 글 정보		
	 */
	@Override
	public int selectBByIdd(String mId) throws Exception {
		int count =  sqlSession.selectOne(namespace +"selectBByIdd", mId);
		return count;
	}
	
	@Override
	public List<Board> selectBByAdmin() throws Exception {
		List<Board> boards =  sqlSession.selectList(namespace +"selectBByAdmin");
		return boards;
	}
	
	@Override
	public List<Board> main_bestOfbest() throws Exception {
		List<Board> boards=  sqlSession.selectList(namespace +"mainbestOfbest");
		return boards;
	}
	
	@Override
	public List<Board> main_bestOfToday() throws Exception {
		List<Board> boards=  sqlSession.selectList(namespace +"mainbestOftoday");
		return boards;
	}
	
	/**************search*************/
	/*
	 10. selectBByNick
	 */
	@Override
	public List<Map> selectBByNick(String bNick) throws Exception {
		List<Map> boards = sqlSession.selectList(namespace +"selectBByNick", bNick);
		return boards;
	}
	
	/*
	 11. selectBByTitle
	 */
	@Override
	public List<Map> selectBByTitle(String bTitle) throws Exception {
		List<Map> boards = sqlSession.selectList(namespace +"selectBByTitle", bTitle);
		return boards;
	}
	
	/*
	 12. selectBByContent
	 */
	@Override
	public List<Map> selectBByContent(String bContent) throws Exception {
		List<Map> boards = sqlSession.selectList(namespace +"selectBByContent", bContent);
		return boards;
	}
	
	/*
	 13. selectBByTitleNContent
	 */
	@Override
	public List<Map> selectBByTitleNContent(String keyword) throws Exception {
		List<Map> boards = sqlSession.selectList(namespace +"selectBByTitleNContent", keyword);
		return boards;
	}
	
	/*
	 14. selectBByCommentRno
	 */
	@Override
	public Board selectBByCommentRno(BReply bReply) throws Exception {
		Board boards = sqlSession.selectOne(namespace +"selectBByCommentRno",bReply);
		return boards;
	}
	
	/*
	 14. selectBByCommentNick
	 */
	@Override
	public List<Map> selectBByCommentNick(String rNick) throws Exception {
		List<Map> boards = sqlSession.selectList(namespace +"selectBByCommentNick", rNick);
		return boards;
	}
	/*
	 15. selectBByCommentId
	 */
	@Override
	public List<Map> selectBByCommentId(String mId) throws Exception {
		List<Map> boards = sqlSession.selectList(namespace +"selectBByCommentId", mId);
		return boards;
	}
	
	/*
	 16. selectBByCommentContent
	 */
	@Override
	public List<Map> selectBByCommentContent(String rContent) throws Exception {
		List<Map> boards = sqlSession.selectList(namespace +"selectBByCommentContent", rContent);
		return boards;
	}
	
	/*
	 17. selectBByCommentNickNContent
	 */
	@Override
	public List<Map> selectBByCommentNickNContent(String keyword) throws Exception {
		List<Map> boards = sqlSession.selectList(namespace +"selectBByCommentNickNContent", keyword);
		return boards;
	}
	
	/*
	 18. selectBAllAround
	 */
	@Override
	public List<Map> selectBAllAround(String keyword) throws Exception {
		List<Map> boards = sqlSession.selectList(namespace +"selectBByCommentNickNContent", keyword);
		return boards;
	}
	
	/************paging****************/
	   @Override
	   public int postCount() throws Exception{
	      int count = sqlSession.selectOne(namespace+"getCount");
	      return count;
	   }
	   
	   @Override
	   public List<Board> find_boardList(int startRow, int endRow) throws Exception{
	      HashMap map = new HashMap();
	      map.put("startRow", startRow);
	      map.put("endRow", endRow);
	      List<Board> boardlist = sqlSession.selectList(namespace+"select_boardList", map);
	      return boardlist;
	   }
	   
	 /***********vote*******************/
	   @Override
	   public int insertVote(Vote vote) throws Exception {
		   int count = sqlSession.insert(namespace+"insertVote", vote);
		return count;
	   }
	   
	   @Override
	   public int plusBvote(Vote vote) throws Exception {
		   int count = sqlSession.update(namespace+"plusBvote", vote);
		return count;
	   }
	   
	   @Override
	   public int deleteVote(Vote vote) throws Exception {
		   return sqlSession.delete(namespace+"deleteVote", vote);
		  
	   }
	   
	   @Override
	   public int minusBvote(Vote vote) throws Exception {
		   int count = sqlSession.update(namespace+"minusBvote", vote);
		return count;
	   }
	   
	   @Override
	   public int voteCheck(Vote vote) throws Exception {
		   int count = sqlSession.selectOne(namespace+"voteCheck", vote);
		   return count;
	   }
}
