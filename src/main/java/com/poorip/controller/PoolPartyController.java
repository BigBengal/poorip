package com.poorip.controller;

import java.util.List;

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
import com.poorip.service.PoolPartyService;
import com.poorip.vo.CityVo;
import com.poorip.vo.PoolPartyVo;
import com.poorip.vo.UserVo;

@Controller
@RequestMapping("/poolparty")
public class PoolPartyController {
	
	private static final Logger logger = LoggerFactory.getLogger(PoolPartyController.class);
	
	@Autowired
	private PoolPartyService poolPartyService;
	
	@RequestMapping(value={""})
	public String searchPool() {
		
		return "/poolparty/poolMain";
	}

	
	@ResponseBody
	@RequestMapping("/poolsearch")
	public JSONResult searchPoolForm(Model model,
			@RequestParam(value = "ctyName", required = true, defaultValue = "") String ctyName) {
		
		List<CityVo> cityNames = poolPartyService.getCityNames(ctyName);
		if ( cityNames.isEmpty() )
			return JSONResult.fail("No-DATA");
		return JSONResult.success(cityNames);
	}
	
	
	@ResponseBody
	@RequestMapping("/poolsearchList")
	public JSONResult searchPool(@ModelAttribute PoolPartyVo poolPartyVo) {
	
		List<PoolPartyVo> poolList = poolPartyService.getPoolList(poolPartyVo);
		return JSONResult.success(poolList);
	}
	
	@Auth
	@ResponseBody
	@RequestMapping("/make")
	public String MakePoolParty(@RequestParam(value="usrSeq",required=true) int userSeq,
								@AuthUser UserVo authUser
								){
		int poolpartyNum = poolPartyService.createPoolparty(authUser, userSeq);
		return "OK "+ poolpartyNum;
	}
	
	@Auth
	@ResponseBody
	@RequestMapping("/liketoggle")
	public String ToggleLikePoolParty(@RequestParam(value="poolpartySeq",required=true) int poolpartySeq,
								@AuthUser UserVo authUser
								){
		
		poolPartyService.togglePoolparty(poolpartySeq, authUser);
		return "OK";
	}
	
	@Auth
	@ResponseBody
	@RequestMapping("/invite")
	public String invitePoolParty(@RequestParam(value="poolpartySeq",required=true) int poolpartySeq,
								@RequestParam(value="usrSeq",required=true) int usrSeq
								){
		
		poolPartyService.enterPoolparty(poolpartySeq, usrSeq, false);
		return "OK";
	}

}
