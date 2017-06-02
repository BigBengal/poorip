/**
 * 
 */
var writeVisible = false;	//글쓰기 화면
var modifyVisible = false;	//글수정 화면
var poolikeyn = false; 		//풀파티 좋아요 버튼 flag
var delta = 500;			// 리스트 부르기 시간 텀
var timer = null;			// 타이머 변수
var page = 1;
var isEnd = false;

$(document).ready(function(){
	
	// 풀파티 설정 다이얼로그 
	dialog = $( "#dialog-form" ).dialog({
	    	autoOpen: false,
	        height: 480,
	        width: 600,
	        modal: true,
	        buttons: {
	          "Save": function submit_form(){
	        	    $('#poolsetting').submit();
	          },
	          Cancel: function() {
	            dialog.dialog( "close" );
	          }
	        },
	        close: function() {
	        	dialog.dialog( "close" );
	        }
	  } );
	
	$("#pool-setting").click(function() {
	      dialog.dialog( "open" );
	    });
	
	
	// 풀파티 맴버 프로필 보기
	$(".poolmemberlist").on("click", function() {
		var usrSeq = $(this).data("usrseq");

		
		// Ajax 통신
		$.ajax( {
		    url : "/poorip/user/getProfile",
		    type: "post",
		    dataType: "json",
		    data: { "usrSeq" : usrSeq },
		    success: function( response ){
		    	var usrInfo = "";
				var scrapCityInfo = "";
		    	
//	 		    	console.log	( response );
			       if( response.result == "fail") {
			    	   console.log( response );
			    	   return;
			       }

			    	//통신 성공 (response.result == "success" )
			    	if(response.result == "success" ) {
			    		usrInfo += "<p> 닉네임 : " + response.data.profile.usrNick + "</p>";
			    		usrInfo += "<p> <img src=" + response.data.profile.usrProfile + "></p>";
			    		usrInfo += "<p> 자기소개 : ";
			    		
			    		if (response.data.profile.usrInfo != null )
					    	usrInfo += response.data.profile.usrInfo.replace(/</gi,"&lt;") + "</p>";
				    	else
				    		usrInfo += "없음 </p>";
					    usrInfo += "<p> 해쉬태그 : ";
			    		if (response.data.profile.usrHashtag != null )
			    			usrInfo += response.data.profile.usrHashtag.replace(/</gi,"&lt;") + "</p>";
			    		else 
			    			usrInfo += "없음 </p>";
			    		
			    		$( response.data.scrapcity ).each( function(index, vo){
			    			//스크랩 도시 정보
			    			scrapCityInfo += "<p> 방문 예정 나라 : " + vo.ctyName + " ( ";
			    			if (vo.dateFrom != null )
			    				scrapCityInfo += vo.dateFrom;
			    			if (vo.dateTo != null )	
			    				scrapCityInfo += " ~ " + vo.dateTo; 
							if (vo.dateFrom == null && vo.dateTo == null)	
								scrapCityInfo += "미정";
							scrapCityInfo += " )</p>";
			    			
			    		});	
//	 			    		$( response.data.scrap ).each( function(index, vo){
//	 			    			//스크랩 정보
//	 		 				});

			    		$("#profile").html(usrInfo + scrapCityInfo);	
			    	}
			    	
			    	
//	 			    	$( response.data.scrap ).each( function(index, vo){
//	 					})
					
			       return true;
		    }
		   });
		
		
		$( "#profile" ).dialog({
//	 	    	autoOpen: false,
	        height: 400,
	        width: 450,
	        modal: true,
	        buttons: {
	          Close: function() {
	        	$(this).dialog( "close" );
	          }
	        }
	  } );
	});
	
	// Animations
	//-----------------------------------------------
	if (($("[data-animation-effect]").length>0) && !Modernizr.touch) {
		$("[data-animation-effect]").each(function() {
			var $this = $(this),
			animationEffect = $this.attr("data-animation-effect");
			if(Modernizr.mq('only all and (min-width: 768px)') && Modernizr.csstransitions) {
				$this.appear(function() {
					setTimeout(function() {
						$this.addClass('animated object-visible ' + animationEffect);
					}, 400);
				}, {accX: 0, accY: -130});
			} else {
				$this.addClass('object-visible');
			}
		});
	};
	
	// Fixed header
	//-----------------------------------------------
	$(window).scroll(function() {
		if (($(".header.fixed").length > 0)) { 
			if(($(this).scrollTop() > 0) && ($(window).width() > 767)) {
				$("body").addClass("fixed-header-on");
			} else {
				$("body").removeClass("fixed-header-on");
			}
		};
	});

	$(window).load(function() {
		if (($(".header.fixed").length > 0)) { 
			if(($(this).scrollTop() > 0) && ($(window).width() > 767)) {
				$("body").addClass("fixed-header-on");
			} else {
				$("body").removeClass("fixed-header-on");
			}
		};
		var likeonoff = $("#poollike").data("onoff");
		if(likeonoff == 'on'){
			poolikeyn = true;
		} else {
			poolikeyn = false;
		}
			
		// 갤러리아 이미지 슬라이드
		$(".galleria").each(function(index){
			$(this).find("img").each(function(index){
				if(index == 0){
					var heightV = $(this).height();
					var postSeq = $(this).data('seq');
					if(heightV == 0 || typeof heightV == "undefined"){
						console.log("can NOT measure : "+heightV);
						heightV = 400;
					}
//					console.log(heightV);
//					console.log($(this).data('seq'));
					Galleria.loadTheme('/poorip/assets/js/galleria.classic.js');
					Galleria.run('#postPic-'+postSeq , { debug: false, lightbox: true , height: heightV});
				}
			})
		});
		
		
		
	});
	
	var fromdt = $( "#fromdate" ).datepicker({
    	dateFormat: 'yy-mm-dd',
        showOtherMonths: true,
        selectOtherMonths: true,
        changeMonth: true,
        changeYear: true,
        numberOfMonths : 2
    }).on("change", function() {
		todt.datepicker("option", "minDate", getDate(this));
    });
	var todt = $( "#todate" ).datepicker({
    	dateFormat: 'yy-mm-dd',
        showOtherMonths: true,
        selectOtherMonths: true,
        changeMonth: true,
        changeYear: true,
        numberOfMonths : 2
	}).on("change", function() {
	   	fromdt.datepicker("option", "maxDate", getDate(this));
	});
	
	function getDate(element) {
		var date;

		try {
			date = $.datepicker.parseDate('yy-mm-dd', element.value);
		} catch (error) {
			date = null;
		}
		return date;
	}
	
	// 풀파티 좋아요 버튼
	$("#poollike").click(function(){
		likeToggle(poolikeyn);
	});
		
	// 글 수정 버튼
	$(document).on("click",".modify",function() {
		var postSeq = $(this).data("postseq");
		
		if (modifyVisible == true){
			showModify();
			return;
		}
			
//		console.log(postSeq);
		$.ajax( {
		    url : "/poorip/poolparty/get/"+postSeq,
		    type: "post",
		    dataType: "json",
	//				    data: ,
		    success: function( response ){
		    	
		    	console.log	( response );
		    	if( response.result == "fail") {
		    	   console.log( response );
		    	   return;
		    	}
		    	$("#modifyeachform").remove();
				
		       	var html = "<div id='modifyeachform'>" + $("#modifyform").html();
				$( "#post-"+postSeq ).append(html);
				showModify();

				$("#modifyeachform #update-postSeq").val(postSeq);
			    $("#modifyeachform #update-title").val(response.data.title);
			    $("#modifyeachform #update-contents").val(response.data.contents);
			    $("#modifyeachform #update-trv-seq").val(response.data.trvSeq).change();
			    if (response.data.reviewPubYn == 'Y'){
			    	$("#modifyeachform #update-reviewPubYn-y").prop("checked", true);
			    } else {
			    	$("#modifyeachform #update-reviewPubYn-n").prop("checked", true);
			    }
//			    $("#modifyeachform #update-reviewPubYn").val(response.data.reviewPubYn).change();
			    if (response.data.hidden == 'Y'){
			    	$("#modifyeachform #update-hidden-y").prop("checked", true);
			    } else {
			    	$("#modifyeachform #update-hidden-n").prop("checked", true);
			    }
		    },
		    error: function( XHR, status, error ){
		       console.error("ERROR");
		    }
		});    
	});
	
	
	// 글 공유 버튼
	$(document).on("click",".sharepost",function() {
		var postSeq = $(this).data("postseq");
		console.log(postSeq);
		$( "#dialog-confirm_share" ).dialog({
		    resizable: false,
		    height: "auto",
		    width: 400,
		    modal: true,
		    buttons: {
		      "Confirm": function() {
		        // Ajax 통신
				$.ajax( {
				    url : "/poorip/poolparty/share/"+postSeq,
				    type: "post",
				    dataType: "json",
				 /*   data:"",*/
				//  contentType: "application/json",
				    success: function( response ){
				    	console.log	( response );
				       if( response.result == "fail") {
				    	   console.log( response.message );
				    	   return;
				       }
				    	//통신 성공 (response.result == "success" )
						console.log( "APPROVE" + response.data );
				    	
				    	
				    },
				    error: function( XHR, status, error ){
				       console.log(error);
				    }

				   });
		        $( this ).dialog( "close" );
		      },
		      Cancel: function() {
		        $( this ).dialog( "close" );
		      }
		    }
		  });
	});
		
	// 글 삭제 버튼
	$(document).on("click",".delete",function() {
		var postSeq = $(this).data("postseq");
		var usrSeq = $(this).data("usrseq");
//		console.log(postSeq);
		$( "#dialog-confirm_delete" ).dialog({
		    resizable: false,
		    height: "auto",
		    width: 400,
		    modal: true,
		    buttons: {
		      "Confirm": function() {
		        // Ajax 통신
				$.ajax( {
				    url : "/poorip/poolparty/delete/"+postSeq,
				    type: "post",
				    dataType: "json",
				    data: { usrSeq : usrSeq },
				//  contentType: "application/json",
				    success: function( response ){
//				    	console.log	( response );
				       if( response.result == "fail") {
				    	   console.log( response.message );
				    	   return;
				       }
				    	//통신 성공 (response.result == "success" )
						console.log( "APPROVE" + response.data );
				    	$( "#post-"+postSeq ).remove();
				    	
				    },
				    error: function( XHR, status, error ){
				       console.log("ERROR");
				    }

				   });
		        $( this ).dialog( "close" );
		      },
		      Cancel: function() {
		        $( this ).dialog( "close" );
		      }
		    }
		  });
	});
	

	// 스크롤 Live mapping
	$( window ).on( 'scroll', function( ) {
		if ( isEnd == false ){
			$("#loading").addClass("loading")
		}
		
		var $window = $(this);
		var scrollTop = $window.scrollTop();
		var windowHeight = $window.height();
		var documentHeight = $(document).height();
		
		clearTimeout( timer );
		// 스크롤이 바닥이 되었을 때 
		if( scrollTop + windowHeight + 10 >= documentHeight ) {
			timer = setTimeout( showList, delta );
		}
	} );
	

});


