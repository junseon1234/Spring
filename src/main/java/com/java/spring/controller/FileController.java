package com.java.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FileController {
	
	@RequestMapping("/file")
	public ModelAndView file(ModelAndView mav){
		mav.setViewName("file");
		return mav;
	}
	
	@RequestMapping("/fileUpload")
	public ModelAndView fileUpload(ModelAndView mav, MultipartFile file){
		
		String name = file.getOriginalFilename();
		System.out.println(name);
		
		mav.setViewName("ok");
		return mav;
	}
	
}
