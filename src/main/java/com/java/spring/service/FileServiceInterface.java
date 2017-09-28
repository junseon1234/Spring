package com.java.spring.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface FileServiceInterface {
	public HashMap<String, Integer> fileAdd(HashMap<String, Object> param);
	public HashMap<String, Object> fileList();
	
	public HashMap<String, Integer> fileOutput(MultipartFile[] file, HttpServletRequest req);
}
