package com.poorip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poorip.dto.JSONResult;
import com.poorip.security.Auth;
import com.poorip.security.AuthUser;
import com.poorip.service.SNSService;
import com.poorip.vo.PostVo;
import com.poorip.vo.UserVo;

@Controller
@RequestMapping("/sns")
public class SNSController {
	
	@Autowired SNSService snsService;
	
	@Auth
	@ResponseBody
	@RequestMapping("/main")
	public JSONResult searchPool( @AuthUser UserVo userVo,
								  @ModelAttribute PostVo postVo,
								  Model model ) {
		postVo.setUsrSeq(userVo.getUsrSeq());
		model.addAttribute( "travelVo", snsService.getTravelInfo() );
		List<PostVo> postList = snsService.getpostList();
		
		return JSONResult.success(postList);
	}
	
	

}
