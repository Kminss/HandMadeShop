package com.damoa.hand;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;   
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.damoa.hand.commons.utill.Criteria;
import com.javajaba.damoa.hand.dao.HandDAO;
import com.javajaba.damoa.hand.dto.HandDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MapperTest {
	@Autowired
	HandDAO handDAO;

	/*
	 * @Test public void write() { HandDTO handDTO = new HandDTO();
	 * handDTO.setmId("test"); handDTO.setHandTitle("test");
	 * handDTO.setHandContent("test"); handDTO.setHandType(3);
	 * handDAO.write(handDTO);
	 * 
	 * }
	 */
	@Test
	public void pageList() {
		Criteria cri = new Criteria();
		cri.setKeyword("TEST85");
		int total = handDAO.getListTotal();
		System.out.println("total...." + total);
	}
//	@Test
//	public void list() {
//		int handType = 1;
//		System.out.println(handDAO.list(handType));
//	}
}
