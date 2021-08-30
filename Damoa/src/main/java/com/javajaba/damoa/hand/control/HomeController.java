package com.javajaba.damoa.hand.control;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javajaba.damoa.hand.dto.HandDTO;
import com.javajaba.damoa.hand.service.FileService;
import com.javajaba.damoa.hand.service.HandService;

@Controller
public class HomeController {
	private static Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	HandService handService;
	@Autowired
	FileService fileService;
	
	@RequestMapping(value = "/")
	public String main(Model model) { // 최신 12개
		List<HandDTO> list = handService.newList();
		model.addAttribute("list", list);
		return "index";
	}
}
