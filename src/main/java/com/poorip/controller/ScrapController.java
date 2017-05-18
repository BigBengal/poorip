package com.poorip.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poorip.dto.JSONResult;
import com.poorip.security.Auth;
import com.poorip.security.AuthUser;
import com.poorip.service.ScrapCityService;
import com.poorip.service.ScrapService;
import com.poorip.service.UserService;
import com.poorip.vo.ReviewVo;
import com.poorip.vo.ScrapCityVo;
import com.poorip.vo.ScrapVo;
import com.poorip.vo.UserVo;

@Controller
@RequestMapping("/scrap")
public class ScrapController {
	
	@Autowired
	ScrapService scrapService;
	
	@Autowired
	ScrapCityService scrapCityService;
	
	@Autowired
	UserService userService;
	
	@Auth
	@RequestMapping("/main")
	public String searchPool(Model model,@AuthUser UserVo userVo) {
				
		// 해당 유저의 스크랩 정보 가져오기
		List<ReviewVo> scrapList = scrapService.showScraps(userVo.getUsrSeq());
		
		// 유저 스크랩 정보 중 도시 정보 가져오기
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
		
		//유저 스크랩 정보 중 전체 도시의 전체 출발, 전체 종료 일자 가져오기
		ScrapCityVo travelDuration = scrapCityService.showTravelDuration(userVo.getUsrSeq());
		
		model.addAttribute("cityList", cityList);
		model.addAttribute("scrapList", scrapList);
		model.addAttribute("dateList", dateList);
		model.addAttribute("travelDuration", travelDuration);
		
		return "/scrap/scrapMain";
	}
	
	
	// 여행정보 스크랩 토글 (스크랩 데이터 저장 or 삭제)
	@Auth
	@ResponseBody
	@RequestMapping("/scrapInput")
	public JSONResult inputScrap(@AuthUser UserVo userVo, @RequestParam ("trvSeq") String trvSeq) {
	
		ScrapVo scrapVo = new ScrapVo();
		scrapVo.setUsrSeq(userVo.getUsrSeq());
	
		int trvSeq1 = Integer.parseInt(trvSeq);
		int usrSeq = userVo.getUsrSeq();
		String luxuryY = scrapService.getLuxuryY( trvSeq1 );
		
		scrapVo.setTrvSeq(trvSeq1);
		if(scrapService.selectScrap(scrapVo)==0) {
			scrapService.insertScrap(scrapVo);
			userService.updateScrapHit( trvSeq1, usrSeq, luxuryY );
			return JSONResult.success("성공");
		}
		scrapService.deleteScrap(scrapVo);
		userService.updateDeleteScrapHit( trvSeq1, usrSeq, luxuryY );
		
		return JSONResult.fail("이미 있는 여행정보");
	}
	
	// 여행정보 스크랩 아이콘 ON/OFF 
	@Auth
	@ResponseBody
	@RequestMapping("/scrapValidate")
	public String validateScrap(@RequestParam ("trvSeq") String trvSeq,
								@AuthUser UserVo userVo) {
		int trvSeq1 = Integer.parseInt(trvSeq);
		int usrSeq = userVo.getUsrSeq();
		String luxuryY = scrapService.getLuxuryY( trvSeq1 );
		//사용자가 클릭시 여행정보 조회수 증가
		scrapService.updateHit(trvSeq1);
		//매칭알고리즘 조회수 증가
		userService.updateHit( trvSeq1, usrSeq, luxuryY );
		
		ScrapVo scrapVo = new ScrapVo();
		
		scrapVo.setTrvSeq(trvSeq1);
		scrapVo.setUsrSeq(userVo.getUsrSeq());
		if(scrapService.selectScrap(scrapVo)==0) {
			return "NO";
		}
		return "YES";
	}
	
	// 여행정보 스크랩 출발/종료 일자 저장
	@Auth
	@ResponseBody
	@RequestMapping("/scrapSave/{ctySeq}")
	public JSONResult saveTravelDate(@ModelAttribute ScrapCityVo scrapCityVo, @PathVariable ("ctySeq") String ctySeq1, @AuthUser UserVo userVo) {
		scrapCityVo.setUsrSeq(userVo.getUsrSeq());
		int ctySeq = Integer.parseInt(ctySeq1);
		scrapCityVo.setCtySeq(ctySeq);
		if(scrapCityVo.getDateFrom()==null||scrapCityVo.getDateFrom().isEmpty()||scrapCityVo.getDateTo()==null) {
			return JSONResult.fail("no-data");
		}
		
		if(scrapCityService.select(scrapCityVo)==null) {
			scrapCityService.insertDate(scrapCityVo);
			return JSONResult.success("success");
		}
		
		scrapCityService.updateDate(scrapCityVo);
		return JSONResult.fail("exist");	

	}
	
	// 스크랩 도시 날짜 구하기
	@Auth
	@ResponseBody
	@RequestMapping("/showDate")
	public JSONResult showDate(@RequestParam ("ctySeq") String ctySeq1, @AuthUser UserVo userVo ) {
		ScrapCityVo scrapCityVo = new ScrapCityVo();
		int ctySeq = Integer.parseInt(ctySeq1);
		scrapCityVo.setCtySeq(ctySeq);
		scrapCityVo.setUsrSeq(userVo.getUsrSeq());
		ScrapCityVo scrapDate = scrapCityService.select(scrapCityVo);
		
		if(scrapDate==null) {
			return JSONResult.fail("no-data");
		}
		
		return JSONResult.success(scrapDate);
	}
	
	
	// 전체 일정 조회
	@Auth
	@ResponseBody
	@RequestMapping("/showDuration")
	public JSONResult showDuration(@AuthUser UserVo userVo) {
		ScrapCityVo travelDuration = scrapCityService.showTravelDuration(userVo.getUsrSeq());
		
		return JSONResult.success(travelDuration);
	}
	
	@RequestMapping("/map")	
	public String map(Model model) {
//		TravelInfoVo travelInfoVo = new TravelInfoVo();
//		String key = "AIzaSyCgCFe9BgFDA2zVfQdTeLPIDqLiXvBNUhs";
//		String mapURL = key;
//		travelInfoVo.setMapURL(mapURL);
//		model.addAttribute( "mapURL", travelInfoVo);
//		
		return "";
	}
	
	
	// 날짜 초기화
	@Auth
	@ResponseBody
	@RequestMapping("/renewDate")
	public JSONResult clearDate(@RequestParam ("ctySeq") int ctySeq, @AuthUser UserVo userVo) {
		ScrapCityVo scrapCityVo = new ScrapCityVo();
		scrapCityVo.setUsrSeq(userVo.getUsrSeq());
		scrapCityVo.setCtySeq(ctySeq);
		scrapCityService.clearCityDate(scrapCityVo);
		
		// 초기화하면서 전체 일정을 다시 불러줌 
		return JSONResult.success(scrapCityService.showTravelDuration(userVo.getUsrSeq()));
		
	}
	
	@Auth
	@ResponseBody
	@RequestMapping("/saveCityOrder")
	public JSONResult saveCityOrder(@RequestParam("ctySeq[]") int[] ctySeq,
								@AuthUser UserVo userVo){
		
		int usrSeq = userVo.getUsrSeq();
		scrapCityService.updateCityOrder(usrSeq, ctySeq);
		
		return JSONResult.success("OK");
	}
	
	

}
