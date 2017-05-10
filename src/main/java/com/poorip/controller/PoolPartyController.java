package com.poorip.controller;

import static org.mockito.Matchers.intThat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.poorip.dto.JSONResult;
import com.poorip.repository.PoolPostDao;
import com.poorip.security.Auth;
import com.poorip.security.AuthUser;
import com.poorip.service.AdminService;
import com.poorip.service.PoolPartyService;
import com.poorip.service.SNSService;
import com.poorip.service.ScrapService;
import com.poorip.service.UserService;
import com.poorip.vo.CityVo;
import com.poorip.vo.PoolMemberVo;
import com.poorip.vo.PoolPartyVo;
import com.poorip.vo.PostPicVo;
import com.poorip.vo.PostVo;
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

	// 초대시 이름으로 SEQ 가져오기
	@Autowired
	private UserService userService;
	
	// 포스팅 삭제
	@Autowired
	private PoolPostDao poolPostDao;
	
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
		
		// 풀파티의 맴버인지 (초기값 NO)
		String memberYn = "NO";
		
		// 풀 파티 조회수 증가
		poolPartyService.updateHit(poolSeq);
	

		// 풀 포스트
		List<ReviewVo> postList = SNSService.getPostListbyPoolSeq(poolSeq, 0);
		List<PostPicVo> postPicList = new ArrayList<>();
		for(int i=0; i < postList.size();i++){
			int postSeq = postList.get(i).getPostSeq();
			List<PostPicVo> postPic = SNSService.getpostPicList(postSeq);
			postPicList.addAll(postPic);
		}
		
		// 풀파티 포스트 (글 + 사진)
		model.addAttribute("post", postList);
		model.addAttribute("postPic", postPicList);
		
		// 풀파티 정보
		PoolPartyVo poolPartyVo = poolPartyService.getPoolInfo(poolSeq);
		model.addAttribute("pool", poolPartyVo);

		// 풀파티 맴버
		List<PoolMemberVo> memberList = poolPartyService.getPoolMembers(poolSeq);
		model.addAttribute("poolmember", memberList);

		
		// 로그인 사용자 전용
		if (authUser != null) {
			// 풀 좋아요 정보 가져오기 (true/false)			
			model.addAttribute("like", poolPartyService.isLikePoolparty(poolSeq, authUser));
			
			// 글쓰기시 스크랩 정보 리스트 가져오기
			model.addAttribute( "travelVo", scrapService.showScraps(authUser.getUsrSeq()) );
			
			// 해당 풀파티의 맴버인지
			for( PoolMemberVo member : memberList ){
				if (member.getUsrSeq() == authUser.getUsrSeq() ) {
					if ("Y".equals(member.getApprove()) ){
						// 가입완료
						memberYn = "YES";
					} else {
						// 가입 요청 중
						memberYn = "ING";
					}
					break;
				}
			}
//			logger.info("맴버입니다:" + memberYn);
			model.addAttribute( "memberYn", memberYn );
		} 

		// 관리자 설정 시 대표 도시 설정 리스트
		if (authUser != null && poolPartyVo.getManagerUsrSeq() == authUser.getUsrSeq())
			model.addAttribute("cityList", adminService.getCity());
		
		return "/poolparty/poolparty_detail";
	}

	
	// 내 풀파티
	@Auth
	@RequestMapping("/mypool")
	public String myPool(@AuthUser UserVo authUser,
						Model model) {
		
		//내가 가입하여 승인된 풀파티 리스트 
		model.addAttribute("myPoolList", poolPartyService.getMyPoolList(authUser.getUsrSeq() ) );
		
		//내가 가입하여 승인 대기된 풀파티 리스트
		model.addAttribute("myWaitPoolList", poolPartyService.getMyWaitPoolList(authUser.getUsrSeq() ) );

		// 수락 대기 중인 리스트
		model.addAttribute("requestList", poolPartyService.getRequestList(authUser.getUsrSeq() ) );

		return "/poolparty/myPoolList";
	}
	
	//풀파티 글 쓰기
	@Auth
	@RequestMapping("/post")
	public String PoolpartyPost (@AuthUser UserVo userVo,
								@ModelAttribute ReviewVo reviewVo,
								@RequestParam("poolSeq") int[] poolPostSeq,
								MultipartHttpServletRequest request) throws Exception{
		
		
		String pool = Integer.toString(poolPostSeq[0]);
		
		logger.info(reviewVo.toString());
		
		logger.info("poolSeq:"+pool);
		
		List<MultipartFile> postUploadFiles = request.getFiles( "file" );
		
		if(postUploadFiles.get(0).getOriginalFilename()==null||postUploadFiles.get(0).getOriginalFilename().equals("")) {
			SNSService.addPostOnly(reviewVo, poolPostSeq );
			return "redirect:/poolparty/"+poolPostSeq;
		}
		SNSService.addPost( reviewVo, postUploadFiles, poolPostSeq );
		
		return "redirect:/poolparty/"+pool;
	}
	
	
	// 풀파티 설정 변경
	@Auth
	@RequestMapping("/saveSetting")
	public String saveSetting(@ModelAttribute PoolPartyVo poolPartyVo,
								@RequestParam("poolPicture") MultipartFile file){
		poolPartyService.postSetSave(poolPartyVo, file);
		
		return "redirect:/poolparty/"+poolPartyVo.getPoolSeq();
	}
	
	
	///////////////////////////////////////
	
	//  AJAX 통신
	
	//////////////////////////////////////
	
	
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
	public JSONResult ToggleLikePoolParty(@RequestParam(value="poolpartySeq",required=true) int poolpartySeq,
								@AuthUser UserVo authUser
								){
		
		int likeCount = poolPartyService.togglePoolparty(poolpartySeq, authUser);
		return JSONResult.success(likeCount);
	}
	
	// 풀파티 초대 URL
	@Auth
	@ResponseBody
	@RequestMapping("/invite")
	public JSONResult invitePoolParty(@RequestParam(value="poolpartySeq",required=true) int poolpartySeq,
								@RequestParam(value="usrNm",required=false,defaultValue="") String usrNick,
								@AuthUser UserVo authUser
								){
		
		int aprvUsr = 0;
		int usrSeq = authUser.getUsrSeq();
		if ( ! "".equals(usrNick) ){
			logger.info("usrNick:"+usrNick);
			usrSeq = userService.getSeqByNick(usrNick);
			logger.info("usrSeq:"+usrSeq);
			if(usrSeq == 0){
				return JSONResult.fail("No User Seq");
			}
		}
		
		// 데이터 생성자가 방장이면 초대받는 이가 승인자 (usrSeq == 세션유저) 
		// 데이터 생성자가 방장이 아니면 방장이 승인자
		int poolAdminUsrSeq = poolPartyService.getPoolInfo(poolpartySeq).getManagerUsrSeq();
		if( authUser.getUsrSeq() == poolAdminUsrSeq){
			aprvUsr = usrSeq;
		}else {
			aprvUsr = poolAdminUsrSeq;
		}
			
		if (poolPartyService.enterPoolparty(poolpartySeq, usrSeq, false, aprvUsr))
			return JSONResult.success("RequestOK");
		else 
			return JSONResult.fail("RequestErr");
	}

	
	// 초대 수락
	@Auth
	@ResponseBody
	@RequestMapping("/invite/aprv")
	public JSONResult approveInvite(@RequestParam(value="poolpartySeq",required=true) int poolpartySeq,
								@RequestParam(value="usrSeq",required=true) int usrSeq,
								@AuthUser UserVo authUser){
		logger.info(poolpartySeq + "," + usrSeq);
		return JSONResult.success(poolPartyService.approvePoolparty(poolpartySeq, usrSeq, authUser.getUsrSeq()) == true ? "aprvOK" : "ERR");
	}

	// 초대 거절
	@Auth
	@ResponseBody
	@RequestMapping("/invite/reject")
	public JSONResult rejectInvite(@RequestParam(value="poolpartySeq",required=true) int poolpartySeq,
								@RequestParam(value="usrSeq",required=true) int usrSeq,
								@AuthUser UserVo authUser
			){
		logger.info(poolpartySeq + "," + usrSeq);
		return JSONResult.success(poolPartyService.rejectPoolparty(poolpartySeq, usrSeq, authUser.getUsrSeq()) == true ? "rejectOK" : "ERR");		
	}
	
	
	
	// 포스팅 리스트 갱신
	@Auth
	@ResponseBody
	@RequestMapping("{poolSeq}/view/{page}")
	public JSONResult getListbyPage(@PathVariable("page") int page,
									@PathVariable("poolSeq") int poolSeq){
		int startSeq = page * 5;
		// 풀 포스트
		List<ReviewVo> postList = SNSService.getPostListbyPoolSeq(poolSeq, startSeq);
		List<PostPicVo> postPicList = new ArrayList<>();
		for(int i=0; i < postList.size();i++){
			int postSeq = postList.get(i).getPostSeq();
			List<PostPicVo> postPic = SNSService.getpostPicList(postSeq);
			postPicList.addAll(postPic);
		}
		
		// 풀파티 포스트 (글 + 사진)
		Map<String , Object> map = new HashMap<>();
		map.put("post", postList);
		map.put("postPic", postPicList);
		
		return JSONResult.success(map);
	}

	@Auth
	@ResponseBody
	@RequestMapping("/delete/{postSeq}")
	public JSONResult getListbyPage(@PathVariable("postSeq") int postSeq){
		PostVo postVo = new PostVo();
		postVo.setPostSeq(postSeq);

		return JSONResult.success(poolPostDao.deleteByPostSeq(postSeq));
	}
	
}
