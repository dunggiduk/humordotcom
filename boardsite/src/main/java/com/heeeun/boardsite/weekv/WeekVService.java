package com.heeeun.boardsite.weekv;

public interface WeekVService {

	void setWeekVDao(WeekVDao weekVDao);

	boolean insertweekV(WeekV weekV) throws Exception;

	WeekV selectWBymId(String mId) throws Exception;

	int selectWByOne() throws Exception;

	int selectWByTwo() throws Exception;

	int selectWAll() throws Exception;

}