package com.javajaba.damoa.hand.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javajaba.damoa.hand.dto.HandDTO;
import com.javajaba.damoa.hand.service.HandService;
import com.javajaba.damoa.member.dto.MemberDTO;

@Controller
@RequestMapping("/hand")
public class HandController {
	private static Logger logger = LoggerFactory.getLogger(HandController.class);
	@Autowired
	HandService handService;

	@RequestMapping("/main")
	public String main(Model model) {
		List<HandDTO> list = handService.list();
		model.addAttribute("list", list);
		return "/hand/hand_main";
	}

	@RequestMapping("/list")
	public String list(Model model) {
		List<HandDTO> list = handService.list();
		model.addAttribute("list", list);
		return "/hand/hand_list";

	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		return "/hand/hand_insert";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(HandDTO handDTO) {
		handService.write(handDTO);
		return "redirect:./list";
	}

	@RequestMapping(value = "/select")
	public String select(Model model, @RequestParam int handNum) {
		model.addAttribute("handDTO", handService.select(handNum));
		return "/hand/hand_select";
	}

	@RequestMapping("/update")
	public String update() {
		return "/hand/hand_update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(HandDTO handDTO) {
		logger.info("update" + handDTO);
		handService.update(handDTO);
		return "/hand/hand_list";
	}

	@RequestMapping(value = "/delete")
	@ResponseBody
	public String delete(int handNum, HttpServletRequest request) {

		MemberDTO member = (MemberDTO) request.getSession().getAttribute("member");
		String mId = member.getmId();
		
		logger.info("handNum :" + handNum);
		logger.info(mId);
		if (mId != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mId", mId);
			map.put("handNum", handNum);
			int  delete =  handService.delete(map);
			String result = "";
			if (delete > 0) {
				result = "success";
			} else {
				result = "fail";
			}
			return result;
		} else {
			return "/member/login";
		}
	}
}
