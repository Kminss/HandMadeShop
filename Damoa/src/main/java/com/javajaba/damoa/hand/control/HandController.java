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

import com.damoa.hand.commons.dto.PageMakerDTO;
import com.damoa.hand.commons.utill.Criteria;
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
		//전체리스트
		int handType = 0;
		List<HandDTO> list = handService.list(handType);
		model.addAttribute("list", list);
		return "/hand/hand_main";
	}

	  /* 게시판 목록 페이지 접속(페이징 적용) */
	@RequestMapping("/list")
    public String list(Model model, Criteria cri, String handType) {
        
        logger.info("boardListGET");
        Map<String, Object> map = new HashMap<String, Object>();
        logger.info("page :" + cri.getPageNum() + "amount : " + cri.getAmount());
        map.put("cri", cri);
        if(handType != null) {
		map.put("handType", Integer.parseInt(handType));}
        model.addAttribute("list", handService.getListPaging(map));
        
        int total = handService.getListTotal();
        PageMakerDTO pageMakerDTO = new PageMakerDTO(cri, total);
        model.addAttribute("pageMaker",  new PageMakerDTO(cri, total));
        return "/hand/list";
    }    
	/*
	 * @RequestMapping("/list") public String list(Model model, @RequestParam int
	 * handType) { List<HandDTO> list = handService.list(handType);
	 * model.addAttribute("list", list); return "../../list"; }
	 */

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		return "/hand/hand_insert";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(HandDTO handDTO) {
		logger.info("리스트 : " + handDTO.getHandImgList());
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
