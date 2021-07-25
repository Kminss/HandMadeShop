package com.damoa.member.control;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.damoa.member.dto.MemberDTO;
import com.damoa.member.service.MemberService;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	MemberService memberService;
	//로그인
	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public String login() {
		return "./member/login";
	}
	
	@RequestMapping(value = "/Join", method = RequestMethod.GET)
	public String join() {
		return "./member/join";
		
	}
	//회원가입
	@RequestMapping(value = "/Join", method = RequestMethod.POST)
	public String join(MemberDTO memberDTO) {
		return "redirect:/";
	}
	
	//아이디중복확인 validate 플러그인을 통해 ajax로 받음
	@RequestMapping(value = "/CheckId", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String CheckId(String mId) {
		int result = memberService.checkId(mId);
		if (result == 0) {  // 1인경우 아이디 존재.
			return "true"; 
		} else {
			return "false";
		}
	}
}
