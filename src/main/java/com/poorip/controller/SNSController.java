package com.poorip.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
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
import com.poorip.service.PoolPartyService;
import com.poorip.service.SNSService;
import com.poorip.vo.PostVo;
import com.poorip.vo.ReviewVo;
import com.poorip.vo.UserVo;

@Controller
@RequestMapping("/sns")
public class SNSController {
	
	@Autowired SNSService snsService;
	
	@Autowired PoolPartyService poolPartyService;
	
	@Auth
	@RequestMapping("")
	public String goSNS( @AuthUser UserVo userVo,
						 Model model ) {
		int usrSeq = userVo.getUsrSeq();
		model.addAttribute( "poolpartyList", poolPartyService.getMyPoolList(usrSeq) );
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
							@RequestParam ("to[]") int[] poolPostSeq,
							MultipartHttpServletRequest request) throws IOException {
		
		reviewVo.setUsrSeq( userVo.getUsrSeq() );
		reviewVo.setHidden("N");
		List<MultipartFile> postUploadFiles = request.getFiles( "file" );
		
		if(postUploadFiles.get(0).getOriginalFilename()==null||postUploadFiles.get(0).getOriginalFilename().equals("")) {
			snsService.addPostOnly(reviewVo, poolPostSeq );
			return "redirect:/sns";
		}
		System.out.println(reviewVo);
		snsService.addPost( reviewVo, postUploadFiles,  poolPostSeq );
		
		return "redirect:/sns";
	}
	
	
	@Auth
	@RequestMapping("/post/share")
	public String postShare(@AuthUser UserVo userVo,
							@RequestParam("postSeq") int postSeq,
							@RequestParam("share_to[]") int[] poolPostSeq) {
		System.out.println(postSeq);
		snsService.addPoolPost(poolPostSeq, postSeq);
		
		return "redirect:/sns";
	}
	
	@Auth
	@ResponseBody
	@RequestMapping("/deletePost")
	public JSONResult deletePost( @ModelAttribute PostVo postVo ) {
		boolean result = snsService.deletePost( postVo );
		if( result ){
			Integer postSeq = postVo.getPostSeq();
			return JSONResult.success( postSeq);
		}else{
			return JSONResult.fail( "DB error" );
			
		}
	}
	
	@Auth
	@ResponseBody
	@RequestMapping("/editPost/{postSeq}")
	public JSONResult editPost(@RequestParam ("title") String title, 
			@RequestParam("contents") String contents,
			@RequestParam("trvSeq") String trvSeq1, 
			@RequestParam("reviewPubYn") String reviewPubYn,  
			@PathVariable(value="postSeq", required=false) String postSeq1, 
			@RequestParam (value ="postPicSeqArray", required=false) List<Integer> postPicSeqArray, 
			Model model, MultipartHttpServletRequest req, @AuthUser UserVo userVo) throws FileNotFoundException, IOException{
		
		int postSeq = Integer.parseInt(postSeq1);
		List<MultipartFile> files = new ArrayList<MultipartFile>();
		Iterator<String> itr = req.getFileNames();
				
		while(itr.hasNext()) {
		
		files = req.getFiles(itr.next());
		
		}
		
		if(postPicSeqArray.isEmpty()||postPicSeqArray==null) {
			postPicSeqArray.add(-1);
			ReviewVo reviewVo = new ReviewVo();
			int trvSeq = Integer.parseInt(trvSeq1);
			reviewVo.setUsrSeq(userVo.getUsrSeq());
			reviewVo.setTrvSeq(trvSeq);
			reviewVo.setTitle(title);
			reviewVo.setContents(contents);
			reviewVo.setReviewPubYn(reviewPubYn);
			reviewVo.setHidden("N");
			reviewVo.setPostSeq(postSeq);
			PostVo edited = snsService.updatePost( reviewVo, files, postPicSeqArray );
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put( "post", edited);
			
			return JSONResult.success(map);
		}
		
		ReviewVo reviewVo = new ReviewVo();
		int trvSeq = Integer.parseInt(trvSeq1);
		reviewVo.setUsrSeq(userVo.getUsrSeq());
		reviewVo.setTrvSeq(trvSeq);
		reviewVo.setTitle(title);
		reviewVo.setContents(contents);
		reviewVo.setReviewPubYn(reviewPubYn);
		reviewVo.setHidden("N");
		reviewVo.setPostSeq(postSeq);

		PostVo edited = snsService.updatePost( reviewVo, files, postPicSeqArray );

		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "post", edited);
		map.put("postPic", snsService.getpostPicList(postSeq));
		
		return JSONResult.success(map);
		}
	
	}
	

		