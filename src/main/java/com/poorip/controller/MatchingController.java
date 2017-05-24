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
import com.poorip.vo.ScrapCityVo;
import com.poorip.vo.UserVo;

@Controller
@RequestMapping("/matching")
public class MatchingController {
	
	@Autowired MatchingService matchingService;
	
	@Auth
	@RequestMapping("")
	public String matchingMain(@AuthUser UserVo userVo,
							   Model model) throws Exception{
		int usrSeq = userVo.getUsrSeq();

		// 내정보
		UserVo myInfo = matchingService.getUserInfo( usrSeq );
		
		if (myInfo == null)
			return "/matching/matchingMain";
		// 내 스크립 시티 정보
		List<ScrapCityVo> myCityList = matchingService.getMyCityList( usrSeq );
				
		// 나를 뺀 전체 유저 리스트
		List<UserVo> matchingUserList = matchingService.getMatchingList( userVo );
		
		List<UserVo> samePlanMemeber = 
				matchingService.getSamePlanMember(myInfo, myCityList);
		
		List<UserVo> matchingScore = 
				matchingService.getMatchingScore(myInfo, myCityList, matchingUserList, samePlanMemeber);
		
		model.addAttribute( "matchingScore", matchingScore );
		model.addAttribute( "samePlanMemeber", samePlanMemeber );
		
		return "/matching/matchingMain";
	}
	
	// 사용사 설문조사 정보 입력화면
	@Auth
	@RequestMapping("/survey")
	public String matchingSurveyMain(@AuthUser UserVo userVo) {
		int usrSeq = userVo.getUsrSeq();
		
		// 1. 사용자가 설문을 했는지 먼저 확인한다.
		String surveyYN = matchingService.getusrPrefValue( usrSeq );
		// 2. 설문조사를 한 회원은 결과창으로 넘겨준다.
		if( surveyYN != null){
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

		userVo2.setUsrSeq(userVo.getUsrSeq());
		matchingService.updateprefer( userVo2 );
		return "redirect:/matching/";
	}

}
