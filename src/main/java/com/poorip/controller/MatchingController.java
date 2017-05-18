package com.poorip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poorip.security.Auth;
import com.poorip.security.AuthUser;
import com.poorip.service.MatchingService;
import com.poorip.vo.UserVo;

@Controller
@RequestMapping("/matching")
public class MatchingController {
	
	@Autowired MatchingService matchingService;
	
	@Auth
	@RequestMapping("/")
	public String matchingMain(@AuthUser UserVo userVo,
							   Model model) {
		List<UserVo> matchingList = matchingService.getMatchingList( userVo );
		System.out.println(matchingList);
		model.addAttribute( "matchingList", matchingList);
		return "matching/matchingMain";
	}
	
	// 사용사 설문조사 정보 입력화면
	@Auth
	@RequestMapping("/survey")
	public String matchingSurveyMain(@AuthUser UserVo userVo) {
		int usrSeq = userVo.getUsrSeq();
		
		// 1. 사용자가 설문을 했는지 먼저 확인한다.
		int surveyYN = matchingService.getusrPrefValue( usrSeq );
		// 2. 설문조사를 한 회원은 결과창으로 넘겨준다.
		if( surveyYN != 0){
			return "redirect:/matching/";
		}
		return "/matching/survey";
	}
	
	// 설문조사 정보 입력
	@Auth
	@RequestMapping("/surveyQ")
	public String surveyQ(@AuthUser UserVo userVo) {
		return "/matching/survey-q1";
	}
	
	// 설문조사 정보 입력
	@Auth
	@RequestMapping("/updatePrefer")
	public String updatePrefer(@AuthUser UserVo userVo,
							   @ModelAttribute UserVo userVo2) {
		System.out.println(userVo2);
		Integer.parseInt(userVo2.getUsrPref1());
		
		userVo2.setUsrSeq(userVo.getUsrSeq());
		matchingService.updateprefer( userVo2 );
		System.out.println(userVo2);
		return "redirect:/matching/";
	}

}
