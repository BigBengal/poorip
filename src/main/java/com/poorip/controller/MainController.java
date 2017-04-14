package com.poorip.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poorip.dto.JSONResult;
import com.poorip.service.MainService;
import com.poorip.vo.ReviewVo;
import com.poorip.vo.TravelInfoVo;


@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	private MainService mainService;

	// 사용자가 아무 도시도 선택을 하지 않았을 경우
	@RequestMapping("/")
	public String getTravelInfo(Model model) {
		
		List<TravelInfoVo> foodlistMain = new ArrayList<TravelInfoVo>();
		List<TravelInfoVo> activitylistMain = new ArrayList<TravelInfoVo>();
		List<TravelInfoVo> attractionlistMain = new ArrayList<TravelInfoVo>();
		List<TravelInfoVo> citylistMain = new ArrayList<TravelInfoVo>();
		List<TravelInfoVo> travelInfoVo = mainService.selectTravelInfo();

			
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

	// 사용자가 도시를 선택 하였을 경우
	@RequestMapping("/city/{citySeq}")
	public String getDetailInfo( Model model,
			@PathVariable(required=false) String citySeq) {
		ArrayList<TravelInfoVo> foodlist = new ArrayList<TravelInfoVo>();
		ArrayList<TravelInfoVo> attractionlist = new ArrayList<TravelInfoVo>();
		ArrayList<TravelInfoVo> activitylist = new ArrayList<TravelInfoVo>();
		List<ReviewVo> foodReview = new ArrayList<ReviewVo>();
		
		int ctySeq = Integer.parseInt(citySeq); 
		List<TravelInfoVo> travelInfoVo = mainService.selectTravelInfoByCity(ctySeq);

		for (int i = 0; i < travelInfoVo.size(); i++) {
			if (travelInfoVo.get(i).getCatSeq() == 1) {
				foodlist.add(travelInfoVo.get(i));
				System.out.println(travelInfoVo.get(i).getTrvSeq());
				List<ReviewVo> foodReviews = mainService.selectReviewList(travelInfoVo.get(i).getTrvSeq());
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
		model.addAttribute("travelInfoActivity", activitylist);
		model.addAttribute("travelInfoAttraction", attractionlist);
		model.addAttribute("travelInfoFood", foodlist);
		model.addAttribute("foodReview", foodReview);

		System.out.println(foodReview);
		return "/PooripMain";
	}
	
	@ResponseBody
	@RequestMapping(value={"/search","/city/search"})
    public JSONResult getKwdData( Model model,
    					   		  @RequestParam( value="kwd", required=true, defaultValue="" ) String keyword,
    					   		  HttpServletRequest request, HttpServletResponse response ) throws IOException{
        
        logger.debug("텍스트창에 입력된 단어 : " + keyword);

        // DB문 실행
        List<TravelInfoVo> autoList = mainService.getKwdData(keyword);
        if ( autoList.isEmpty())
        	return JSONResult.fail("No-DATA");
        return JSONResult.success(autoList);
    }
	
	@RequestMapping("/searchResult")
	public String getSearchResult( @RequestParam( value="ctySeq", required=true, defaultValue="" ) String cityName ) {
		if( "".equals(cityName) )
			return "redirect:/";
		int seq = mainService.getCitySeq(cityName);
		return "redirect:/city/"+seq;
	}
	
}
