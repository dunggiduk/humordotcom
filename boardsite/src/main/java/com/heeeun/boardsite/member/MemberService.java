package com.heeeun.boardsite.member;

import java.util.List;


public interface MemberService {

	void setMemberDao(MemberDao memberDao);

	/*
	 Member +
	 */
	boolean insertMember(Member member) throws Exception;

	/*
	 Member update
	 */
	boolean updateMember(Member member) throws Exception;

	/*
	 Member delete
	 */
	boolean deleteMember(String mId) throws Exception;

	/*
	 Select All
	 */
	List<Member> selectAll() throws Exception;

	/*
	 Select By Id
	 */
	Member selectById(String mId) throws Exception;

	/*
	 duplication Id Check
	 */
	boolean duplcheckId(String mId) throws Exception;

	/*
	 login Member
	 */
	Member loginMember(Member member) throws Exception;

	Member selectByMail(String mMail) throws Exception;
}