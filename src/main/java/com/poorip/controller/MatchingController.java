package com.poorip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/matching")
public class MatchingController {
	
	@RequestMapping("/main")
	public String matchingMain() {
		return "";
	}
	
	@RequestMapping("/survey-main")
	public String matchingSurveyMain() {
		return "/matching/survey-main";
	}
	
	@RequestMapping("/survey-Q1")
	public String matchingSurvey() {
		
		return "/matching/survey-q1";
	}

}
