package com.java.spring.dao;

import java.util.HashMap;
import java.util.List;

public interface FileDaoInterface {
	public int fileAdd(HashMap<String, Object> param);
	public List<HashMap<String, Object>> fileList();
}
