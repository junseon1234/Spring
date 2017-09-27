package com.java.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.java.spring.service.FileServiceInterface;

@Controller
public class FileController {
	
	@Autowired
	FileServiceInterface fsi;
	
	@RequestMapping("/file")
	public ModelAndView file(ModelAndView mav){
		mav.setViewName("file");
		return mav;
	}
	
	@RequestMapping(value="/fileUpload", method=RequestMethod.POST)
	public ModelAndView fileUpload(ModelAndView mav, MultipartFile file, HttpServletRequest req){
		
		String name = file.getOriginalFilename();
		String path2 = "resources/upload/";
		System.out.println(path2 + name);
		try {
			byte[] bytes = file.getBytes();
			
			String path = "";
			// 개발 툴에서만 사용 할것!
//			path = "D:/GIT/Spring/src/main/webapp/" + path2;
			path = req.getSession().getServletContext().getRealPath("/") + path2;
			System.out.println(path);
			
			File f = new File(path);
			if(f.exists()){
				f = new File(path + name);
			}
			
			OutputStream out = new FileOutputStream(f);
			out.write(bytes);
			out.close();
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("path", path2);
			map.put("name", name);
			map = fsi.fileAdd(map);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 개발 툴에서만 사용 할것!
//			try {
//				Thread.sleep(4000);
//			} catch (Exception e2) {
//				e2.printStackTrace();
//			}
		} 
		
		mav.setViewName("ok");
		return mav;
	}
	
	@RequestMapping("/fileList")
	public ModelAndView fileList(ModelAndView mav){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map = fsi.fileList();
		mav.addObject("data", map);
		mav.setViewName("fileList");
		return mav;
	}
	
}
