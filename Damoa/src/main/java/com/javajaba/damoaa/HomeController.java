package com.javajaba.damoaa;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javajaba.damoa.hand.dto.HandDTO;
import com.javajaba.damoa.hand.service.HandService;

@Controller
public class HomeController {
	@Autowired
	HandService handService;

	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(Model model) {
		List<HandDTO> list = handService.list();
		model.addAttribute("list", list);
		return "/index";
	}
}
