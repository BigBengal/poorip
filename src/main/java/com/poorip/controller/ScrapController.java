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
	
	@Auth
	@RequestMapping("/main")
	public String searchPool(Model model,@AuthUser UserVo userVo) {
		List<ReviewVo> scrapList = scrapService.showScraps(userVo.getUsrSeq());
		List<ScrapCityVo> cityList = scrapCityService.showCity(userVo.getUsrSeq());
		List<ScrapCityVo> dateList = new ArrayList<ScrapCityVo>();
		ScrapCityVo travelDuration = new ScrapCityVo();
		
		for(int i=0; i<cityList.size(); i++ ) {
			ScrapCityVo scrapCityVo = new ScrapCityVo();
			scrapCityVo.setCtySeq(cityList.get(i).getCtySeq());
			scrapCityVo.setUsrSeq(userVo.getUsrSeq());
			if(scrapCityService.select(scrapCityVo)==null) {
				model.addAttribute("dateList", dateList);
				model.addAttribute("cityList", cityList);
				model.addAttribute("scrapList", scrapList);
				if(scrapCityService.showTravelDuration(userVo.getUsrSeq())!=null) {
					travelDuration = scrapCityService.showTravelDuration(userVo.getUsrSeq());
					model.addAttribute("travelDuration", travelDuration);
				}
				return "/scrap/scrapMain";
			}
			
			dateList.add(scrapCityService.select(scrapCityVo));
			
			}
		travelDuration = scrapCityService.showTravelDuration(userVo.getUsrSeq());
		model.addAttribute("travelDuration", travelDuration);
		model.addAttribute("dateList", dateList);
		model.addAttribute("cityList", cityList);
		model.addAttribute("scrapList", scrapList);

		
		return "/scrap/scrapMain";
	}
	
	@Auth
	@ResponseBody
	@RequestMapping("/scrapInput")
	public JSONResult inputScrap(@AuthUser UserVo userVo, @RequestParam ("trvSeq") String trvSeq) {
	
		ScrapVo scrapVo = new ScrapVo();
		scrapVo.setUsrSeq(userVo.getUsrSeq());
	
		int trvSeq1 = Integer.parseInt(trvSeq);
		scrapVo.setTrvSeq(trvSeq1);
		if(scrapService.selectScrap(scrapVo)==0) {
			scrapService.insertScrap(scrapVo);
			return JSONResult.success("성공");
		}
		scrapService.deleteScrap(scrapVo);
		return JSONResult.fail("이미 있는 여행정보");
	}
	
	@Auth
	@ResponseBody
	@RequestMapping("/scrapValidate")
	public String validateScrap(@RequestParam ("trvSeq") String trvSeq, @AuthUser UserVo userVo) {
		ScrapVo scrapVo = new ScrapVo();
		int trvSeq1 = Integer.parseInt(trvSeq);
		scrapVo.setTrvSeq(trvSeq1);
		scrapVo.setUsrSeq(userVo.getUsrSeq());
		if(scrapService.selectScrap(scrapVo)==0) {
			return "NO";
		}
		return "YES";
	}
	
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
	

}
