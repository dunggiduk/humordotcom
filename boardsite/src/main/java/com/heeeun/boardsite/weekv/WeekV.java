package com.heeeun.boardsite.weekv;

public class WeekV {
	private int wNo;
	private String mId;
	private int wValue;
	
	public WeekV() {
		// TODO Auto-generated constructor stub
	}
	
	public WeekV(int wNo, String mId, int wValue) {
		super();
		this.wNo = wNo;
		this.mId = mId;
		this.wValue = wValue;
	}

	@Override
	public String toString() {
		return "WeekV [wNo=" + wNo + ", mId=" + mId + ", wValue=" + wValue + "]";
	}

	public int getwNo() {
		return wNo;
	}

	public void setwNo(int wNo) {
		this.wNo = wNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public int getwValue() {
		return wValue;
	}

	public void setwValue(int wValue) {
		this.wValue = wValue;
	}
	
	
}
