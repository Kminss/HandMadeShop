package com.damoa.member;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.damoa.member.dto.MemberDTO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTest implements Cloneable {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

//	@Test
//	public void test() {
//		MemberDTO memberDTO = new MemberDTO();
//		memberDTO.setmId("test");
//		memberDTO.setmPw("test");
//		memberDTO.setmBirth("960722");
//		memberDTO.setmEmail("test");
//		memberDTO.setmAddr("test");
//		memberDTO.setmName("test");
//		memberDTO.setmPh("213213");
//		memberDAO.join(memberDTO);
//	}
	/*@Test
	public void checkId() throws Exception {
		String mId = "admin";
		String mId1 = "abcd";
		int c = sqlSessionTemplate.selectOne("checkId",mId);
		System.out.println(c);
		// memberDAO.checkId(mId);
	}*/
	@Test
	public void login() throws Exception {
		String mId = "test";
		String mPw = "test";
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setmId(mId);
		memberDTO.setmPw("12");
		memberDTO = sqlSessionTemplate.selectOne("login",memberDTO);
		System.out.println(memberDTO);
	}

}
