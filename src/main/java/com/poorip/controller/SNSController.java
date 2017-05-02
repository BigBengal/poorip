package com.poorip.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.poorip.dto.JSONResult;
import com.poorip.security.Auth;
import com.poorip.security.AuthUser;
import com.poorip.service.SNSService;
import com.poorip.vo.PostVo;
import com.poorip.vo.ReviewVo;
import com.poorip.vo.UserVo;

@Controller
@RequestMapping("/sns")
public class SNSController {
	
	@Autowired SNSService snsService;
	
	@Auth
	@RequestMapping("")
	public String goSNS( @AuthUser UserVo userVo,
						 Model model ) {
		model.addAttribute( "travelVo", snsService.getTravelInfo() );
		return "sns/snsmain";
	}
	
	@Auth
	@ResponseBody	
	@RequestMapping("/main/{page}")
	public JSONResult mySNS( @AuthUser UserVo userVo,
							 @PathVariable ( "page" ) Integer page,
							  Model model ) {
		int usrSeq = userVo.getUsrSeq();
		page = page * 3;
		List<ReviewVo> post = snsService.getpostList(usrSeq, page);
		Map<Integer, Object> picMap = new HashMap<Integer, Object>();
		for(int i=0; i < post.size(); i++) {
			int postSeq = post.get(i).getPostSeq();
			picMap.put(postSeq , snsService.getpostPicList(postSeq));
			 
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "postPic", picMap);
		map.put( "post", post);
		
		return JSONResult.success( map );
	}
	
	@Auth
	@RequestMapping("/post/upload")
	public String mySNSadd( @AuthUser UserVo userVo,
							@ModelAttribute ReviewVo reviewVo,
							MultipartHttpServletRequest request,			
							Model model ) throws IOException {
		
		reviewVo.setUsrSeq( userVo.getUsrSeq() );
		List<MultipartFile> postUploadFiles = request.getFiles( "file" );
		snsService.addPost( reviewVo, postUploadFiles );
		
		return "redirect:/sns";
	}
	
	@Auth
	@ResponseBody
	@RequestMapping("/deletePost")
	public JSONResult deletePost( @ModelAttribute PostVo postVo ) {
		boolean result = snsService.deletePost( postVo );
		if( result ){
			System.out.println("duaekgnadjkogfj"+postVo.getPostSeq());
			Integer postSeq = postVo.getPostSeq();
			return JSONResult.success( postSeq);


		}else{
			System.out.println("fail"+postVo.getPostSeq());
			return JSONResult.fail( "DB error" );
			
		}
	}
	
	@Auth
	@ResponseBody
	@RequestMapping("/editPost")
	public String editPost(@RequestParam ("title") String title, @RequestParam("contents") String contents, Model model, MultipartHttpServletRequest req){

		System.out.println(title);
		System.out.println(contents);
		Iterator<String> itr = req.getFileNames();
	
		MultipartFile files = req.getFile(itr.next());
		System.out.println(files.getOriginalFilename());

		return "";
	};
	}
	

		