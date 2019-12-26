package com.heeeun.boardsite.member;

import java.sql.Date;

/**
 * @author 21gml
 *
 */
/**
 * @author 21gml
 *
 */
public class Member {
	
	private String mId;
	private String mPassword;
	private String mMail;
	private String mNick;
	private int mActivity;
	private String mGrade;
	private Date mJoinDate;
	private int mPoint;
	private Date mDeleteDate;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String mId, String mPassword, String mMail, String mNick, int mActivity, String mGrade,
			Date mJoinDate, int mPoint, Date mDeleteDate) {
		super();
		this.mId = mId;
		this.mPassword = mPassword;
		this.mMail = mMail;
		this.mNick = mNick;
		this.mActivity = mActivity;
		this.mGrade = mGrade;
		this.mJoinDate = mJoinDate;
		this.mPoint = mPoint;
		this.mDeleteDate = mDeleteDate;
	}


	@Override
	public String toString() {
		return "Member [mId=" + mId + ", mPassword=" + mPassword + ", mMail=" + mMail + ", mNick=" + mNick
				+ ", mActivity=" + mActivity + ", mGrade=" + mGrade + ", mJoinDate=" + mJoinDate + ", mPoint=" + mPoint
				+ ", mDeleteDate=" + mDeleteDate + "]";
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

	public int getmPoint() {
		return mPoint;
	}

	public void setmPoint(int mPoint) {
		this.mPoint = mPoint;
	}

	public Date getmDeleteDate() {
		return mDeleteDate;
	}

	public void setmDeleteDate(Date mDeleteDate) {
		this.mDeleteDate = mDeleteDate;
	}

	
}
