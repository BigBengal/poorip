package com.poorip.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poorip.security.Auth;
import com.poorip.security.AuthUser;
import com.poorip.service.MatchingService;
import com.poorip.service.ScrapCityService;
import com.poorip.vo.PoolMemberVo;
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
		
		// 내정보가 없을때 로그인안했을때 메인 화면으로
		if (myInfo == null)
			return "/matching/matchingMain";
		
		// 내 스크립 시티 정보
		List<ScrapCityVo> myCityList = matchingService.getMyCityList( usrSeq );

		// 사용자 여행 계획 보여주기 위한 리스트
		List<ScrapCityVo> cityList = scrapCityService.showCity(userVo.getUsrSeq());

		// 나를 뺀 전체 유저 리스트
		List<UserVo> matchingUserList = matchingService.getMatchingList( userVo );
		
		// 나와 계획이 비슷한 유저
		List<UserVo> samePlanMemeber = 
				matchingService.getSamePlanMember(myInfo, myCityList);
		
		// 최종 5명 선발, 스크랩리스트도 불러오기
		List<UserVo> matchingScore = 
				matchingService.getMatchingScore(myInfo, myCityList, matchingUserList, samePlanMemeber);
		
		//유저 스크랩 정보 중 도시의 출발,종료 일자 가져오기
		List<ScrapCityVo> dateList = matchingService.getUsersDateList( matchingScore );		
		
		// 나의 풀리스트
//		List<PoolMemberVo> myPoolList = 
//				matchingService.getMyPoolList( usrSeq );
//		
//		// 유저의 풀리스트
//		List<PoolMemberVo> usersPoolList =
//				matchingService.getUsersPoolList( samePlanMemeber, matchingScore );
//		
		// 나와 사용자 사이의 풀이 개설되있는지 여부 확인
//		String poolMemeberYN = matchingService.getWhetherToOpen( myPoolList, usersPoolList );
//		System.out.println(poolMemeberYN);
		
//		model.addAttribute( "poolMemeberYN", poolMemeberYN );
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
