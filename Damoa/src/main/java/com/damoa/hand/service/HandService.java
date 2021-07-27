package com.damoa.hand.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoa.hand.dao.HandDAOImp;
import com.damoa.hand.dto.HandDTO;

@Service
public class HandService {
	@Autowired
	HandDAOImp handDAO;

	public void write(HandDTO handDTO) {
		handDAO.write(handDTO);
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

	public void delete(Map<String, Object> map) {
		handDAO.delete(map);
	}
}
