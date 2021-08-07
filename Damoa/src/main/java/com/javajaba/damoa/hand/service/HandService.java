package com.javajaba.damoa.hand.service;

import java.util.List; 
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.javajaba.damoa.hand.dao.HandDAO;
import com.javajaba.damoa.hand.dto.AttachedImgDTO;
import com.javajaba.damoa.hand.dto.HandDTO;


@Service
public class HandService {
	private static final Logger logger = LoggerFactory.getLogger(HandService.class);
	@Autowired
	HandDAO handDAO;

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
				handDAO.addFile(imgDTO);
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
