package com.javajaba.damoa.hand.dto;

import org.springframework.stereotype.Component;

@Component
public class AttachedImgDTO {
	private String uploadPath;
	private String fileName;
	private String uuid;
	private int attachedNum;
	
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
	public int getAttachedNum() {
		return attachedNum;
	}
	public void setAttachedNum(int attachedNum) {
		this.attachedNum = attachedNum;
	}
	@Override
	public String toString() {
		return "AttachedImgDTO [uploadPath=" + uploadPath + ", fileName=" + fileName + ", uuid=" + uuid
				+ ", attachedNum=" + attachedNum + "]";
	}
	
}
