package com.poorip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poorip.service.MainService;
import com.poorip.vo.TravelInfoVo;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@RequestMapping("/travelinfo")
	public String getTravelInfo (Model model) {
		int ctySeq =1;
		List<TravelInfoVo> travelInfoVo = mainService.selectTravelInfo(ctySeq);
		System.out.println(travelInfoVo);
		model.addAttribute("traveInfoList", travelInfoVo);
		return "/PooripMain";
	}
	

}
