package com.poorip.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poorip.service.MainService;
import com.poorip.vo.TravelInfoVo;

@Controller
@RequestMapping("/")
public class MainController {
	
	
	@Autowired
	MainService mainService;
	
	//사용자가 아무 도시도 선택을 하지 않았을 경우
	@RequestMapping("/")
	public String getTravelInfo ( Model model) {
		List<TravelInfoVo> foodlist = null;
		List<TravelInfoVo> activitylist = null;
		List<TravelInfoVo> attractionlist = null;
		foodlist = (List<TravelInfoVo>) model.asMap().get("travelInfoFood");
		activitylist = (List<TravelInfoVo>) model.asMap().get("travelInfoActivity");
		attractionlist = (List<TravelInfoVo>) model.asMap().get("travelInfoAttraction");
		if(foodlist==null||activitylist==null||attractionlist==null){
			List<TravelInfoVo> list = mainService.selectTravelInfo();
			System.out.println("f size:"+list.size());
		System.out.println(list);
		model.addAttribute("travelInfoList", list);
		return "/PooripMain";
		/*System.out.println(travelInfoVo);*/
//		model.addAttribute("travelInfoList", travelInfoVo);
		} 
		model.addAttribute("travelInfoFood", foodlist);
		model.addAttribute("travelInfoActivity", activitylist);
		model.addAttribute("travelInfoAttraction", attractionlist);
		
		
		System.out.println("size:"+foodlist.size());
		System.out.println("size:"+activitylist.size());
		System.out.println("size:"+attractionlist.size());
		
		return "/PooripMain";
	}
	

	
	//사용자가 도시를 선택 하였을 경우
	@RequestMapping("/travelinfobycity")
	public String getDetailInfo (RedirectAttributes redirectAttributes, Model model, @RequestParam ("ctySeq") int ctySeq) {
		ArrayList<TravelInfoVo> foodlist = new ArrayList<TravelInfoVo>();
		ArrayList<TravelInfoVo> attractionlist = new ArrayList<TravelInfoVo>();
		ArrayList<TravelInfoVo> activitylist = new ArrayList<TravelInfoVo>();
		List<TravelInfoVo> travelInfoVo = mainService.selectTravelInfoByCity(ctySeq);
		System.out.println("-----------------------------------ttttttttttt" + travelInfoVo);
		for(int i=0; i < travelInfoVo.size(); i++) {
			System.out.println("--------------들어옴--------------");
			if(travelInfoVo.get(i).getCatSeq()==1) {
				foodlist.add(travelInfoVo.get(i));
				/*System.out.println("FOOOOOOOOOOOOOOOD" + foodlist);
				*/
			}
			if(travelInfoVo.get(i).getCatSeq()==2) {
				attractionlist.add(travelInfoVo.get(i));
			}
			if(travelInfoVo.get(i).getCatSeq()==3) {
				/*System.out.println(travelInfoVo.get(i));*/
				activitylist.add(travelInfoVo.get(i));
			}
			
			
		}	
		redirectAttributes.addFlashAttribute("travelInfoActivity", activitylist);
		redirectAttributes.addFlashAttribute("travelInfoAttraction", attractionlist);
		redirectAttributes.addFlashAttribute("travelInfoFood", foodlist);
		System.out.println("TRAAAAAAAAAAVEL" + foodlist.size());
		System.out.println("TRAAAAAAAAAAVEL" + activitylist.size());
		System.out.println("TRAAAAAAAAAAVEL" + attractionlist.size());
		return "redirect:/";
	}

}
