package com.heeeun.boardsite.weekv;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("WeekVService")
public class WeekVServiceImpl implements WeekVService {

	@Autowired
	private WeekVDao weekVDao;

	@Override
	public void setWeekVDao(WeekVDao weekVDao) {
		this.weekVDao = weekVDao;
	}
	
	@Override
	public boolean insertweekV(WeekV weekV) throws Exception {
		return weekVDao.insertweekV(weekV);
		
	}
	
	@Override
	public int selectWAll() throws Exception {
		return weekVDao.selectWAll();
	}
	
	@Override
	public WeekV selectWBymId(String mId) throws Exception {
		return weekVDao.selectWBymId(mId);
	}
	
	@Override
	public int selectWByOne() throws Exception {
		return weekVDao.selectWByOne();
		
	}
	
	@Override
	public int selectWByTwo() throws Exception {
		return weekVDao.selectWByTwo();
		
	}
	
}
