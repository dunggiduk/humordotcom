package com.heeeun.boardsite.member;

import java.sql.Date;

public class Member {
	
	private String mId;
	private String mPassword;
	private String mMail;
	private String mNick;
	private int mActivity;
	private String mGrade;
	private Date mJoinDate;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String mId, String mPassword, String mMail, String mNick, int mActivity, String mGrade,
			Date mJoinDate) {
		super();
		this.mId = mId;
		this.mPassword = mPassword;
		this.mMail = mMail;
		this.mNick = mNick;
		this.mActivity = mActivity;
		this.mGrade = mGrade;
		this.mJoinDate = mJoinDate;
	}

	@Override
	public String toString() {
		return "member [mId=" + mId + ", mPassword=" + mPassword + ", mMail=" + mMail + ", mNick=" + mNick
				+ ", mActivity=" + mActivity + ", mGrade=" + mGrade + ", mJoinDate=" + mJoinDate + "]";
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPassword() {
		return mPassword;
	}

	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}

	public String getmMail() {
		return mMail;
	}

	public void setmMail(String mMail) {
		this.mMail = mMail;
	}

	public String getmNick() {
		return mNick;
	}

	public void setmNick(String mNick) {
		this.mNick = mNick;
	}

	public int getmActivity() {
		return mActivity;
	}

	public void setmActivity(int mActivity) {
		this.mActivity = mActivity;
	}

	public String getmGrade() {
		return mGrade;
	}

	public void setmGrade(String mGrade) {
		this.mGrade = mGrade;
	}

	public Date getmJoinDate() {
		return mJoinDate;
	}

	public void setmJoinDate(Date mJoinDate) {
		this.mJoinDate = mJoinDate;
	}

	
}
