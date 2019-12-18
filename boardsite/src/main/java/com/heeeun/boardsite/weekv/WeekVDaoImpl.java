package com.heeeun.boardsite.weekv;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("WeekVDao")
public class WeekVDaoImpl implements WeekVDao {
	
	public static final String namespace = "com.heeeun.boardsite.mapper.weekVMapper.";
	
	@Autowired
	private SqlSession sqlsession;

	
	@Override
	public void setSqlSession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	@Override
	public boolean insertweekV(WeekV weekV) throws Exception {
		boolean insertOk = false;
		int insertNumber = sqlsession.insert(namespace + "insertweekV", weekV);
			if (insertNumber == 1) {
				insertOk = true;
			}
		return insertOk;
	}
	
	@Override
	public int selectWAll() throws Exception {
		int result = sqlsession.selectOne(namespace + "selectWAll");
		return result;
	}
	
	@Override
	public WeekV selectWBymId(String mId) throws Exception {
		WeekV w = sqlsession.selectOne(namespace + "selectWBymId", mId);
		return w;
	}
	
	@Override
	public int selectWByOne() throws Exception{
		int result = sqlsession.selectOne(namespace + "selectWByOne");
		return result;
	}
	
	@Override
	public int selectWByTwo() throws Exception{
		int result = sqlsession.selectOne(namespace + "selectWByTwo");
		return result;
	}
}
