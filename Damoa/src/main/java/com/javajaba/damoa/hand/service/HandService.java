package com.javajaba.damoa.hand.service;

import java.util.List; 
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.javajaba.damoa.hand.commons.utill.Criteria;
import com.javajaba.damoa.hand.dao.FileDAO;
import com.javajaba.damoa.hand.dao.HandDAO;
import com.javajaba.damoa.hand.dto.AttachedImgDTO;
import com.javajaba.damoa.hand.dto.HandDTO;


@Service
public class HandService {
	private static final Logger logger = LoggerFactory.getLogger(HandService.class);
	@Autowired
	HandDAO handDAO;
	@Autowired
	FileDAO fileDAO;

	@Transactional
	public void write(HandDTO handDTO) {
		
			handDTO.setHandImgCnt(handDTO.getHandImgList().size());
			handDAO.write(handDTO);
		
			//이미지 첨부파일 확인
			if (handDTO.getHandImgList().size() == 0) {
				return;
			}
			//첨부이미지 db저장
			for (AttachedImgDTO imgDTO : handDTO.getHandImgList()) {
				fileDAO.addFile(imgDTO);
			}
	}
	//최신 상품 목록
	public List<HandDTO> newList() {
		return handDAO.newList();
	}
	
	public List<HandDTO> getListPaging(Map<String, Object> map) {
		
		return handDAO.getListPaging(map);
	}
	
	public int getListTotal(Map<String, Object> map) {
		return handDAO.getListTotal(map);
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
