package com.poorip.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poorip.security.Auth;
import com.poorip.service.MatchingService;

@Controller
@RequestMapping("/matching")
public class MatchingController {
	
	@Autowired MatchingService matchingService;
	
	@Auth
	@RequestMapping("/main/matching")
	public String matchingMain() {
		return "matching/matchingMain";
	}
	
	@Auth
	@RequestMapping("/survey-main")
	public String matchingSurveyMain() {
		
		return "/matching/survey-main";
	}
	
	@Auth
	@RequestMapping("/survey-Q1")
	public String matchingSurvey1() {
		
		return "/matching/survey-q1";
	}
	
	@Auth
	@RequestMapping("/survey-Q2")
	public String matchingSurvey2() {
		
		return "/matching/survey-q2";
	}
	
	@Auth
	@RequestMapping("/survey-Q3")
	public String matchingSurvey3() {
		
		return "/matching/survey-q3";
	}
	
	@Auth
	@RequestMapping("/survey-Q4")
	public String matchingSurvey4() {
		
		return "/matching/survey-q4";
	}
	
	@Auth
	@RequestMapping("/survey-Q5")
	public String matchingSurvey5() {
		
		return "/matching/survey-q5";
	}

}
