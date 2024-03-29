package com.javajaba.damoa.hand.dao;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javajaba.damoa.hand.commons.utill.Criteria;
import com.javajaba.damoa.hand.dto.HandDTO;
import com.javajaba.damoa.hand.dto.OrderDTO;

@Repository
public class HandDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void write(HandDTO handDTO) {
		sqlSessionTemplate.insert("write", handDTO);
	}

	public List<HandDTO> newList() {
		return sqlSessionTemplate.selectList("newList");
	}

	public int getListTotal(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("getListTotal", map);
	}

	public List<HandDTO> getListPaging(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("getListPaging", map);
	}

	public HandDTO detail(int handNum) {
		return sqlSessionTemplate.selectOne("detail", handNum);
	}

	public List<HandDTO> getMyList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("myList", map);
	}

	public void update(HandDTO handDTO) {
		sqlSessionTemplate.update("update", handDTO);
	}

	public int delete(int handNum) {
		return sqlSessionTemplate.delete("delete", handNum);
	}

	public void orderInsert(OrderDTO order) {
		sqlSessionTemplate.insert("orderInsert", order);
	}

	public List<OrderDTO> myOrder(String mId) {
		return sqlSessionTemplate.selectList("myOrder", mId);
	}

	public OrderDTO orderDetail(String orderId) {
		return sqlSessionTemplate.selectOne("orderDetail", orderId);
	}

	public void orderDelete(String orderId) {
		sqlSessionTemplate.delete("orderDelete", orderId);
	}
}
