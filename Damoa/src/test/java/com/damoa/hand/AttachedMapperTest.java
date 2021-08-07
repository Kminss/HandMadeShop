package com.damoa.hand;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.javajaba.damoa.hand.dao.HandDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AttachedMapperTest {
	@Autowired
	HandDAO handDAO;
	
	@Test
	public void getAttachListTests() {
		
		int handNum = 89;
		
		System.out.println("이미지 정보 : " + handDAO.listFile(handNum).size());
		
		
	}
}
