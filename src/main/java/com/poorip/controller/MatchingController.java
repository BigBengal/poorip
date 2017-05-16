package com.poorip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poorip.security.Auth;

@Controller
@RequestMapping("/matching")
public class MatchingController {
	
	@Auth
	@RequestMapping("/main")
	public String matchingMain() {
		return "";
	}
	
	@Auth
	@RequestMapping("/survey-main")
	public String matchingSurveyMain() {
		return "/matching/survey-main";
	}
	
	@Auth
	@RequestMapping("/survey-Q1")
	public String matchingSurvey() {
		
		return "/matching/survey-q1";
	}

}
