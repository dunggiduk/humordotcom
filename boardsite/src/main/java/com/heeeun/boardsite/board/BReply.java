package com.heeeun.boardsite.board;
/**
 * @author 21gml
 *
 */
public class BReply {
    private int bNo;
    private int rNo;
    private String rMid;
    private String rNick;
    private String rPassword;
    private String rContent;
    private String rDay;
    private String rTime;

    public BReply() {
		// TODO Auto-generated constructor stub
	}

	public BReply(int bNo, int rNo, String rMid, String rNick, String rPassword, String rContent, String rDay,
			String rTime) {
		super();
		this.bNo = bNo;
		this.rNo = rNo;
		this.rMid = rMid;
		this.rNick = rNick;
		this.rPassword = rPassword;
		this.rContent = rContent;
		this.rDay = rDay;
		this.rTime = rTime;
	}

	@Override
	public String toString() {
		return "bReply [bNo=" + bNo + ", rNo=" + rNo + ", rMid=" + rMid + ", rNick=" + rNick + ", rPassword="
				+ rPassword + ", rContent=" + rContent + ", rDay=" + rDay + ", rTime=" + rTime + "]";
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public String getrMid() {
		return rMid;
	}

	public void setrMid(String rMid) {
		this.rMid = rMid;
	}

	public String getrNick() {
		return rNick;
	}

	public void setrNick(String rNick) {
		this.rNick = rNick;
	}

	public String getrPassword() {
		return rPassword;
	}

	public void setrPassword(String rPassword) {
		this.rPassword = rPassword;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public String getrDay() {
		return rDay;
	}

	public void setrDay(String rDay) {
		this.rDay = rDay;
	}

	public String getrTime() {
		return rTime;
	}

	public void setrTime(String rTime) {
		this.rTime = rTime;
	}

	
	
    
    
}
