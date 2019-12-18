package com.heeeun.boardsite.weekv;

import org.apache.ibatis.session.SqlSession;

public interface WeekVDao {

	void setSqlSession(SqlSession sqlsession);

	boolean insertweekV(WeekV weekV) throws Exception;

	WeekV selectWBymId(String mId) throws Exception;

	int selectWByOne() throws Exception;

	int selectWByTwo() throws Exception;

	int selectWAll() throws Exception;

}