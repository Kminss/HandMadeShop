package com.damoa.member.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.damoa.member.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void join(MemberDTO memberDTO) {
		sqlSessionTemplate.insert("join", memberDTO);
	}
	
	public int checkId(String mId) {
		return sqlSessionTemplate.selectOne("checkId", mId);
	}
	
	public MemberDTO login(Map<String, String> map) {
		return sqlSessionTemplate.selectOne("login", map);
	}
}
