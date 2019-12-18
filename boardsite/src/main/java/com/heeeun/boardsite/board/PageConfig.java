package com.heeeun.boardsite.board;

public class PageConfig {

	private int page; //현재 페이지 번호
	private int countPage; // 한 화면에 출력될 게시글수
	private int pageList; // 페이지네이션 개수 < 1 2 3 4 5 >
	
	public PageConfig() {
		// TODO Auto-generated constructor stub
	}

	public PageConfig(int page, int countPage, int pageList) {
		super();
		this.page = page;
		this.countPage = countPage;
		this.pageList = pageList;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getCountPage() {
		return countPage;
	}

	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}

	public int getPageList() {
		return pageList;
	}

	public void setPageList(int pageList) {
		this.pageList = pageList;
	}

	
}
