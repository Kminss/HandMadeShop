package com.javajaba.damoa.member.service;

import java.util.Map; 

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.javajaba.damoa.member.dao.MemberDAO;
import com.javajaba.damoa.member.dto.MemberDTO;

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

	public MemberDTO Login(Map<String, String> map) {
		return memberDAO.login(map);
	}
}
