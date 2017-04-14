/*
Copyright 2012 Ryuji Yamashita

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
Distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package com.poorip.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.poorip.security.Auth;
import com.poorip.service.UserService;
import com.poorip.vo.UserVo;

import facebook4j.Account;
import facebook4j.Facebook;
import facebook4j.FacebookException;
import facebook4j.FacebookFactory;
import facebook4j.ResponseList;
import facebook4j.auth.AccessToken;
import facebook4j.conf.ConfigurationBuilder;
import facebook4j.internal.org.json.JSONArray;

@Controller
public class FacebookController {

	@Autowired
	UserService userService;
	
	private Facebook facebook = null;
	private FacebookFactory ff = null;
	
	public void init(){
		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setDebugEnabled(true)
		  .setOAuthAppId("322180811531159")
		  .setOAuthAppSecret("1687e6558435dac95b6a121a01f9923e")
		  .setOAuthAccessToken("322180811531159|_t5ejBKhyPvtR19gbvJUNnKhtKY")
		  .setOAuthPermissions("public_profile,email,gender");
		ff = new FacebookFactory(cb.build());
		facebook = ff.getInstance();
	}
	
	

	@RequestMapping("/fb")
	public String test(Model model)
			throws FacebookException{
//		
////		Facebook facebook = new FacebookFactory().getInstance();
		// 초기화 앱 인증 설정
		init();
		System.out.println("facebook");
		System.out.println(facebook);
		AccessToken info = facebook.getOAuthAccessTokenInfo();
		System.out.println("info");
		System.out.println(info);
		model.addAttribute("token", info);

		
		// 로그인 처리
		ResponseList<Account> accounts = facebook.getAccounts();
		System.out.println("accounts");
		System.out.println(accounts);
		Account yourPageAccount = accounts.get(0);  // if index 0 is your page account.
		System.out.println(yourPageAccount);
		String pageAccessToken = yourPageAccount.getAccessToken();
		System.out.println(pageAccessToken); 
		
		// GET
//		RawAPIResponse res = facebook.callGetAPI("me");
//		JSONObject jsonObject = actual.asJSONObject();
//		String id = jsonObject.getString("id");
				
		
//		User user = facebook.getUser(id1.getId(), new Reading().fields("email"));
		//		facebook.getOAuthAccessToken(oauthCode);
//		 
//		
//        request.getSession().setAttribute("facebook", facebook);
//        StringBuffer callbackURL = request.getRequestURL();
//        int index = callbackURL.lastIndexOf("/");
//        callbackURL.replace(index, callbackURL.length(), "").append("/callback");
//        response.sendRedirect(facebook.getOAuthAuthorizationURL(callbackURL.toString()));
//        
		
		
		return "fbtest";
	}
	
	@Auth
	@RequestMapping("/fb2")
	public String jsp(Model model) {
		return "/user/fbtest";
	}
	
	
	@RequestMapping("/fb3")
	public String js(Model model) {
		return "/user/fbtest2";
	}
	
//	@ResponseBody	
	@RequestMapping("/fbget")
	public String recv(@ModelAttribute UserVo uservo,
						Model model){
		System.out.println("Success");
		System.out.println(uservo);
		
		model.addAttribute("email", userService.oneStep(uservo).getUsrEmail());
		return "redirect:/user/login";
	}
	
			
	
}
