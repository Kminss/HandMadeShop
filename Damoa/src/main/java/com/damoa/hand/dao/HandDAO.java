package com.damoa.hand.dao;

import java.util.List;
import java.util.Map;

import com.damoa.hand.dto.HandDTO;

public interface HandDAO {

	public void write(HandDTO handDTO);
	
	public List<HandDTO> list();
	
	public HandDTO select(int handNum);
	
	public void update(HandDTO handDTO);
	
	public void delete(Map<String,Object> map);
}
