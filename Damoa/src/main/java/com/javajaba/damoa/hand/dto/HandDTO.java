package com.javajaba.damoa.hand.dto;

import java.io.File;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class HandDTO {
	private String mId;
	private int handNum;
	private String handTitle;
	private String handContent;
	private int handType;
	private int handPrice;
	private Date handDate;
	private Date handUpdate;
	private int handViewCnt;
	
	//파일 관련
	private String handFiles[];
	private int handFileCnt;

	public int getHandFileCnt() {
		return handFileCnt;
	}

	public void setHandFileCnt(int handFileCnt) {
		this.handFileCnt = handFileCnt;
	}

	public int getHandViewCnt() {
		return handViewCnt;
	}

	public void setHandViewCnt(int handViewCnt) {
		this.handViewCnt = handViewCnt;
	}

	public String[] getHandFiles() {
		return handFiles;
	}

	public void setHandFiles(String[] handFiles) {
		//filecnt값을 files 길이만큼 수정셋
		setHandFileCnt(handFiles.length);
		this.handFiles = handFiles;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public int getHandNum() {
		return handNum;
	}

	public void setHandNum(int handNum) {
		this.handNum = handNum;
	}

	public String getHandTitle() {
		return handTitle;
	}

	public void setHandTitle(String handTitle) {
		this.handTitle = handTitle;
	}

	public int getHandType() {
		return handType;
	}

	public void setHandType(int handType) {
		this.handType = handType;
	}

	public Date getHandDate() {
		return handDate;
	}

	public void setHandDate(Date handDate) {
		this.handDate = handDate;
	}

	public Date getHandUpdate() {
		return handUpdate;
	}

	public void setHandUpdate(Date handUpdate) {
		this.handUpdate = handUpdate;
	}

	public String getHandContent() {
		return handContent;
	}

	public void setHandContent(String handContent) {
		this.handContent = handContent;
	}

	public int getHandPrice() {
		return handPrice;
	}

	public void setHandPrice(int handPrice) {
		this.handPrice = handPrice;
	}
	@Override
	public String toString() {
		return "HandDTO [mId=" + mId + ", handNum=" + handNum + ", handTitle=" + handTitle + ", handContent="
				+ handContent + ", handType=" + handType + ", handPrice=" + handPrice + ", handDate=" + handDate
				+ ", handUpdate=" + handUpdate + "]";
	}
}
