package com.poorip.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	@RequestMapping("/main/{page}")
	public JSONResult mySNS( @AuthUser UserVo userVo,
							 @PathVariable ( "page" ) Integer page,
							 @ModelAttribute PostVo postVo,
							  Model model ) {
		int usrSeq = userVo.getUsrSeq();
		page = page * 3;
		List<PostVo> map = snsService.getpostList(usrSeq, page);
		
		System.out.println(page);
		return JSONResult.success(map);
	}
	
	

}
