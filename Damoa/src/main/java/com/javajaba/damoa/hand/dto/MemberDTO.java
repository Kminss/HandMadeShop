package com.javajaba.damoa.hand.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

@Component
public class MemberDTO {
	private int mNo; //회원번호
	private String mId; //아이디
	private String mName; //이름
	private String mPw; //비번
	private String mPh; //전화번호
	private String mEmail; //이메일
	private String mAddr;//주소
	private String mPost; //우편번호
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mBirth; //생년월일
	
	private String mReg; //등록일
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
	public String getmPost() {
		return mPost;
	}
	public void setmPost(String mPost) {
		this.mPost = mPost;
	}
	public Date getmBirth() {
		return mBirth;
	}
	public void setmBirth(Date mBirth) {
		this.mBirth = mBirth;
	}
	
	public String getmReg() {
		return mReg;
	}
	public void setmReg(String mReg) {
		this.mReg = mReg;
	}
	public int getmAdmin() {
		return mAdmin;
	}
	public void setmAdmin(int mAdmin) {
		this.mAdmin = mAdmin;
	}
	@Override
	public String toString() {
		return "MemberDTO [mNo=" + mNo + ", mId=" + mId + ", mName=" + mName + ", mPw=" + mPw + ", mPh=" + mPh
				+ ", mEmail=" + mEmail + ", mAddr=" + mAddr + ", mPost=" + mPost + ", mBirth=" + mBirth + ", mReg="
				+ mReg + ", mAdmin=" + mAdmin + "]";
	}
}
