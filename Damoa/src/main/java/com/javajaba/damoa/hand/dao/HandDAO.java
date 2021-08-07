package com.javajaba.damoa.hand.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javajaba.damoa.hand.dto.AttachedImgDTO;
import com.javajaba.damoa.hand.dto.HandDTO;

@Repository
public class HandDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void write(HandDTO handDTO) {
		sqlSessionTemplate.insert("write", handDTO);
	}

	public List<HandDTO> list() {
		return sqlSessionTemplate.selectList("list");
	}

	public HandDTO select(int handNum) {
		return sqlSessionTemplate.selectOne("select", handNum);
	}

	public void update(HandDTO handDTO) {
		sqlSessionTemplate.update("update", handDTO);
	}

	public int delete(Map<String, Object> map) {
		return sqlSessionTemplate.delete("delete", map);
	}
	
	//파일첨부
	public void addFile(AttachedImgDTO attachedImgDTO) {
		sqlSessionTemplate.insert("addFile",attachedImgDTO);
	}
	//첨부파일리스트
	public List<AttachedImgDTO> listFile(int handNum) {
		return sqlSessionTemplate.selectList("listFile",handNum);
	}
}

