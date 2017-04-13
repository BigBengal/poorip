package com.poorip.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poorip.service.PoolPartyService;
import com.poorip.vo.PoolPartyVo;

@Controller
public class PoolPartyController {
	
	@Autowired
	private PoolPartyService poolPartyService;
	
	@RequestMapping("/poolserch")
	public String searchPool( @RequestParam( value="cityName", required=true, defaultValue="" ) String cityName,
							  @ModelAttribute PoolPartyVo poolPartyVo,
							   Model model) {
		model.addAttribute( "cityName", cityName );
		
		return "";
	}
	

}
