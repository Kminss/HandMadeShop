package com.damoa.hand.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.damoa.hand.dto.HandDTO;

@Repository
public class HandDAOImp implements HandDAO {
	private static final Logger logger = LoggerFactory.getLogger(HandDAOImp.class);
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void write(HandDTO handDTO) {
		logger.info(""+handDTO);
		sqlSessionTemplate.insert("write", handDTO);
	}

	@Override
	public List<HandDTO> list() {
		return sqlSessionTemplate.selectList("list");
		
	}

	@Override
	public HandDTO select(int handNum) {
		return sqlSessionTemplate.selectOne("select", handNum);
	}

	@Override
	public void update(HandDTO handDTO) {
		logger.info(""+handDTO);
		sqlSessionTemplate.update("update", handDTO);
	}

	@Override
	public void delete(Map<String, Object> map) {
		sqlSessionTemplate.delete("delete",map);
	}

}
