package com.heeeun.boardsite.member;

import java.util.List;


public class MemberServiceImpl implements MemberService {
	
	private MemberDao memberDao;

	@Override
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	/*
	 Member +
	 */
	@Override
	public boolean insertMember(Member member) throws Exception {
		return memberDao.insertMember(member);
	}
	
	/*
	 Member update
	 */
	@Override
	public boolean updateMember(Member member) throws Exception {
		return memberDao.updateMember(member);
	}
	
	/*
	 Member delete
	 */
	@Override
	public boolean deleteMember(String mId) throws Exception {
		return memberDao.deleteMember(mId);
	}
	
	/*
	 Select All
	 */
	@Override
	public List<Member> selectAll() throws Exception {
		return memberDao.selectAll();
	}
	
	/*
	 Select By Id
	 */
	@Override
	public Member selectById(String mId) throws Exception {
		return memberDao.selectById(mId);
	}
	
	/*
	 Select By mail
	 */
	@Override
	public Member selectByMail(String mMail) throws Exception {
		return memberDao.selectByMail(mMail);
	}
	
	/*
	 duplication Id Check
	 */
	@Override
	public boolean duplcheckId(String mId) throws Exception {
		return memberDao.duplcheckId(mId);
	}
	/*
	 login Member
	 */
	public Member loginMember(Member member) throws Exception {
		return memberDao.loginMember(member);
	}
}
