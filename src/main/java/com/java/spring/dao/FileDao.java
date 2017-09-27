package com.java.spring.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FileDao implements FileDaoInterface {

	@Resource(name="sqlSession")
	SqlSession session;
	
	@Override
	public int fileAdd(HashMap<String, Object> param) {
		return session.insert("file.insert", param);
	}

	@Override
	public List<HashMap<String, Object>> fileList() {
		return session.selectList("file.select");
	}

}
