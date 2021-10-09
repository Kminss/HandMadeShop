package com.javajaba.damoa.member.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javajaba.damoa.member.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	//회원가입
	public void join(MemberDTO memberDTO) {
		sqlSessionTemplate.insert("join", memberDTO);
	}
	//아이디 중복확인
	public boolean checkId(String mId) {
		return sqlSessionTemplate.selectOne("checkId", mId);
	}
	//로그인
	public MemberDTO login(Map<String, String> map) {
		return sqlSessionTemplate.selectOne("login", map);
	}
	//회원 정보
	public MemberDTO detail(String mId) {
		return sqlSessionTemplate.selectOne("detail", mId);
	}
	//회원 수정
	public void update(MemberDTO memberDTO) {
		sqlSessionTemplate.update("memberUpdate", memberDTO);
	}
	
	//회원 탈퇴
	public void delete(String mId) {
		sqlSessionTemplate.delete("memberDelete",mId);
	}
}
