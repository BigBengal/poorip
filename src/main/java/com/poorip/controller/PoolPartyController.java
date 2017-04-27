package com.poorip.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.poorip.dto.JSONResult;
import com.poorip.security.Auth;
import com.poorip.security.AuthUser;
import com.poorip.service.AdminService;
import com.poorip.service.PoolPartyService;
import com.poorip.service.SNSService;
import com.poorip.service.ScrapService;
import com.poorip.vo.CityVo;
import com.poorip.vo.PoolPartyVo;
import com.poorip.vo.PostPicVo;
import com.poorip.vo.ReviewVo;
import com.poorip.vo.UserVo;

@Controller
@RequestMapping("/poolparty")
public class PoolPartyController {
	
	private static final Logger logger = LoggerFactory.getLogger(PoolPartyController.class);
	
	@Autowired
	private PoolPartyService poolPartyService;
	
	// 풀파티 포스팅 가져오기
	@Autowired
	private SNSService SNSService;
	
	// 풀파티에서 글쓰기 시 스크랩 정보 선택 
	@Autowired
	private ScrapService scrapService;
	
	// 풀파티 설정 시 대표도시 가져오기
	@Autowired
	private AdminService adminService;

	
	// 풀파티 메인 URL
	@RequestMapping(value={""})
	public String searchPool(Model model) {
		
		model.addAttribute("top10", poolPartyService.getPoolTop10List());
		return "/poolparty/poolparty";
	}

	// 각각의 풀파티 Detail URL
	@RequestMapping(value={"{poolseq}"})
	public String enterPool(@PathVariable(value="poolseq") int poolSeq,
							@AuthUser UserVo authUser,
							Model model) {
		// 조회수 증가
		poolPartyService.updateHit(poolSeq);
	

		// 풀 포스트
		List<ReviewVo> postList = SNSService.getPostListbyPoolSeq(poolSeq, 0);
		List<PostPicVo> postPicList = new ArrayList<>();
		for(int i=0; i < postList.size();i++){
			int postSeq = postList.get(i).getPostSeq();
			List<PostPicVo> postPic = SNSService.getpostPicList(postSeq);
			postPicList.addAll(postPic);
		}
				
		// 풀 포스트 (글 + 사진)
		model.addAttribute("post", postList);
		model.addAttribute("postPic", postPicList);
		
		// 풀 정보
		model.addAttribute("pool", poolPartyService.getPoolInfo(poolSeq));
		
		// 풀 맴버
		model.addAttribute("poolmember", poolPartyService.getPoolMembers(poolSeq));

		// 글쓰기시 스크랩 정보 리스트 가져오기
		if (authUser != null) {
			model.addAttribute( "travelVo", scrapService.showScraps(authUser.getUsrSeq()) );
		}
		
		// 관리자 설정 시 대표 도시 설정 리스트
		model.addAttribute("cityList", adminService.getCity());
		
		return "/poolparty/poolparty_detail";
	}

	
	// 도시 이름 가져오기
	@ResponseBody
	@RequestMapping("/poolsearch")
	public JSONResult searchPoolForm(Model model,
			@RequestParam(value = "ctyName", required = true, defaultValue = "") String ctyName) {
		
		List<CityVo> cityNames = poolPartyService.getCityNames(ctyName);
		if ( cityNames.isEmpty() )
			return JSONResult.fail("No-DATA");
		return JSONResult.success(cityNames);
	}
	
	// 풀파티 메인 에서 도시이름과 날짜로 검색  
	@ResponseBody
	@RequestMapping("/poolsearchList")
	public JSONResult searchPool(@ModelAttribute PoolPartyVo poolPartyVo) {
	
		List<PoolPartyVo> poolList = poolPartyService.getPoolList(poolPartyVo);
		return JSONResult.success(poolList);
	}
	
	// 풀파티 생성 URL
	@Auth
	@ResponseBody
	@RequestMapping("/make")
	public String MakePoolParty(@RequestParam(value="usrSeq",required=true) int userSeq,
								@AuthUser UserVo authUser
								){
		int poolpartyNum = poolPartyService.createPoolparty(authUser, userSeq);
		return "OK "+ poolpartyNum;
	}
	
	// 풀파티 좋아요/좋아요 취소 URL
	@Auth
	@ResponseBody
	@RequestMapping("/liketoggle")
	public String ToggleLikePoolParty(@RequestParam(value="poolpartySeq",required=true) int poolpartySeq,
								@AuthUser UserVo authUser
								){
		
		poolPartyService.togglePoolparty(poolpartySeq, authUser);
		return "OK";
	}
	
	
	// 풀파티 초대 URL
	@Auth
	@ResponseBody
	@RequestMapping("/invite")
	public String invitePoolParty(@RequestParam(value="poolpartySeq",required=true) int poolpartySeq,
								@RequestParam(value="usrSeq",required=true) int usrSeq
								){
		
		poolPartyService.enterPoolparty(poolpartySeq, usrSeq, false);
		return "OK";
	}

	// 풀파티 설정 변경
	@Auth
	@RequestMapping("/saveSetting")
	public String saveSetting(@ModelAttribute PoolPartyVo poolPartyVo,
								@RequestParam("poolPicture") MultipartFile file){
		System.out.println(poolPartyVo);
		
		poolPartyService.postSetSave(poolPartyVo, file);
		
		return "redirect:/poolparty/"+poolPartyVo.getPoolSeq();
	}

}
