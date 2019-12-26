package com.heeeun.boardsite.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class MemberDaoImpl implements MemberDao {
	public static final String namespace = "com.heeeun.boardsite.mapper.memberMapper.";

	private SqlSession sqlsession;

	@Override
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	/*
	 Member +
	 */
	@Override
	public boolean insertMember(Member member) throws Exception {
		boolean insertOk = false;
		int insertNumber = sqlsession.insert(namespace + "insertMember", member);
			if (insertNumber == 1) {
				insertOk = true;
			}
		return insertOk;
	}
	
	/*
	 Member update
	 */
	@Override
	public boolean updateMember(Member member) throws Exception {
		boolean updateOk = false;
		int updateNumber = sqlsession.update(namespace + "updateMember", member);
		if(updateNumber == 1) {
			updateOk = true;
		}
		return updateOk;
	}
	
	/*
	 Member delete
	 */
	@Override
	public boolean deleteMember(String mId) throws Exception {
		boolean deleteOk = false;
		int deleteNumber = sqlsession.update(namespace + "deleteMember", mId);
		if(deleteNumber == 1) {
			deleteOk = true;
		}
		return deleteOk;
	}
	
	/*
	 Select All
	 */
	@Override
	public List<Member> selectAll() throws Exception {
		List<Member> allMember = sqlsession.selectList(namespace + "selectAll");
		return allMember;
	}
	
	/*
	 Select All
	 */
	@Override
	public List<Member> selectAAll() throws Exception {
		List<Member> allMember = sqlsession.selectList(namespace + "selectAAll");
		return allMember;
	}
	
	@Override
	public List<Member> selectNAAll() throws Exception{
		List<Member> allNAMember = sqlsession.selectList(namespace + "selectNAAll");
		return allNAMember;
	}
	
	/*
	 Select By Id
	 */
	@Override
	public Member selectById(String mId) throws Exception {
		Member member = sqlsession.selectOne(namespace + "selectById", mId);
		return member;
	}
	
	/*
	 Select By mail
	 */
	@Override
	public Member selectByMail(String mMail) throws Exception {
		Member member = sqlsession.selectOne(namespace + "selectByMail", mMail);
		return member;
	}
	
	/*
	 duplication Id Check
	 */
	@Override
	public boolean duplcheckId(String mId) throws Exception {
		boolean duplOk = false;
		int idNumber = sqlsession.selectOne(namespace +"duplcheckId", mId);
		if(idNumber == 0) {
			duplOk = true;
		}
		return duplOk;
	}
	/*
	 login Member
	 */
	public Member loginMember(Member member) throws Exception {
		return sqlsession.selectOne(namespace +"loginMember", member);
	
	}

}
