package com.heeeun.boardsite.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.heeeun.boardsite.member.Member;
import com.heeeun.boardsite.member.MemberService;


@Controller
public class MemberController {
	
	
	@Autowired	
	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping(value="/insert_member.do", method = RequestMethod.GET)
	public @ResponseBody String insertGetMember(@ModelAttribute Member member) throws Exception{
		return "redirect:drip_board.do";
	}
	
	@RequestMapping(value="/insert_member.do", method = RequestMethod.POST)
	public @ResponseBody String insertPostMember(@ModelAttribute Member member) throws Exception{
		System.err.println(member);
		Member m = memberService.selectById(member.getmId());
		if(m==null) {
			memberService.insertMember(member);
			return "가입되었습니다";
		} else {
			return "이미 존재하는 ";
		}
	}
	
	@RequestMapping(value="/login_member.do", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public @ResponseBody String loginMember(@ModelAttribute Member member, HttpSession session) throws Exception{
		System.err.println("member는는는"+member);
		Member m1 = memberService.selectById(member.getmId());
		System.err.println("m1은"+m1);
		if(m1!=null) {
			if(m1.getmActivity()==0) {
				if(member.getmPassword().equals(m1.getmPassword())) {
					Member m = memberService.loginMember(member);
					System.err.println(m);
					session.setAttribute("loginM",member.getmId());
					session.setAttribute("loginN", m.getmNick());
					session.setAttribute("loginG", m.getmGrade());
					session.setAttribute("loginD", m.getmJoinDate());
					System.err.println(m.getmJoinDate());
					return m.getmId();
				}else {
					return"틀림";
				}
			}else {
				return "탈퇴회원";
			}
		} 
		return "비회원";
	}
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public @ResponseBody String logout(HttpSession session) throws Exception{
		session.invalidate();
		//session.removeAttribute("loginM");
		//session.removeAttribute("loginN");
		return "로그아웃 되었습니다.";
	}
	
	@RequestMapping(value = "/id_find.do", method = RequestMethod.GET)
	public String id_find() throws Exception{
		return "id_find";
	}
	
	@RequestMapping(value = "/id_find_action.do", method = RequestMethod.POST)
	public @ResponseBody String id_find_action(@ModelAttribute Member member) throws Exception{
		Member m = memberService.selectByMail(member.getmMail());
		return m.getmId();
	}
	
	@RequestMapping(value = "/pass_find.do", method = RequestMethod.GET)
	public String pass_find() throws Exception{
		return "pass_find";
	}
	
	@RequestMapping(value = "/pass_find_action.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String pass_find_action(@ModelAttribute Member member) throws Exception{
		Member m1 = memberService.selectByMail(member.getmMail());
		if(member.getmId().trim().equals(m1.getmId().trim())) {
			int l = m1.getmPassword().length()-3;
			return m1.getmPassword().substring(0,3);
			} else {
			return "";
		}
	}
	
	@RequestMapping(value="/drip_member_detail.do", method=RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String memberDetail(@RequestParam String mId,Model model,HttpSession session) throws Exception {
		String sessionMid = (String)session.getAttribute("loginM");
		Member m = memberService.selectById(mId);
		System.err.println(m);
		if(m!=null) {
			if(mId.equals(sessionMid)) {
				model.addAttribute("m", m);
				return "member_detail";
			} else {
				return "redirect:drip_board.do";
			}
		} else {
			return "redirect:drip_board.do";
		}
	}
	
	@RequestMapping(value="/drip_member_withdrawal.do", method=RequestMethod.GET)
	public String memberWithDrawal(@RequestParam String mId,Model model,HttpSession session) throws Exception {
		String sessionMid = (String)session.getAttribute("loginM");
		Member m = memberService.selectById(mId);
		System.err.println(m);
		if(m!=null) {
			if(mId.equals(sessionMid)) {
				model.addAttribute("m", m);
				return "withdrawal";
			}
		}
		return "redirect:drip_board.do";
	}

	@RequestMapping(value="/drip_member_withdrawal_action.do", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String memberWithDrawal(@ModelAttribute Member member,Model model,HttpSession session) throws Exception {
		System.err.println("member는는는는"+member);
		String sessionMid = (String)session.getAttribute("loginM");
		Member m = memberService.selectById(member.getmId());
		System.err.println(m);
		if(m!=null) {
			if(member.getmId().equals(sessionMid)) {
				System.err.println("세션값과 멤버값이 같다");
				if(member.getmPassword().length()>0) {
					if(member.getmPassword().equals(m.getmPassword())) {
						System.err.println("삭제 일부 직전");
						memberService.deleteMember(member.getmId());
						System.err.println("삭제함");
						session.invalidate();
						return "true";
					} else {
						return "false";
					}
				} else {
					return"false3";
				}
			}
		}
		return "false2";
	}
	
	
}