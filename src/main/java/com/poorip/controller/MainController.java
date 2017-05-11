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
import com.poorip.security.Auth;
import com.poorip.security.AuthUser;
import com.poorip.service.MainService;
import com.poorip.service.SNSService;
import com.poorip.vo.PostVo;
import com.poorip.vo.ReviewVo;
import com.poorip.vo.TravelInfoVo;
import com.poorip.vo.UserVo;
import com.poorip.web.util.WebUtil;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	private static final int MAX_COUNT = 12;
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private SNSService snsService;
	
	// 사용자가 아무 도시도 선택을 하지 않았을 경우
	@RequestMapping("/")
	public String getTravelInfo(Model model) {
		
		int foodlistMainCnt = 0, attractionlistMainCnt = 0, activitylistMainCnt = 0, citylistMainCnt = 0;
		
		List<TravelInfoVo> foodlistMain = new ArrayList<TravelInfoVo>();
		List<TravelInfoVo> activitylistMain = new ArrayList<TravelInfoVo>();
		List<TravelInfoVo> attractionlistMain = new ArrayList<TravelInfoVo>();
		List<TravelInfoVo> citylistMain = new ArrayList<TravelInfoVo>();
		List<TravelInfoVo> travelInfoVo = mainService.selectTravelInfo();
		
		for (int i = 0; i < travelInfoVo.size(); i++) {
			if (foodlistMainCnt+attractionlistMainCnt+activitylistMainCnt+citylistMainCnt >= MAX_COUNT*4)
				break;
			if (travelInfoVo.get(i).getCatSeq() == 1) {
				if (++foodlistMainCnt > MAX_COUNT)
					continue;
				foodlistMain.add(travelInfoVo.get(i));
			}
			if (travelInfoVo.get(i).getCatSeq() == 2) {
				if (++attractionlistMainCnt > MAX_COUNT)
					continue;
				attractionlistMain.add(travelInfoVo.get(i));
			}
			if (travelInfoVo.get(i).getCatSeq() == 3) {
				if (++activitylistMainCnt > MAX_COUNT)
					continue;
				activitylistMain.add(travelInfoVo.get(i));
			}
			if (travelInfoVo.get(i).getCatSeq() == 4) {
				if (++citylistMainCnt > MAX_COUNT)
					continue;
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
	@RequestMapping(value = { "/city/{citySeq}", "/city" })
	public String getDetailInfo(Model model, @PathVariable(required = false) String citySeq) {
		ArrayList<TravelInfoVo> foodlist = new ArrayList<TravelInfoVo>();
		ArrayList<TravelInfoVo> attractionlist = new ArrayList<TravelInfoVo>();
		ArrayList<TravelInfoVo> activitylist = new ArrayList<TravelInfoVo>();
		List<ReviewVo> foodReview = new ArrayList<ReviewVo>();
		int citySeq1 = WebUtil.checkNullParam(citySeq, 0);
		List<TravelInfoVo> travelInfoVo = mainService.selectTravelInfoByCity(citySeq1);

		for (int i = 0; i < travelInfoVo.size(); i++) {
			if (travelInfoVo.get(i).getCatSeq() == 1) {
				foodlist.add(travelInfoVo.get(i));
			
			}
			if (travelInfoVo.get(i).getCatSeq() == 2) {
				attractionlist.add(travelInfoVo.get(i));
			}
			if (travelInfoVo.get(i).getCatSeq() == 3) {
				activitylist.add(travelInfoVo.get(i));
			}

		}
		model.addAttribute("travelInfoActivity", activitylist);
		model.addAttribute("travelInfoAttraction", attractionlist);
		model.addAttribute("travelInfoFood", foodlist);
		model.addAttribute("foodReview", foodReview);

		return "/PooripMain";
	}

	@ResponseBody
	@RequestMapping("/reviews/{trvSeq}")
	public JSONResult getReviews(Model model, @PathVariable("trvSeq") String trvSeq, @RequestParam(value="reviewNum", required=false) String reviewNum, @RequestParam(value="like", required=false) String like) {
		/*if (trvSeq == null || trvSeq.equals("")) {
			return JSONResult.fail("실패");
		}*/
		int trvSeq1 = Integer.parseInt(trvSeq);
		if(like==null){
			like="ReviewByDate";
		}
		if(like.equals("like")) {
			List<ReviewVo> reviewsByLike = mainService.getReviewsByLikes(trvSeq1);
			return JSONResult.success(reviewsByLike);
		}

		List<ReviewVo> reviews = mainService.selectReviewList(trvSeq1);
	

		return JSONResult.success(reviews);
	}
	
	@ResponseBody
	@RequestMapping("/reviewpic/{postSeq}")
	public JSONResult getReviewPic (@PathVariable("postSeq") String postSeq) {
		int postSeq1 = Integer.parseInt(postSeq);
		List<ReviewVo> reviewPic = mainService.selectReviewPics(postSeq1);
		if(reviewPic.isEmpty() || reviewPic==null) {
			return JSONResult.fail("사진이 없습니다");
		}
		return JSONResult.success(reviewPic);
		
	}
	
	@Auth
	@ResponseBody
	@RequestMapping("/reviewLike/{postSeq}")
	public JSONResult increaseReviewLike(@PathVariable("postSeq") String postSeq, @AuthUser UserVo userVo) {
		int postSeq1 = Integer.parseInt(postSeq);
		if(snsService.checkPostLike(postSeq1, userVo.getUsrSeq())==null) {
			snsService.increasePostLike(postSeq1, userVo.getUsrSeq());
			int likeCounts = mainService.selectPostLikeAjax(postSeq1);
			return JSONResult.success(likeCounts);
		};
		snsService.decreasePostLike(postSeq1,userVo.getUsrSeq());
		int likeCounts = mainService.selectPostLikeAjax(postSeq1);
		return JSONResult.success(likeCounts + "-decreased_like");
	}
	
	
	@ResponseBody
	@RequestMapping("/reviewLikeValidate/{trvSeq}")
	public JSONResult validateReviewLike(@PathVariable("trvSeq") String trvSeq, @AuthUser UserVo userVo) {
		int trvSeq1 = Integer.parseInt(trvSeq);

		if(userVo==null) {
			userVo = new UserVo();
			userVo.setUsrSeq(0);
		}
		List<PostVo> postLikeList =  snsService.showPostLike(trvSeq1, userVo.getUsrSeq());
		return JSONResult.success(postLikeList);
	}
	
	

	@ResponseBody
	@RequestMapping(value = { "/search", "/city/search" })
	public JSONResult getKwdData(Model model,
			@RequestParam(value = "kwd", required = true, defaultValue = "") String keyword, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		logger.debug("텍스트창에 입력된 단어 : " + keyword);

		// DB문 실행
		List<TravelInfoVo> autoList = mainService.getKwdData(keyword);
		if (autoList.isEmpty())
			return JSONResult.fail("No-DATA");
		return JSONResult.success(autoList);
	}

	@RequestMapping("/searchResult")
	public String getSearchResult(@RequestParam(value = "ctySeq", required = true, defaultValue = "") String cityName) {
		if ("".equals(cityName))
			return "redirect:/";
		int seq = mainService.getCitySeq(cityName);
		if (seq == 0)
			return "redirect:/";
		return "redirect:/city/" + seq;
	}

}