function showList(){
	
	var poolseq = $("#poolSeq").val();
	var authUsrSeq = $("#authuser-pool").val();
	var html = "";
	if ( isEnd == true ){
		$("#loading").removeClass("loading")
		return;
	}
	
	// Ajax 통신
	$.ajax( {
	    url : "/poorip/poolparty/"+poolseq+"/view/"+page,
	    type: "get",
	    dataType: "json",
	    data: "",
	//  contentType: "application/json",
	    success: function( response ){
	  
	    	if( response.result != "success" ) {
	    		console.log( response.message );
	    		return;
	    	}
	    	if( response.data.post.length== 0 ) {
//	 	    		console.log("FINISH");
	    		isEnd = true;
	    		return;
	    	}
//	 	    	console.log( response );
	    	var postPic = [] , i=0;
			$( response.data.post ).each( function(index, vo){
				var Nonmember = true;
//	 				console.log( index + ":" + vo.post + vo.postPic );
				html = "<div id='post-"+vo.postSeq+"' class='col-md-6 col-md-offset-4 pool-detail-post' style='margin-left: 15%; text-align:center;'>";
				$(response.data.poolmemList).each(function(index,vo2) {
					
				if(vo2.usrSeq==vo.usrSeq) { 
					if(vo2.gender=='F'){
					html = html +"<div class='row margin_up_down post-header female'>";
					Nonmember=true;
					return false;
					}
					if(vo2.gender=='M') {
					html = html +"<div class='row margin_up_down post-header male'>";
					Nonmember=true;
					return false;
					}
				
				} else {
					Nonmember = false;
				}
				
				});
				console.log(Nonmember)
				
				if(Nonmember==false) {
					html = html +"<div class='row margin_up_down post-header nonmember'>";
				}
				
				html = html + "<div class='col-md-6 img_inline'>"+
				"	<img src='"+vo.picture+"'> <h6>"+vo.name+"</h6>";
				if(vo.trvName!='관련 여행정보 없음'){
				html = html + "<h6> in <span style='color:rgba(22, 39, 125, 0.55);'> " + vo.trvName + "</span></h6>"; 
				}
				
				html = html + "</div>"+
				"<div class='col-md-6' style='text-align: right; margin-top: 5%; font-size:0.9em; float:right; margin-top:0px;'>"+ vo.crtDate+
				"</div>"+
				"<h3><strong>"+vo.title+"</strong></h3>"+
				"</div>";

				
				//포스트 사진
				 if(response.data.postPic.length> 0) {
//					 console.log("exist postPic");
					 var isExistPic = 'N';
					 $( response.data.postPic).each( function( index2, picvo) {
						 if(vo.postSeq == picvo.postSeq){
							 if(isExistPic == 'N'){
								 html = html+"<div class='galleria' id='postPic-"+picvo.postSeq+"'>"
								 postPic[i] = picvo.postSeq;
							 }
//							 html = html+"<div href='/poorip"+picvo.path+"/"+picvo.fileName+"' data-lightbox='"+picvo.postSeq+"' data-title='"+vo.title+"'>" +
							 html = html+"<img src='/poorip"+picvo.path+"/"+picvo.fileName+"' data-seq='"+picvo.postSeq+"'>" ;
							 isExistPic = 'Y';
						 }
					 });
					 if(isExistPic == 'Y'){
						 html = html + "</div>"
						 i++;
					 }
				 }
				 html = html + "<p>"+vo.contents+"</p>"+
					
					"<div class='row margin_up_down underline' style='margin:auto; display:inline-block; width:100%;'>";
				
				 if(vo.usrSeq == authUsrSeq){
					 html = html +
						"<div class='col-md-3 sns-button-left' >"+
						"<button class='sns-post-footer menu_links modify' data-postseq='"+vo.postSeq +"' style='width:50px;' >수정</button>" + 
						"</div>";
				 }
			
				 if(vo.usrSeq >0) {
					html= html+  
						"<div class='col-md-3 sns-button-center ' >" +
						"<button class='sns-post-footer menu_links modify sharepost' style='width:50px;'" +
							"data-postseq='0'"+
								">공유</button>"+
							"</div>";
				
				 }
				 
				 if(vo.usrSeq == authUsrSeq){
						html = html + 
						"<div class='col-md-3 col-md-offset-6 sns-button-right'>"+
						"<button style='width:50px;' class='sns-post-footer menu_links rightalign delete' data-postseq='"+vo.postSeq +"' data-usrseq='"+vo.usrSeq +"'>삭제</button>" +
						"</div>";
				 }
				 html = html +
					"</div>"+
					"</div>";
				 	$("#postList").append(html);
			})
			page++;
			console.log("page:"+page);
			
			//galleria 슬라이드 실행
			$(".galleria > img").load(function(){
				for (var i = 0; i < postPic.length; i++) {
					$pic = $('#postPic-'+postPic[i]+'> img');
//					console.log(i+"번째 이미지");
//					console.log($pic.attr('src'));
					var heightV = $pic.height();
//					console.log("postPic["+i+"]:"+postPic[i]+", heightV:"+heightV);
					if ( heightV == 0){
						heightV = 350;
					}
					Galleria.run('#postPic-'+postPic[i] , { debug: false, lightbox: true , height: heightV});
				}
				postPic =[];
			})
			
//			$(".galleria").each(function(index){
//				$(this).find("img").each(function(index){
//					if(index == 0){
////						console.log(index+"번째 이미지");
////						console.log($(this).attr('src'));
//						var heightV = $(this).height();
//						var postSeq = $(this).data('seq')
////						console.log(heightV);
////						console.log($(this).data('seq'));
//						Galleria.loadTheme('/poorip/assets/js/galleria.classic.js');
//						Galleria.run('#postPic-'+postSeq , { lightbox: true , height: heightV});
//					}
//				})
//			});
			
			
	    },
	    error: function( XHR, status, error ){
	       console.error("ERROR");
	    }
   });
	
	$("#loading").removeClass("loading")
}

