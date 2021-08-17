package com.javajaba.damoa.hand.dao;

import java.util.HashMap; 
import java.util.List; 
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.damoa.hand.commons.utill.Criteria;
import com.javajaba.damoa.hand.dto.HandDTO;

@Repository
public class HandDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void write(HandDTO handDTO) {
		sqlSessionTemplate.insert("write", handDTO);
	}

	public List<HandDTO> list(int handType) {
		return sqlSessionTemplate.selectList("list", handType);
	}
	
	public int getListTotal() {
		return sqlSessionTemplate.selectOne("getListTotal");}
	public int handGetTotal(Criteria cri) {
		return sqlSessionTemplate.selectOne("handGetTotal", cri);
		
	}
	public List<HandDTO> getPagingList(Map<String, Object> map){
		return sqlSessionTemplate.selectList("getListPaging", map);}
	
	public HandDTO select(int handNum) {
		return sqlSessionTemplate.selectOne("select", handNum);
	}

	public void update(HandDTO handDTO) {
		sqlSessionTemplate.update("update", handDTO);
	}

	public int delete(Map<String, Object> map) {
		return sqlSessionTemplate.delete("delete", map);
	}
	
}

