package com.poorip.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poorip.dto.JSONResult;
import com.poorip.security.Auth;
import com.poorip.security.AuthUser;
import com.poorip.service.ScrapService;
import com.poorip.vo.ScrapVo;
import com.poorip.vo.UserVo;

@Controller
@RequestMapping("/scrap")
public class ScrapController {
	
	@Autowired
	ScrapService scrapService;
	
	@RequestMapping("/main")
	public String searchPool() {
		
		
		
		
		
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
		System.out.println(scrapVo);
		System.out.println(scrapService.selectScrap(scrapVo));
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
		System.out.println("여긴 오지?");
		ScrapVo scrapVo = new ScrapVo();
		int trvSeq1 = Integer.parseInt(trvSeq);
		scrapVo.setTrvSeq(trvSeq1);
		scrapVo.setUsrSeq(userVo.getUsrSeq());
		if(scrapService.selectScrap(scrapVo)==0) {
			return "NO";
		}
		return "YES";
	}
	
	/*@Auth
	@ResponseBody
	@RequestMapping("/deleteScrap")
	public JSONResult deleteScrap(@RequestParam ("trvSeq") String trvSeq, @AuthUser UserVo userVo) {
		ScrapVo scrapVo = new ScrapVo();
		scrapVo.setUsrSeq(userVo.getUsrSeq());
		int trvSeq1 = Integer.parseInt(trvSeq);
		scrapVo.setTrvSeq(trvSeq1);
		
		if(scrapService.deleteScrap(scrapVo)==true) {
			return JSONResult.success("삭제");
		};
		
		return JSONResult.fail("실패");
	}*/
	
}
