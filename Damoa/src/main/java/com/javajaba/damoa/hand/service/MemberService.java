package com.javajaba.damoa.hand.service;

import java.util.Map; 

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javajaba.damoa.hand.dao.MemberDAO;
import com.javajaba.damoa.hand.dto.MemberDTO;

@Service
public class MemberService {
	private static Logger logger = LoggerFactory.getLogger(MemberService.class);
	@Autowired
	MemberDAO memberDAO; 

	// 회원가입
	public void join(MemberDTO memberDTO) {
		memberDAO.join(memberDTO);
	}

	// 아이디 중복확인
	public boolean checkId(String mId) {
		if (memberDAO.checkId(mId))
			return false;
		else
			return true;
	}
	//로그인
	public MemberDTO Login(Map<String, String> map) {
		return memberDAO.login(map);
	}
	
	//회원 정보
		public MemberDTO detail(String mId) {
			return memberDAO.detail(mId);
		}
		//회원 수정
		public void update(MemberDTO memberDTO) {
			memberDAO.update(memberDTO);
		}
		
		//회원 탈퇴
		public void delete(String mId) {
			memberDAO.delete(mId);
		}
}
