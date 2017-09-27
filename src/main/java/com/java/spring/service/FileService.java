package com.java.spring.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.spring.dao.FileDaoInterface;

@Service
public class FileService implements FileServiceInterface {

	@Autowired
	FileDaoInterface fdi;
	
	public HashMap<String, Object> map;
	
	@Override
	public HashMap<String, Object> fileAdd(HashMap<String, Object> param) {
		map = new HashMap<String, Object>();
		map.put("status", fdi.fileAdd(param));
		return map;
	}

	@Override
	public HashMap<String, Object> fileList() {
		map = new HashMap<String, Object>();
		map.put("list", fdi.fileList());
		return map;
	}

}
