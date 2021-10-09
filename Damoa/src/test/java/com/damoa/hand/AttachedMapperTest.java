package com.damoa.hand;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.javajaba.damoa.hand.commons.utill.Criteria;
import com.javajaba.damoa.hand.dao.FileDAO;
import com.javajaba.damoa.hand.dao.HandDAO;
import com.javajaba.damoa.hand.dto.HandDTO;
import com.javajaba.damoa.hand.dto.OrderDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AttachedMapperTest {
	@Autowired
	HandDAO handDAO;
	@Autowired
	FileDAO fileDAO;
	@Test
	public void orderINsert() {
		OrderDTO order = new OrderDTO();
//		order.setHandNum(51);
//		order.setmId("test");
//		order.setOrderRec("test");
//		order.setOrderAddr1("1");
//		order.setOrderAddr2("2");
//		order.setOrderAddr3("3");
//		order.setOrderPh("010");
//		handDAO.orderInsert(order);
		//order = handDAO.orderDetail(8);
		//System.out.println(order);
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		list = handDAO.myOrder("test");
		System.out.println(list);
		
	}
//	public void getAttachListTests() {
//		
//		int handNum = 89;
//		int handType = 0;
//		 Map<String, Object> map = new HashMap<String, Object>();
//		 Criteria cri = new Criteria();
//	        map.put("cri", cri);
//			map.put("handType", handType);
//			List<HandDTO> list =  handDAO.getListPaging(map);
//			for (int i = 0; i < list.size(); i++) {
//				list.get(i).setHandImgList(fileDAO.listFile(list.get(i).getHandNum()));
//			}
//		for (HandDTO handDTO : list) {
//			System.out.println(handDTO);
//		}
		
	}
