package com.damoa.hand;

import org.junit.Test;   
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.damoa.hand.dao.HandDAO;
import com.damoa.hand.dto.HandDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MapperTest {
	@Autowired
	HandDAO handDAO;
	@Test
	public void write() {
		HandDTO handDTO = new HandDTO();
		handDTO.setmId("test");
		handDTO.setHandTitle("test");
		handDTO.setHandContent("test");
		handDTO.setHandType(3);
		handDAO.write(handDTO);
		
	}
}
