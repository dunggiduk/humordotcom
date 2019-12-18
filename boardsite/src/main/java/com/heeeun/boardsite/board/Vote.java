package com.heeeun.boardsite.board;


public class Vote {
	
	private int vNo;
	private int bNo;
	private String mId;
	
	public Vote() {
		// TODO Auto-generated constructor stub
	}

	public Vote(int vNo, int bNo, String mId) {
		super();
		this.vNo = vNo;
		this.bNo = bNo;
		this.mId = mId;
	}

	@Override
	public String toString() {
		return "Vote [vNo=" + vNo + ", bNo=" + bNo + ", mId=" + mId + "]";
	}

	public int getvNo() {
		return vNo;
	}

	public void setvNo(int vNo) {
		this.vNo = vNo;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}
	

	
	
}
