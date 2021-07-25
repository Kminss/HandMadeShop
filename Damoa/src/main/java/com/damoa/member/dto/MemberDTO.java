package com.damoa.member.dto;

import org.springframework.stereotype.Component;

@Component
public class MemberDTO {
	private int mNo; //회원번호
	private String mId; //아이디
	private String mName; //이름
	private String mPw; //비번
	private String mPh; //전화번호
	private String mEmail; //이메일
	private String mAddr; //주소
	private String mBirth; //생년월일
	private String mreg; //등록일
	private int mAdmin;  //관리자확인 1=관리자 0=회원

	
	public int getmNo() {
		return mNo;
	}


	public void setmNo(int mNo) {
		this.mNo = mNo;
	}


	public String getmId() {
		return mId;
	}


	public void setmId(String mId) {
		this.mId = mId;
	}


	public String getmName() {
		return mName;
	}


	public void setmName(String mName) {
		this.mName = mName;
	}


	public String getmPw() {
		return mPw;
	}


	public void setmPw(String mPw) {
		this.mPw = mPw;
	}


	public String getmPh() {
		return mPh;
	}


	public void setmPh(String mPh) {
		this.mPh = mPh;
	}


	public String getmEmail() {
		return mEmail;
	}


	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}


	public String getmAddr() {
		return mAddr;
	}


	public void setmAddr(String mAddr) {
		this.mAddr = mAddr;
	}


	public String getmBirth() {
		return mBirth;
	}


	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}


	public String getMreg() {
		return mreg;
	}


	public void setMreg(String mreg) {
		this.mreg = mreg;
	}


	public int getmAdmin() {
		return mAdmin;
	}


	public void setmAdmin(int mAdmin) {
		this.mAdmin = mAdmin;
	}


	@Override
	public String toString() {
		return "MemberDTO [mId=" + mId + ", mName=" + mName + ", mPw=" + mPw + ", mPh=" + mPh + ", mEmail=" + mEmail
				+ ", mAddr=" + mAddr + ", mBirth=" + mBirth + ", mreg=" + mreg + ", mAdmin=" + mAdmin + "]";
	}

}
