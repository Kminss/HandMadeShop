package com.javajaba.damoa.hand.service;

import java.io.File;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javajaba.damoa.hand.dao.HandDAO;
import com.javajaba.damoa.hand.dto.HandDTO;
import com.javajaba.damoa.upload.dao.FileUploadDAO;

@Service
public class HandService {
	@Autowired
	HandDAO handDAO;
	@Autowired
	FileUploadDAO fileUploadDAO;

	public void write(HandDTO handDTO) {
		handDAO.write(handDTO);

		String[] files = handDTO.getHandFiles();

		if (files == null) {
			return;
		} else {
			// 게시글 첨부파일 입력처리
			for (String fileName : files)
				fileUploadDAO.addFile(fileName);
		}
	}

	public List<HandDTO> list() {
		return handDAO.list();
	}

	public HandDTO select(int handNum) {
		return handDAO.select(handNum);
	}

	public void update(HandDTO handDTO) {
		handDAO.update(handDTO);
	}

	public int delete(Map<String, Object> map) {
		return handDAO.delete(map);
	}
}
