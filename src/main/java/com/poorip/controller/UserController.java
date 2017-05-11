package com.poorip.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poorip.dto.JSONResult;
import com.poorip.security.Auth;
import com.poorip.security.AuthUser;
import com.poorip.service.ScrapCityService;
import com.poorip.service.ScrapService;
import com.poorip.service.UserService;
import com.poorip.vo.FacebookUserVo;
import com.poorip.vo.UserVo;


@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService userService;

	// 프로필에서 스크랩정보 가져오기
	@Autowired
	ScrapService scrapService;
	
	// 프로필에서 스크랩시티 정보 가져오기
	@Autowired
	ScrapCityService scrapCityService;
	
//	public void init(){
//		ConfigurationBuilder cb = new ConfigurationBuilder();
//		cb.setDebugEnabled(true)
//		  .setOAuthAppId("322180811531159")
//		  .setOAuthAppSecret("1687e6558435dac95b6a121a01f9923e")
//		  .setOAuthAccessToken("322180811531159|_t5ejBKhyPvtR19gbvJUNnKhtKY")
//		  .setOAuthPermissions("public_profile,email,gender");
//		ff = new FacebookFactory(cb.build());
//		facebook = ff.getInstance();
//	}
	
	@RequestMapping("/fb")
	public String jsp(Model model) {
		return "/user/filetest";
	}
	
	
	@RequestMapping("/fb2")
	public String js(Model model) {
		return "/user/fbtest2";
	}
	
	
	// 페이스북 로그인 버튼 연결
	@RequestMapping("/facebooklogin")
	public String login(@ModelAttribute FacebookUserVo facebookuservo,
						Model model){
		
		UserVo userVo = new UserVo();
		userVo.setUsrEmail(facebookuservo.getEmail());
		
		// 가입이 되지 않았으면 가입 처리
		// 최초 가입 시에는 추가 정보 요구 
		// 가입이 되어있으면 로그인 처리
		// 오류시 메인 페이지 이동
		
		if ( userService.isExistUser(userVo) == false) { // 계정 정보가 있으면 Y 없으면 N
			// 가입 처리
			userVo.setUsrEmail(facebookuservo.getEmail());
			userVo.setUsrGender(facebookuservo.getGender());
			//userVo.setUsrNick(facebookuservo.getName());
			userVo.setUsrProfile(facebookuservo.getLink());
			userVo.setUsrLang(facebookuservo.getLocale());
			if ( facebookuservo.getBirthday() != null )
				userVo.setUsrBd(facebookuservo.getBirthday());
			userService.joinUser(userVo);
			
			//추가정보 가입 Flag 세션 저장 후 리턴 값 지정용
			model.addAttribute("addinfo", "addinfo");
		}
		model.addAttribute("email", facebookuservo.getEmail());
		return "redirect:/user/login";
	}
	
	// 페북 로그인 버튼으로 로그인시, $post 통신 리턴 값 전용
	@ResponseBody	
	@RequestMapping("facebookinfo")
	public String facebookinfo(@AuthUser UserVo userVo){
		return userVo.getUsrNick();
	}
	
	// 페북 로그인 버튼으로 로그인시, 최초 가입 통신 리턴 값 전용
	@ResponseBody
	@RequestMapping("/addrtninfo")
	public String addInfoReturn(){
		return "addinfo";
	}
	
	
	// 닉네임 중복 체크
	@ResponseBody
	@RequestMapping("/isExistNick")
	public String isExistNick(@RequestParam("usrNick") String nickName){
		UserVo userVo = new UserVo();
		userVo.setUsrNick(nickName);
		return (userService.isExistNick(userVo)==true ? "Already used" : "true");
	}
	
	
	// 추가 정보 가입 페이지로 이동
	@Auth
	@RequestMapping("/addinfo")
	public String addInfo(Model model, @AuthUser UserVo authUser){
		logger.info("addinfo() Start");
		UserVo uservo = userService.getUser(authUser);
		model.addAttribute("user", uservo);
		return "user/addinfo";
	}
	
	// 추가 정보 가입 페이지에서 저장
	@RequestMapping("/addinfosave")
	public String addInfoSave(@ModelAttribute UserVo userVo,
							Model model){
		logger.info("addinfoSave() Start");
		// UsrSeq는 jsp 페이지에서 같이 보내주어야 함
		
		// 필수정보 (언어, 닉네임, 성별(페북연동은 필요없음,주석)
		userService.UpdateRequiredInfo(userVo);

		// 옵션 정보(취향 정보, 프로필, 해쉬태그, 노티)
		userService.UpdateOptionInfo(userVo);
		
		model.addAttribute("email", userVo.getUsrEmail());
		return "redirect:/user/addinfo";
	}
	
	@RequestMapping("/addreqsave")
	public String addRequiredSave(@ModelAttribute UserVo userVo,
							Model model){
		logger.info("addreqsave() Start");
		
		// UsrSeq는 jsp 페이지에서 같이 보내주어야 함
		// 필수정보 (언어, 닉네임, 성별(페북연동은 필요없음,주석)
		userService.UpdateRequiredInfo(userVo);
		
		model.addAttribute("email", userVo.getUsrEmail());
		return "redirect:/user/addinfo";
	}
	
	@RequestMapping("/addoptsave")
	public String addOptionSave(@ModelAttribute UserVo userVo,
							Model model){
		
		// UsrSeq는 jsp 페이지에서 같이 보내주어야 함
		// 옵션 정보(취향 정보, 프로필, 해쉬태그, 노티)
		userService.UpdateOptionInfo(userVo);
		
		model.addAttribute("email", userVo.getUsrEmail());
		return "redirect:/user/addinfo";
	}
	
	@RequestMapping("facebooklogout")
	public String logout(){
		logger.info("Logou11t");
		return "redirect:/user/logout";
		
	}
	
	@ResponseBody
	@RequestMapping("/getProfile")
	public JSONResult getProfile(@RequestParam(value="usrSeq") int usrSeq){
		if ( usrSeq == 0)
			return JSONResult.fail("No usrSeq");
				
		Map<String, Object> map = new HashMap<>();
		map.put("profile", userService.SearchPersonListbySeq(usrSeq) );
		map.put("scrapcity", scrapCityService.showCity(usrSeq));
		
		return JSONResult.success(map);
	}
	
			
	
}
