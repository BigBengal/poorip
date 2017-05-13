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
	
	@RequestMapping("/survey")
	public String matchingSurvey() {
		return "/matching/survey";
	}

}
