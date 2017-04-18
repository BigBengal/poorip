package com.poorip.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poorip.security.Auth;
import com.poorip.security.AuthUser;
import com.poorip.service.UserService;
import com.poorip.vo.FacebookUser;
import com.poorip.vo.UserVo;


@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService userService;
	
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
	
	@Auth
	@RequestMapping("/fb")
	public String jsp(Model model) {
		return "/user/fbtest";
	}
	
	
	@RequestMapping("/fb2")
	public String js(Model model) {
		return "/user/fbtest2";
	}
	
	@ResponseBody
	@RequestMapping("facebookinfo")
	public String facebookinfo(@AuthUser UserVo userVo){
		return userVo.getUsrNick();
	}
	
	@RequestMapping("/facebooklogin")
	public String login(@ModelAttribute FacebookUser facebookuservo,
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
			userVo.setUsrNick(facebookuservo.getName());
			userVo.setUsrProfile(facebookuservo.getLink());
			userVo.setUsrLang(facebookuservo.getLocale());
			if ( facebookuservo.getBirthday() != null )
				userVo.setUsrBd(facebookuservo.getBirthday());
			userService.joinUser(userVo);
			
			return "redirect:/user/addinfo";
		}
		model.addAttribute("email", facebookuservo.getEmail());
		return "redirect:/user/login";
	}
	
	@RequestMapping("/addinfo")
	public String addInfo(){
		return "user/addinfo";
	}
	
	@RequestMapping("/addinfosave")
	public String addInfoSave(@ModelAttribute UserVo userVo,
							Model model){
		
		// UsrSeq는 jsp 페이지에서 같이 보내주어야 함
		
		// 필수정보 (언어, 닉네임, 성별(페북연동은 필요없음,주석)
		userService.UpdateRequiredInfo(userVo);

		// 옵션 정보(취향 정보, 프로필, 해쉬태그, 노티)
		userService.UpdateOptionInfo(userVo);
		
		model.addAttribute("email", userVo.getUsrEmail());
		return "redirect:/user/login";
	}
	
	@RequestMapping("/addreqsave")
	public String addRequiredSave(@ModelAttribute UserVo userVo,
							Model model){
		
		// UsrSeq는 jsp 페이지에서 같이 보내주어야 함
		// 필수정보 (언어, 닉네임, 성별(페북연동은 필요없음,주석)
		userService.UpdateRequiredInfo(userVo);
		
		model.addAttribute("email", userVo.getUsrEmail());
		return "redirect:/user/login";
	}
	
	@RequestMapping("/addoptsave")
	public String addOptionSave(@ModelAttribute UserVo userVo,
							Model model){
		
		// UsrSeq는 jsp 페이지에서 같이 보내주어야 함
		// 옵션 정보(취향 정보, 프로필, 해쉬태그, 노티)
		userService.UpdateOptionInfo(userVo);
		
		model.addAttribute("email", userVo.getUsrEmail());
		return "redirect:/user/login";
	}
	
	@RequestMapping("facebooklogout")
	public String logout(){
		logger.info("Logout");
		return "redirect:/user/logout";
		
	}
	
			
	
}
