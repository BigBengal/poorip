package com.poorip.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poorip.security.AuthUser;
import com.poorip.service.RequestService;
import com.poorip.vo.RequestVo;
import com.poorip.vo.UserVo;

@Controller

public class RequestController {
	
	@Autowired
	RequestService requestService;
	
	@RequestMapping("/comments")
	public String receiveRequest(@ModelAttribute RequestVo requestVo, @AuthUser UserVo userVo) {
		
		if(userVo==null) {
			requestVo.setUsrSeq(-1);
			requestService.insertComments(requestVo);
			System.out.println("유저 로그인 없을시" + requestVo);
			return "redirect:/";
		}
		
		requestVo.setUsrSeq(userVo.getUsrSeq());
		requestService.insertComments(requestVo);
		System.out.println("유저 로그인 있!!을시" + requestVo);
		return "redirect:/";
		
	}
}
