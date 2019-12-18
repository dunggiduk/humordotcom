package com.heeeun.boardsite.board;
import java.util.List;


public class ResultBean {
	private List<Board> list;			//보드 리스트가 있어야 셀렉트함
	private int totalPage;    			// 전체페이지수
	private int startPage;        		// 시작페이지 번호
	private int endPage;         		// 한 화면(그룹)에서 끝페이지 번호
	private int selectPageNo;      		// 선택된 페이지 번호 (인자로 들어온 page와 같은값)
	private int previousPage;			// 이전 그룹의 시작페이지 번호
	private int nextPage;				// 다음 그룹의 시작페이지
	private int groupNo;           		// 페이지별 그룹넘버
	//다음페이지
	private boolean showPrevious;
	private boolean showNext;
	//다음그룹
	//private boolean showPreviousGroup;
	//private boolean showNextGroup;
	//처음 & 끝
	private boolean showFirst;
	private boolean showLast;
	//DB 성능향상
	private int startRow;
	private int endRow;
	
	public ResultBean() {
		// TODO Auto-generated constructor stub
	}

	public ResultBean(List<Board> list, int totalPage, int startPage, int endPage, int selectPageNo, int previousPage,
			int nextPage, int groupNo, boolean showPrevious, boolean showNext, boolean showFirst, boolean showLast,
			int startRow, int endRow) {
		super();
		this.list = list;
		this.totalPage = totalPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.selectPageNo = selectPageNo;
		this.previousPage = previousPage;
		this.nextPage = nextPage;
		this.groupNo = groupNo;
		this.showPrevious = showPrevious;
		this.showNext = showNext;
		this.showFirst = showFirst;
		this.showLast = showLast;
		this.startRow = startRow;
		this.endRow = endRow;
	}

	public List<Board> getList() {
		return list;
	}

	public void setList(List<Board> list) {
		this.list = list;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getSelectPageNo() {
		return selectPageNo;
	}

	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}

	public int getPreviousPage() {
		return previousPage;
	}

	public void setPreviousPage(int previousPage) {
		this.previousPage = previousPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public boolean isShowPrevious() {
		return showPrevious;
	}

	public void setShowPrevious(boolean showPrevious) {
		this.showPrevious = showPrevious;
	}

	public boolean isShowNext() {
		return showNext;
	}

	public void setShowNext(boolean showNext) {
		this.showNext = showNext;
	}

	public boolean isShowFirst() {
		return showFirst;
	}

	public void setShowFirst(boolean showFirst) {
		this.showFirst = showFirst;
	}

	public boolean isShowLast() {
		return showLast;
	}

	public void setShowLast(boolean showLast) {
		this.showLast = showLast;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	
	
}
