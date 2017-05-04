/**
 * 
 */
var writeVisible = false;	//글쓰기 버튼
var poolikeyn = false; 		//풀파티 좋아요 버튼 flag

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
	
	$( "#setting" ).on( "click", function() {
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
					    	usrInfo += response.data.profile.usrInfo + "</p>";
				    	else
				    		usrInfo += "없음 </p>";
					    usrInfo += "<p> 해쉬태그 : ";
			    		if (response.data.profile.usrHashtag != null )
			    			usrInfo += response.data.profile.usrHashtag + "</p>";
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
			
	});
	
	$( ".datepicker" ).datepicker({
    	dateFormat: 'yy-mm-dd',
        showOtherMonths: true,
        selectOtherMonths: true,
        autoclose: true,
        changeMonth: true,
        changeYear: true,
    });
	
		
	$("#poollike").click(function(){
		likeToggle(poolikeyn);
	});
		
});

function showWrite(){
	if ( writeVisible == true ) {
		$("#write").hide();	
		writeVisible = false;
	} else {
		$("#write").show();
		writeVisible = true;
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