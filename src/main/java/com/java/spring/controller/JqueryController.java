package com.java.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//스프링에서 사용하는 어노테이션 @Controller
@Controller //특정 class에 주입하면 스프링이 알 수 있다
public class JqueryController {
	
	//스프링에서 사용하는 어노테이션 @RequestMapping
	@RequestMapping("/jquery") //특정 메소드에 주입하면 URL 정보를 매칭.
	public String jquery(){
		return "jQuery/index"; // view를 정의하는 부분
	}
	
	@RequestMapping("/jquery2") //특정 메소드에 주입하면 URL 정보를 매칭.
	public String jquery2(){
		return "jQuery/index2"; // view를 정의하는 부분
	}

}
