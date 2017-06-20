package com.poorip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		
		// 클릭수가 없고 설문지를 안 했을 떄
		if (myInfo == null){
			model.addAttribute("scrapfail","nohit");
			return "/PooripMain";
		}
		
		// 내 스크립 시티 정보
		List<ScrapCityVo> myCityList = matchingService.getMyCityList( usrSeq );
		
		if (myCityList == null || myCityList.size() == 0){
			model.addAttribute("scrapfail","noscrap");
			return "/PooripMain";	
		}

		// 나를 뺀 전체 유저 리스트
		List<UserVo> matchingUserList = matchingService.getMatchingList( userVo );
		
		// 나와 계획이 비슷한 유저
		List<UserVo> samePlanMemeber = 
				matchingService.getSamePlanMember(myInfo, myCityList);
		
		// 최종 5명 선발, 스크랩리스트도 불러오기
		List<UserVo> matchingScore = 
				matchingService.getMatchingScore(myInfo, myCityList, matchingUserList, samePlanMemeber);
		
		//유저 스크랩 정보 중 도시의 출발,종료 일자 가져오기
		List<ScrapCityVo> matchingDateList = matchingService.getUsersDateList( matchingScore );		
		List<ScrapCityVo> samePlanDateList = matchingService.getUsersDateList( samePlanMemeber );
		
		List<PoolMemberVo> isPoolMember = matchingService.getMyPoolListMember( usrSeq );
		
		for(int i=0; i<matchingScore.size(); i++) {
			if(matchingScore.get(i).getUsrInfo() != null )
				matchingScore.get(i).setUsrInfo(matchingScore.get(i).getUsrInfo().replace("<", "&lt;"));
			if(matchingScore.get(i).getUsrHashtag() != null)
				matchingScore.get(i).setUsrHashtag(matchingScore.get(i).getUsrHashtag().replace("<", "&lt;"));
		}
		
		for(int i=0; i<samePlanMemeber.size(); i++) {
			if(samePlanMemeber.get(i).getUsrInfo() != null )
				samePlanMemeber.get(i).setUsrInfo(samePlanMemeber.get(i).getUsrInfo().replace("<", "&lt;"));
			if(samePlanMemeber.get(i).getUsrHashtag() != null)
				samePlanMemeber.get(i).setUsrHashtag(samePlanMemeber.get(i).getUsrHashtag().replace("<", "&lt;"));
		}
		model.addAttribute( "isPoolMember", isPoolMember );
		model.addAttribute( "matchingDateList", matchingDateList);
		model.addAttribute( "samePlanDateList", samePlanDateList);
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
	@RequestMapping(value = "/surveyQ", method=RequestMethod.POST)
	public String surveyQ(@AuthUser UserVo userVo) {
		return "/matching/survey-q1";
	}
	
	@Auth
	@RequestMapping(value = "/surveyQ", method=RequestMethod.GET)
	public String surveyQ2(@AuthUser UserVo userVo) {
		return "redirect:/";
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
