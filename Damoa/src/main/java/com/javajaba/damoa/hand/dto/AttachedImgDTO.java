package com.javajaba.damoa.hand.dto;

import org.springframework.stereotype.Component;

@Component
public class AttachedImgDTO {
	private String uploadPath;
	private String fileName;
	private String uuid;
	private int handNum;
	
	public int getHandNum() {
		return handNum;
	}
	public void setHandNum(int handNum) {
		this.handNum = handNum;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	@Override
	public String toString() {
		return "AttachedImgDTO [uploadPath=" + uploadPath + ", fileName=" + fileName + ", uuid=" + uuid
				+ ", handNum = " + handNum +  "]";
	}
	
}
