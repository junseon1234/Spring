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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.java.spring.service.FileServiceInterface;

@Controller
public class FileController {
	
	@Autowired
	FileServiceInterface fsi;
	
	public HashMap<String, Object> map;
	
	@RequestMapping("/file")
	public ModelAndView file(ModelAndView mav){
		mav.setViewName("file");
		return mav;
	}
	
	@RequestMapping(value="/fileUpload", method=RequestMethod.POST)
	public ModelAndView fileUpload(ModelAndView mav, @RequestParam("file") MultipartFile[] file, HttpServletRequest req){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map = fsi.fileOutput(file, req);
		mav.addObject("data", map);
		mav.setViewName("ok");
		return mav;
	}
	
	@RequestMapping("/fileList")
	public ModelAndView fileList(ModelAndView mav){
		map = new HashMap<String, Object>();
		map = fsi.fileList();
		mav.addObject("data", map);
		mav.setViewName("fileList");
		return mav;
	}
	
}
