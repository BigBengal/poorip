package com.poorip.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poorip.security.Auth;
import com.poorip.security.AuthUser;
import com.poorip.service.MatchingService;
import com.poorip.service.ScrapCityService;
import com.poorip.vo.ScrapCityVo;
import com.poorip.vo.UserVo;

@Controller
@RequestMapping("/matching")
public class MatchingController {
	
	@Autowired MatchingService matchingService;
	
	@Autowired ScrapCityService scrapCityService;
	
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

		// 사용자 여행 계획 보여주기 위한 리스트
		List<ScrapCityVo> cityList = scrapCityService.showCity(userVo.getUsrSeq());
		//유저 스크랩 정보 중 도시의 출발,종료 일자 가져오기
		List<ScrapCityVo> dateList = new ArrayList<ScrapCityVo>();
		ScrapCityVo scrapCityVo = new ScrapCityVo();
		scrapCityVo.setUsrSeq(userVo.getUsrSeq());
		for(int i=0; i<cityList.size(); i++ ) {
			scrapCityVo.setCtySeq(cityList.get(i).getCtySeq());
			ScrapCityVo scrapCitydateList = scrapCityService.select(scrapCityVo);
			// 도시의 날짜가 저장되어 있으면 
			if (scrapCitydateList != null && (scrapCitydateList.getDateFrom() != null || scrapCitydateList.getDateTo() != null) )
				dateList.add(scrapCitydateList);
		}

		// 나를 뺀 전체 유저 리스트
		List<UserVo> matchingUserList = matchingService.getMatchingList( userVo );

		List<UserVo> samePlanMemeber = 
				matchingService.getSamePlanMember(myInfo, myCityList);
		
		List<UserVo> matchingScore = 
				matchingService.getMatchingScore(myInfo, myCityList, matchingUserList, samePlanMemeber);
		
		System.out.println(samePlanMemeber);
		
		model.addAttribute( "dateList", dateList);
		model.addAttribute( "userVo", myInfo );
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
