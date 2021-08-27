package com.javajaba.damoa.hand.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javajaba.damoa.hand.dao.FileDAO;
import com.javajaba.damoa.hand.dto.AttachedImgDTO;

@Service
public class FileService {
	@Autowired
	FileDAO fileDAO;
	
	//파일첨부
	public void addFile(AttachedImgDTO attachedImgDTO) {
		fileDAO.addFile(attachedImgDTO);
	}
	//첨부파일리스트
	public List<AttachedImgDTO> listFile(int handNum) {
		return fileDAO.listFile(handNum);
	}
}
