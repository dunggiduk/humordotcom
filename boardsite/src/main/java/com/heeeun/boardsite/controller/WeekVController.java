package com.heeeun.boardsite.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import static org.springframework.web.bind.annotation.RequestMethod.*;

import java.util.HashMap;

import com.heeeun.boardsite.weekv.WeekV;
import com.heeeun.boardsite.weekv.WeekVService;

@Controller
public class WeekVController {

	@Autowired
	private WeekVService weekVService;

	public void setWeekVService(WeekVService weekVService) {
		this.weekVService = weekVService;
	}
	
	@RequestMapping(value="/WeekV_action.do",method=POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String insertweekV(@ModelAttribute WeekV weekV) throws Exception{
		System.err.println(weekV);
		weekVService.insertweekV(weekV);
		return "1";
	}
	
	@RequestMapping(value="/WeekVselectWBymId.do",method=POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String selectWBymId(@ModelAttribute WeekV weekV) throws Exception{
		System.err.println(weekV);
		weekVService.selectWBymId(weekV.getmId());
		return "이미 투표에 참여하셨습니다";
	}

	@RequestMapping(value="/WeekVResult.do",method=POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody HashMap WeekVResult() throws Exception{
		double a = weekVService.selectWAll();
		double o = weekVService.selectWByOne();
		double t = weekVService.selectWByTwo();
		//System.err.println("o"+o+"t"+t);
		double one = weekVService.selectWByOne()/a * 100;
		double two = weekVService.selectWByTwo()/a * 100;
		//System.err.println("a="+a+"&one="+one+"&two="+two);
		HashMap objecList = new HashMap();
		objecList.put("oneP", one);
		objecList.put("twoP", two);
		objecList.put("one", o);
		objecList.put("two", t);
		objecList.put("two", t);
		objecList.put("all", a);
//		req.setAttribute("one", one);
//		req.setAttribute("two", two);
		
		return objecList;
	}
}
