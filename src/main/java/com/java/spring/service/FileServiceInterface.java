package com.java.spring.service;

import java.util.HashMap;

public interface FileServiceInterface {
	public HashMap<String, Object> fileAdd(HashMap<String, Object> param);
	public HashMap<String, Object> fileList();
}
