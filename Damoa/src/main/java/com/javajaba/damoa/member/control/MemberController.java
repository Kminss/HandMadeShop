package com.javajaba.damoa.member.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javajaba.damoa.member.dto.MemberDTO;
import com.javajaba.damoa.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	MemberService memberService;

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		request.getSession().setAttribute("referer", referer);
		return "./member/login";
	}

	// 아이디와 비밀번호를 파라미터로 받아서 맵에 저장 후 전달해 해당 멤버dto 받아옴
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam String mId, @RequestParam String mPw, HttpServletRequest request) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("mId", mId);
		map.put("mPw", mPw);
		MemberDTO memberDTO = memberService.Login(map);
		String referer = (String) request.getSession().getAttribute("referer");
		//아이디 존재x 또는 틀렸을 경우
		if (memberDTO == null) { return "/member/login_view"; }
		
		//아이디 존재 할 경우
		request.getSession().setAttribute("member", memberDTO);
		
		
		//로그인 후 요청페이지 이동
		logger.info("url...." + referer);
		if (referer == null) {return "redirect:/";}		
		return "redirect: " + referer;
	}
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "/member/join";

	}

	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MemberDTO memberDTO) {
		memberService.join(memberDTO);
		return "redirect:/";
	}

	// 아이디중복확인 validate 플러그인을 통해 ajax로 받음
	@ResponseBody
	@RequestMapping(value = "/checkId")
	public boolean checkId(String mId) {
		return memberService.checkId(mId);
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logOut(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/";
	}
	//마이페이지
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage() {
		return "/member/mypage";
	}
	//회원정보 수정
	@RequestMapping(value = "/mUpdate", method = RequestMethod.GET)
	public String update() {
		return "/member/update";
	}
	
	@RequestMapping(value = "/mUpdate", method = RequestMethod.POST)
	public String update(MemberDTO memberDTO, HttpServletRequest request) {
		request.getSession().invalidate();
		memberService.update(memberDTO);
		return "redirect:/";
	}
	//회원정보 삭제
}
