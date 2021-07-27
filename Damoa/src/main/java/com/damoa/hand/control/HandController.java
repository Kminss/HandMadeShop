package com.damoa.hand.control;

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

import com.damoa.hand.dto.HandDTO;
import com.damoa.hand.service.HandService;

@Controller
@RequestMapping("/hand/*")
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
		return "redirect:/hand/list";
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
	public String delete(@RequestParam int handNum, HttpServletRequest request) {

		String mId = (String) request.getSession().getAttribute("mId");
		logger.info(mId);
		if (mId != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mId", mId);
			map.put("handNum", handNum);
			handService.delete(map);
			return "/hand/hand_list";
		} else {
			return "redirect:/member/login";
		}

	}
}
