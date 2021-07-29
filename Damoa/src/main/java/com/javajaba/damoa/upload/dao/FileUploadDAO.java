package com.javajaba.damoa.upload.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileUploadDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void addFile(String fileName) {
		sqlSessionTemplate.insert("addFile",fileName);
	}
}
