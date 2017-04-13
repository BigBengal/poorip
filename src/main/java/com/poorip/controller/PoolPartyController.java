package com.poorip.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poorip.service.PoolPartyService;
import com.poorip.vo.CityVo;

@Controller
@RequestMapping("/poolparty")
public class PoolPartyController {
	
	@Autowired
	private PoolPartyService poolPartyService;
	
	@RequestMapping("/search")
	public String searchPoolForm() {
		return "/mainpage/searchForm";
	}
	
	@RequestMapping("/poolsearch")
	public String searchPoolForm(@RequestParam( value="kwd", required=true, defaultValue="" ) String keyword,
									Model model) {
//		CityVo cityVo = poolPartyService.
//		model.addAllAttributes("keyword", keyword);
		return "";
	}

}
