package com.javajaba.damoa.hand.control;
import java.text.DecimalFormat;
import java.util.Calendar;
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
import com.javajaba.damoa.hand.commons.dto.PageMakerDTO;
import com.javajaba.damoa.hand.commons.utill.Criteria;
import com.javajaba.damoa.hand.dto.HandDTO;
import com.javajaba.damoa.hand.dto.MemberDTO;
import com.javajaba.damoa.hand.dto.OrderDTO;
import com.javajaba.damoa.hand.service.FileService;
import com.javajaba.damoa.hand.service.HandService;

@Controller
@RequestMapping("/hand")
public class HandController {
	private static Logger logger = LoggerFactory.getLogger(HandController.class);
	@Autowired
	HandService handService;
	@Autowired
	FileService fileService;

	/* 게시판 목록 페이지 접속(페이징 적용) */
	@RequestMapping("/list")
	public String list(Model model, Criteria cri, @RequestParam(value = "handType", defaultValue = "0") int handType) {

		Map<String, Object> map = new HashMap<String, Object>();
		if (cri == null) {
			cri = new Criteria();
		}
		map.put("cri", cri);
		map.put("handType", handType);

		List<HandDTO> list = handService.getListPaging(map);
		model.addAttribute("list", list);
		logger.info("리스트..." + list);
		int total = handService.getListTotal(map);
		;
		PageMakerDTO pageMakerDTO = new PageMakerDTO(cri, total);
		logger.info("amount...." + pageMakerDTO.getCri().getAmount());
		model.addAttribute("pageMaker", pageMakerDTO);

		return "/hand/hand_list";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		return "/hand/hand_insert";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(HandDTO handDTO) {
		handService.write(handDTO);
		return "redirect:/hand/myList";
	}

	@RequestMapping(value = "/detail")
	public String select(Model model, @RequestParam int handNum) {
		HandDTO handDTO = handService.detail(handNum);
		logger.info("detail....." + handDTO);
		model.addAttribute("handDTO", handDTO);
		return "/hand/hand_detail";

	}

	@RequestMapping("/myList")
	public String myList(Model model, HttpServletRequest request, Criteria cri) {
		Map<String, Object> map = new HashMap<String, Object>();
		MemberDTO member = (MemberDTO) request.getSession().getAttribute("member");
		String mId = member.getmId();
		map.put("mId", mId);
		logger.info("cri....." + cri == null ? "yes" : "no");
		if (cri == null) {
			cri = new Criteria();
		}
		map.put("cri", cri);

		List<HandDTO> myList = handService.getMyList(map);
		if (!myList.isEmpty()) {
			model.addAttribute("myList", myList);
			int total = handService.getListTotal(map);
			PageMakerDTO pageMakerDTO = new PageMakerDTO(cri, total);
			model.addAttribute("pageMaker", pageMakerDTO);
		}
		return "/hand/hand_my_list";

	}

	@RequestMapping("/update")
	public String update(Model model,int handNum) {
		HandDTO handDTO = handService.detail(handNum);
		model.addAttribute("handDTO", handDTO);
		return "/hand/hand_update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(HandDTO handDTO) {
		logger.info("update" + handDTO);
		
		handService.update(handDTO);
		return "redirect:/hand/myList";
	}

	@RequestMapping(value = "/delete")
	@ResponseBody
	public String delete(int handNum ) {
			fileService.deleteFile(handNum);
			int delete = handService.delete(handNum);
			String result = "";
			if (delete > 0) {
				
				result = "success";
			} else {
				result = "fail";
			}
			return result;
	}

	// 주문 입력
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(Model model, @RequestParam int handNum) {
		// 주문할 상품정보 전달
		HandDTO handDTO = handService.detail(handNum);
		model.addAttribute("handDTO", handDTO);
		return "/hand/hand_order";
	}

	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String order(Model model, OrderDTO orderDTO) {
		logger.info("" + orderDTO);

		// 주문번호 부여
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		 
		 for(int i = 1; i <= 6; i ++) {
		  subNum += (int)(Math.random() * 10);
		 }
		 
		 String orderId = ymd + "_" + subNum;

		orderDTO.setOrderId(orderId);
		handService.orderInsert(orderDTO);
		model.addAttribute("orderDTO", orderDTO);

		HandDTO handDTO = handService.detail(orderDTO.getHandNum());
		model.addAttribute("handDTO", handDTO);
		return "/hand/hand_order_view";
	}

	// 주문 내역
	@RequestMapping(value = "/myOrder")
	public String myOrder(Model model, HttpServletRequest request) {
		MemberDTO member = (MemberDTO) request.getSession().getAttribute("member");
		String mId = member.getmId();
		List<OrderDTO> list = handService.myOrder(mId);
		model.addAttribute("orderList", list);
		return "/hand/hand_my_order";
	}
	//주문 상세
	@RequestMapping(value = "/orderDetail")
	public String orderDetail(Model model, @RequestParam String orderId) {
		OrderDTO orderDTO = handService.orderDetail(orderId);
		HandDTO handDTO = handService.detail(orderDTO.getHandNum());
		model.addAttribute("orderDTO", orderDTO);
		model.addAttribute("handDTO", handDTO);
		return "/hand/hand_order_detail";
	}
	// 주문 취소
	@RequestMapping(value = "/orderDelete")
	public String orderDelete(Model model, @RequestParam String orderId) {
		handService.orderDelete(orderId);
		return "redirect:/hand/myOrder";
	}
	
}
