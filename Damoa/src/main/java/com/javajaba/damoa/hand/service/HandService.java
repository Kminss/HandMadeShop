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
	@Transactional
	public List<HandDTO> newList() {
		List<HandDTO> newList = setHandImgList(handDAO.newList()) ;
		return newList;
	}
	
	//상품 목록
	@Transactional
	public List<HandDTO> getListPaging(Map<String, Object> map) {
		List<HandDTO> list = setHandImgList(handDAO.getListPaging(map));
		return list;
	}
	
	//목록에 나타낼 상품 수
	public int getListTotal(Map<String, Object> map) {
		return handDAO.getListTotal(map);
	}
	
	//상세 정보
	@Transactional
	public HandDTO detail(int handNum) {
		HandDTO handDTO = handDAO.detail(handNum);
		
		handDTO.setHandImgList(fileDAO.listFile(handNum));
		return handDTO;
	}
	
	//내 상품 리스트
	@Transactional
	public List<HandDTO> getMyList(Map<String, Object> map){
		List<HandDTO> myList = setHandImgList(handDAO.getMyList(map));
		return myList;
	}
	//상품 수정
	@Transactional
	public void update(HandDTO handDTO) {
		handDAO.update(handDTO);
	}
	
	//상품 삭제
	@Transactional
	public int delete(Map<String, Object> map) {
		return handDAO.delete(map);
	}
	
	@Transactional
	//게시글에 이미지 데이터 저장
	public List<HandDTO> setHandImgList(List<HandDTO> list) {
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setHandImgList(fileDAO.listFile(list.get(i).getHandNum()));
		}
		return list;
	}
}
