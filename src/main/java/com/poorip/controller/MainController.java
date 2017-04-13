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
public class MainController {

	@Autowired
	MainService mainService;

	// 사용자가 아무 도시도 선택을 하지 않았을 경우
	@RequestMapping("/")
	public String getTravelInfo(Model model) {
		List<TravelInfoVo> foodlist = new ArrayList<TravelInfoVo>();
		List<TravelInfoVo> activitylist = new ArrayList<TravelInfoVo>();
		List<TravelInfoVo> attractionlist = new ArrayList<TravelInfoVo>();
		List<TravelInfoVo> foodlistMain = new ArrayList<TravelInfoVo>();
		List<TravelInfoVo> activitylistMain = new ArrayList<TravelInfoVo>();
		List<TravelInfoVo> attractionlistMain = new ArrayList<TravelInfoVo>();
		List<TravelInfoVo> citylistMain = new ArrayList<TravelInfoVo>();
		foodlist = (List<TravelInfoVo>) model.asMap().get("travelInfoFood");
		activitylist = (List<TravelInfoVo>) model.asMap().get("travelInfoActivity");
		attractionlist = (List<TravelInfoVo>) model.asMap().get("travelInfoAttraction");
		List<TravelInfoVo> travelInfoVo = mainService.selectTravelInfo();
		if (foodlist==null || activitylist==null || attractionlist==null) {
			
			for (int i = 0; i < travelInfoVo.size(); i++) {
				if (travelInfoVo.get(i).getCatSeq() == 1) {
					foodlistMain.add(travelInfoVo.get(i));
				}
				if (travelInfoVo.get(i).getCatSeq() == 2) {
					attractionlistMain.add(travelInfoVo.get(i));
				}
				if (travelInfoVo.get(i).getCatSeq() == 3) {
					activitylistMain.add(travelInfoVo.get(i));
				}
				if (travelInfoVo.get(i).getCatSeq() == 4) {
					citylistMain.add(travelInfoVo.get(i));
				}

			}
			model.addAttribute("travelInfoFoodMain", foodlistMain);
			model.addAttribute("travelInfoActivityMain", activitylistMain);
			model.addAttribute("travelInfoAttractionMain", attractionlistMain);
			model.addAttribute("travelInfoCityMain", citylistMain);
			return "/PooripMain";
			/* System.out.println(travelInfoVo); */
			// model.addAttribute("travelInfoList", travelInfoVo);
		}
		model.addAttribute("travelInfoFood", foodlist);
		model.addAttribute("travelInfoActivity", activitylist);
		model.addAttribute("travelInfoAttraction", attractionlist);

		return "/PooripMain";
	}

	// 사용자가 도시를 선택 하였을 경우
	@RequestMapping("/travelinfobycity")
	public String getDetailInfo(RedirectAttributes redirectAttributes, Model model,
			@RequestParam("ctySeq") int ctySeq) {
		ArrayList<TravelInfoVo> foodlist = new ArrayList<TravelInfoVo>();
		ArrayList<TravelInfoVo> attractionlist = new ArrayList<TravelInfoVo>();
		ArrayList<TravelInfoVo> activitylist = new ArrayList<TravelInfoVo>();
		List<TravelInfoVo> travelInfoVo = mainService.selectTravelInfoByCity(ctySeq);
		for (int i = 0; i < travelInfoVo.size(); i++) {
			if (travelInfoVo.get(i).getCatSeq() == 1) {
				foodlist.add(travelInfoVo.get(i));
				/*
				 * System.out.println("FOOOOOOOOOOOOOOOD" + foodlist);
				 */
			}
			if (travelInfoVo.get(i).getCatSeq() == 2) {
				attractionlist.add(travelInfoVo.get(i));
			}
			if (travelInfoVo.get(i).getCatSeq() == 3) {
				/* System.out.println(travelInfoVo.get(i)); */
				activitylist.add(travelInfoVo.get(i));
			}
		

		}
		redirectAttributes.addFlashAttribute("travelInfoActivity", activitylist);
		redirectAttributes.addFlashAttribute("travelInfoAttraction", attractionlist);
		redirectAttributes.addFlashAttribute("travelInfoFood", foodlist);
		return "redirect:/";
	}

}
