package com.heeeun.boardsite.board;

import java.util.List;


public class Board {
	
    private int bNo;
    private String mId;
    private String bIp;
    private String bNick;
    private String bGrade;
    private String bPassword;
    private String bTitle;
    private String bContent;
    private String bDay;
    private String bTime;
    private int bViews;
    private String bImage;
    private int bVote;
    private List<Vote> Vote;
    private List<BReply> bReply;

	public Board() {
		// TODO Auto-generated constructor stub
	}


	public Board(int bNo, String mId, String bIp, String bNick, String bGrade, String bPassword, String bTitle,
			String bContent, String bDay, String bTime, int bViews, String bImage, int bVote,
			List<com.heeeun.boardsite.board.Vote> vote, List<BReply> bReply) {
		super();
		this.bNo = bNo;
		this.mId = mId;
		this.bIp = bIp;
		this.bNick = bNick;
		this.bGrade = bGrade;
		this.bPassword = bPassword;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bDay = bDay;
		this.bTime = bTime;
		this.bViews = bViews;
		this.bImage = bImage;
		this.bVote = bVote;
		Vote = vote;
		this.bReply = bReply;
	}


	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", mId=" + mId + ", bIp=" + bIp + ", bNick=" + bNick + ", bGrade=" + bGrade
				+ ", bPassword=" + bPassword + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bDay=" + bDay
				+ ", bTime=" + bTime + ", bViews=" + bViews + ", bImage=" + bImage + ", bVote=" + bVote + ", Vote="
				+ Vote + ", bReply=" + bReply + "]";
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
	
	public String getbIp() {
		return bIp;
	}


	public void setbIp(String bIp) {
		this.bIp = bIp;
	}


	public String getbNick() {
		return bNick;
	}

	public void setbNick(String bNick) {
		this.bNick = bNick;
	}

	public String getbGrade() {
		return bGrade;
	}


	public void setbGrade(String bGrade) {
		this.bGrade = bGrade;
	}


	public String getbPassword() {
		return bPassword;
	}

	public void setbPassword(String bPassword) {
		this.bPassword = bPassword;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbDay() {
		return bDay;
	}

	public void setbDay(String bDay) {
		this.bDay = bDay;
	}

	public String getbTime() {
		return bTime;
	}

	public void setbTime(String bTime) {
		this.bTime = bTime;
	}

	public int getbViews() {
		return bViews;
	}

	public void setbViews(int bViews) {
		this.bViews = bViews;
	}
    
	public String getbImage() {
		return bImage;
	}

	public void setbImage(String bImage) {
		this.bImage = bImage;
	}

	public int getbVote() {
		return bVote;
	}

	public void setbVote(int bVote) {
		this.bVote = bVote;
	}

	public List<Vote> getVote() {
		return Vote;
	}

	public void setVote(List<Vote> vote) {
		Vote = vote;
	}

	public List<BReply> getbReply() {
		return bReply;
	}

	public void setbReply(List<BReply> bReply) {
		this.bReply = bReply;
	}

}
