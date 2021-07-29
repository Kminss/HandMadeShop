package com.javajaba.damoa.hand.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	public void delete(Map<String, Object> map) {
		sqlSessionTemplate.delete("delete", map);
	}
}
