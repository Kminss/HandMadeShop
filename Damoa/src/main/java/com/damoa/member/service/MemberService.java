package com.damoa.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoa.member.dao.MemberDAO;
import com.damoa.member.dto.MemberDTO;

@Service
public class MemberService {
	@Autowired
	MemberDAO memberDAO;
	//회원가입
	public void join(MemberDTO memberDTO) {
		memberDAO.join(memberDTO);
	}
	//아이디 중복확인
	public int checkId(String mId) {
		return memberDAO.checkId(mId);
	}
}
