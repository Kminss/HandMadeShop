package com.damoa.member.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoa.member.dao.MemberDAO;
import com.damoa.member.dto.MemberDTO;

@Service
public class MemberService {
	private static Logger logger = LoggerFactory.getLogger(MemberService.class);
	@Autowired
	MemberDAO memberDAO;
	
	//회원가입
	public void join(MemberDTO memberDTO) {
		memberDAO.join(memberDTO);
	}
	//아이디 중복확인
	public int checkId(String mId) {
		logger.info(mId);
		return memberDAO.checkId(mId);
	}
	
	public MemberDTO Login(Map<String, String> map) {
		return memberDAO.login(map);
	}
}
