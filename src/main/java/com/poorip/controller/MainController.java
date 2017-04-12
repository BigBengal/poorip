package com.poorip.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poorip.service.MainService;
import com.poorip.vo.TravelInfoVo;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	MainService mainService;
	
	//사용자가 아무 도시도 선택을 하지 않았을 경우
	@RequestMapping("/travelinfo")
	public String getTravelInfo ( Model model) {
		List<TravelInfoVo> travelInfoVo = mainService.selectTravelInfo();
		/*System.out.println(travelInfoVo);*/
		System.out.println("------------------------" + travelInfoVo.get(1).getCatSeq());
		model.addAttribute("travelInfoList", travelInfoVo);
		return "/PooripMain";
	}
	
	ArrayList<TravelInfoVo> foodlist = new ArrayList<TravelInfoVo>();
	
	//사용자가 도시를 선택 하였을 경우
	@RequestMapping("/travelinfobycity")
	public String getDetailInfo (Model model, @RequestParam ("ctySeq") int ctySeq) {
		List<TravelInfoVo> travelInfoVo = mainService.selectTravelInfoByCity(14);
		System.out.println("-----------------------------------ttttttttttt" + travelInfoVo);
		for(int i=0; i < travelInfoVo.size(); i++) {
			System.out.println("--------------들어옴--------------");
			if(travelInfoVo.get(i).getCatSeq()==1) {
				foodlist.add(travelInfoVo.get(i));
				System.out.println("FOOOOOOOOOOOOOOOD" + foodlist);
				
			}
			if(travelInfoVo.get(i).getCatSeq()==2) {
				System.out.println(travelInfoVo.get(i));
				model.addAttribute("travelInfoAttraction", travelInfoVo.get(i));
			}
			if(travelInfoVo.get(i).getCatSeq()==3) {
				System.out.println(travelInfoVo.get(i));
				model.addAttribute("travelInfoActivity", travelInfoVo.get(i));
			}
			model.addAttribute("travelInfoFood", foodlist);
		}
		return "/PooripMain";
	}

}
