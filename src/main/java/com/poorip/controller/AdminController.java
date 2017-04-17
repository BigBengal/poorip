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
import org.springframework.web.multipart.MultipartFile;

import com.poorip.service.AdminService;
import com.poorip.vo.CategoryVo;
import com.poorip.vo.CityVo;
import com.poorip.vo.CountryVo;
import com.poorip.vo.TravelInfoVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private AdminService adminService;
	@Autowired
	
	@RequestMapping("/basic")
	public String adminBasic() {
		return "/admin/admin-info";
	}
	
	@RequestMapping("/addTravel")
	public String addTravelInfoForm( Model model ) {
		
		model.addAttribute( "cateVo", adminService.getCategoryName());
//		model.addAttribute( "countryVo", countryVo );
		model.addAttribute( "cityVo", adminService.getCityName());
		System.out.println(model);
		model.addAttribute( "baseURL", adminService.BASE_URL );
		return "/admin/admin-info";
	}
	
	@RequestMapping("/addTravel/upload")
	public String addTravelInfo( @ModelAttribute TravelInfoVo travelInfoVo,
								 @RequestParam("file") MultipartFile multipartFile,
								 Model model ) {
		adminService.addInfo( travelInfoVo, multipartFile );
		
		return "redirect:/admin/addTravel";
	}
	
	@RequestMapping("/deleteTravel")
	public String deleteTravelInfo() {
		
		return "";
	}

}