function showWrite(){
	
	if ( writeVisible == true ) {
		$("#post-write").hide();
		writeVisible = false;
	} else {
		$("#post-write").show();
		writeVisible = true;
	}
	
}

function showModify(){
	if ( modifyVisible == true ) {
		$("#modifyeachform").hide();
		modifyVisible = false;
	} else {
		$("#modifyeachform").show();
		modifyVisible = true;
	}
	
}

function likeToggle(poolike){

	$.ajax({
	          url : "liketoggle",
	          type : "post",
	          dataType : "json",
	          data: { "poolpartySeq" : $("#poolSeq").val() }, 
	          success: function(data) {
	          	if(data.result != "success"){
	          		console.log("err");
	          		return
	          	}
	        	if (poolike == false){
	        		$("#poollike").removeClass("poollikeon");
		  			$("#poollike").addClass("poollikeoff");
		  			
		  			poolikeyn = true;
// 		  			console.log(data.data);
		  			$("#poollike").text(data.data);
	        	} else {
	        		$("#poollike").removeClass("poollikeoff");
	        		$("#poollike").addClass("poollikeon");
	        		
	        		poolikeyn = false;
// 	        		console.log(data.data);
	        		$("#poollike").text(data.data);
	        	} 
	          }
	        		
	      });
}
function reqeustJoin(){
// 	console.log("reqeustJoin");
	// Ajax 통신
	$.ajax( {
	    url : "invite",
	    type: "post",
	    dataType: "json",
	    data: { "poolpartySeq" : $("#poolSeq").val() },
	    success: function( response ){
// 	    	console.log	( response );
		       if( response.result == "fail") {
		    	   console.log( response );
		    	   return;
		       }
	    	//통신 성공 (response.result == "success" )
	    	if(response.result == "success" ) {
	    		$("#reqeustjoin").text("요청중");
	    	}
	       return true;
	    }
	   });
	
	
}
function invite() {
// 	console.log("invite");
	
	if ($("#inviteNick").val() == ""){
		$("#inviteMsg").text("닉네임입력하세요");
		return;
	}
	$.ajax( {
	    url : "invite",
	    type: "post",
	    dataType: "json",
	    data: { "poolpartySeq" : $("#poolSeq").val() ,
	    	    "usrNm" : $("#inviteNick").val() },
	    success: function( response ){
// 	    	console.log	( response );
		       if( response.result == "fail") {
		    	   $("#inviteMsg").text("요청실패");
		    	   return;
		       }
	    	//통신 성공 (response.result == "success" )
	    	if(response.result == "success" ) {
	    		$("#inviteMsg").text("요청완료");
	    	}
	       return true;
	    }
	   });
}



$(document).ready(function() {
	var sock = null;
	$(document).ready(function() {
		var usrNick = $("#chatusrNick").val();
		
		sock = new SockJS("/poorip/echo-ws");
		sock.onopen = function() {
			sock.send(usrNick  + "님 반갑습니다");
		}
		
		sock.onmessage = function(evt) {
			$("#chatMessage").append(evt.data + "<br/>");
		}
		
		sock.onclose = function() {
			sock.send("퇴장");
		}
		
		$("#sendMessage").click(function() {
			
			
			if($("#message").val() != "") {
				
				sock.send(usrNick + " : " + $("#message").val());
				
				$("message").val("");
			}
			
		})
	});
});
