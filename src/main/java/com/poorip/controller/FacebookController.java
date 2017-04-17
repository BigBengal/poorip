package com.poorip.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poorip.security.Auth;
import com.poorip.security.AuthUser;
import com.poorip.service.UserService;
import com.poorip.vo.FacebookUser;
import com.poorip.vo.UserVo;


@Controller
public class FacebookController {

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
	@RequestMapping("/fb2")
	public String jsp(Model model) {
		return "/user/fbtest";
	}
	
	
	@RequestMapping("/fb3")
	public String js(Model model) {
		return "/user/fbtest2";
	}
	
	@RequestMapping("/facebooklogin")
	public String login(@ModelAttribute FacebookUser facebookuservo,
						@AuthUser UserVo authUser,
						Model model){
		
		if (authUser == null){
			authUser = new UserVo();
			authUser.setUsrEmail(facebookuservo.getEmail());
			authUser.setUsrGender(facebookuservo.getGender());
			authUser.setUsrNick(facebookuservo.getName());
			authUser.setUsrProfile(facebookuservo.getLink());
			authUser.setUsrLang(facebookuservo.getLocale());
			if ( facebookuservo.getBirthday() != null )
				authUser.setUsrBd(facebookuservo.getBirthday());
			model.addAttribute("email", userService.oneStep(authUser).getUsrEmail());
			return "redirect:/user/login";
		}
		
		return "redirect:/";
	}
	
	@Auth
	@RequestMapping("facebooklogout")
	public String logout(){
		System.out.println("logout");
		return "redirect:/user/logout";
		
	}
	
			
	
}
