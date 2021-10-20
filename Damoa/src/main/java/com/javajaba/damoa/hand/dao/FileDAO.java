package com.javajaba.damoa.hand.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javajaba.damoa.hand.dto.AttachedImgDTO;

@Repository
public class FileDAO {
	private static final Logger logger = LoggerFactory.getLogger(FileDAO.class);

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

//파일첨부
	public void addFile(AttachedImgDTO attachedImgDTO) {
		sqlSessionTemplate.insert("addFile", attachedImgDTO);
	}

//첨부파일리스트
	public List<AttachedImgDTO> listFile(int attachedNum) {
		return sqlSessionTemplate.selectList("listFile", attachedNum);
	}

//파일 삭제
	public int deleteFile(int handNum) {
		return sqlSessionTemplate.delete("deleteFile", handNum);
	}
// 파일 수정
	public void updateFile(AttachedImgDTO attachedImgDTO) {
		sqlSessionTemplate.update("updateFile", attachedImgDTO);
	}
}
