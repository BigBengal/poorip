package com.poorip.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poorip.service.MainService;
import com.poorip.vo.PostVo;
import com.poorip.vo.TravelInfoVo;

import facebook4j.internal.org.json.JSONArray;


@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

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
		List<PostVo> foodReviewList = new ArrayList<PostVo>();
		foodlist = (List<TravelInfoVo>) model.asMap().get("travelInfoFood");
		activitylist = (List<TravelInfoVo>) model.asMap().get("travelInfoActivity");
		attractionlist = (List<TravelInfoVo>) model.asMap().get("travelInfoAttraction");
		foodReviewList = (List<PostVo>) model.asMap().get("foodReview");
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
			
		}
		model.addAttribute("travelInfoFood", foodlist);
		model.addAttribute("travelInfoActivity", activitylist);
		model.addAttribute("travelInfoAttraction", attractionlist);
		model.addAttribute("foodReviewList", foodReviewList);

		return "/PooripMain";
	}

	// 사용자가 도시를 선택 하였을 경우
	@RequestMapping("/travelinfobycity")
	public String getDetailInfo(RedirectAttributes redirectAttributes, Model model,
			@RequestParam("ctySeq") int ctySeq) {
		ArrayList<TravelInfoVo> foodlist = new ArrayList<TravelInfoVo>();
		ArrayList<TravelInfoVo> attractionlist = new ArrayList<TravelInfoVo>();
		ArrayList<TravelInfoVo> activitylist = new ArrayList<TravelInfoVo>();
		List<PostVo> foodReview = new ArrayList<PostVo>();
		
		List<TravelInfoVo> travelInfoVo = mainService.selectTravelInfoByCity(ctySeq);

		for (int i = 0; i < travelInfoVo.size(); i++) {
			if (travelInfoVo.get(i).getCatSeq() == 1) {
				foodlist.add(travelInfoVo.get(i));
				System.out.println(travelInfoVo.get(i).getTrvSeq());
				List<PostVo> foodReviews = mainService.selectReviewList(travelInfoVo.get(i).getTrvSeq());
				for(int j=0; j <foodReviews.size(); j++) {
					foodReview.add(foodReviews.get(j));
				}
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
		redirectAttributes.addFlashAttribute("foodReview", foodReview);
		System.out.println(foodReview);
		return "redirect:/";
	}
	
	
	
	@RequestMapping("/search")
    public void phone_AutoComplete(ModelMap modelMap,
    							   @ModelAttribute TravelInfoVo travelInfoVo,
    							   HttpServletRequest request, HttpServletResponse response) throws IOException{
        
        logger.info("휴대폰 : 자동완성 기능 실행");
        logger.debug("텍스트창에 입력된 단어 : " + travelInfoVo.getName());
        System.out.println(travelInfoVo.getName());
        // DB문 실행
        List<TravelInfoVo> autoList = mainService.selectTravelInfo();
        
        JSONArray array = new JSONArray();
        for(int i=0; i<autoList.size(); i++){
            array.put(autoList.get(i).getCtySeq());
            
        }
        
        PrintWriter out = response.getWriter();
        out.print(array.toString());
    }
	
}
