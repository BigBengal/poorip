/**
 * 
 */
var writeVisible = false;	// 글쓰기 화면
var modifyVisible = false;	// 글수정 화면
var poolikeyn = false; 		// 풀파티 좋아요 버튼 flag
var delta = 500;			// 리스트 부르기 시간 텀
var timer = null;			// 타이머 변수
var page = 1;
var isEnd = false;

$(document).ready(function(){
	
	$('.pool-post-contents .img-upload-pool').change(function() {
		 $("#poolimgnames").html('');
		  var i = $(this).prev('label').clone();
		  var file = this.files;
		  
		  for (var i = 0; i < file.length; i++) {
		        $("#poolimgnames").append(file.length + "개의 사진이 업로드 되었습니다. ");
		        return;
		    }
		 
		});
	
	$(document).on("change","#modifyeachform .pool-post-contents .img-edit-pool",function() {
		 $("#modifyeachform .pool-editimgnames").html('');
		  var i = $(this).prev('label').clone();
		  var file = this.files;
		  console.log(file.length);
		  for (var i = 0; i < file.length; i++) {
			  
		        $("#modifyeachform .pool-editimgnames").append(file.length + "개의 사진이 업로드 되었습니다. ");
		        return;
		    }
		 
		});
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
		var poolSeq = $("#chatPoolSeq").val();
		var memUsrSeq = $("#memUsrSeq").val();
		var showbtn = false;
		// Ajax 통신
		$.ajax( {
		    url : "/poorip/user/getProfile",
		    type: "post",
		    dataType: "json",
		    data: { "usrSeq" : usrSeq },
		    success: function( response ){
		    	var usrInfo = "";
				var scrapCityInfo = "";
		    	
// console.log ( response );
			       if( response.result == "fail") {
			    	   console.log( response );
			    	   return;
			       }

			    	// 통신 성공 (response.result == "success" )
			    	if(response.result == "success" ) {
			    		usrInfo += "<div id='profilenick'><h4>" + response.data.profile.usrNick + "</h4></div>";
			    		usrInfo += "<p id='profilepic'> <img src=" + response.data.profile.usrProfile + "></p>";
			    		usrInfo += " <h5>자기소개 </h5> <div id='profileinfo'> ";
			    		
			    		if (response.data.profile.usrInfo != null )
					    	usrInfo += response.data.profile.usrInfo.replace(/</gi,"&lt;") + "</div>";
				    	else
				    		usrInfo += "아직 자기소개가 없습니다! </div>";
					    	usrInfo += "<h5> 해쉬태그 </h5><div id='profilehash'> ";
			    		if (response.data.profile.usrHashtag != null )
			    			usrInfo += response.data.profile.usrHashtag.replace(/</gi,"&lt;") + "</div>";
			    		else 
			    			usrInfo += "#없음 </div>";
			    		scrapCityInfo += "<h5>방문 예정 나라 </h5><div id='profilescrapinfo'>";
			    		
			    		if(response.data.scrapCity == null) {
			    			scrapCityInfo += "Coming Soon! </div>"
			    		}
			    		else {
			    		$( response.data.scrapcity ).each( function(index, vo){
			    			// 스크랩 도시 정보
			    			
			    			scrapCityInfo +=  "<div style='margin:3px;'>" + vo.ctyName + " ( ";
			    			if (vo.dateFrom != null )
			    				scrapCityInfo += vo.dateFrom;
			    			if (vo.dateTo != null )	
			    				scrapCityInfo += " ~ " + vo.dateTo; 
							if (vo.dateFrom == null && vo.dateTo == null)	
								scrapCityInfo += "미정";
							scrapCityInfo += " )</div>";
			    			
			    		});	
			    		}
			    		scrapCityInfo += "</div>"
// $( response.data.scrap ).each( function(index, vo){
// //스크랩 정보
// });

			    		$("#profile").html(usrInfo + scrapCityInfo);	
			    	}
			    	
			    	
// $( response.data.scrap ).each( function(index, vo){
// })
					
			       return true;
		    }
		   });
		
		var buttons = {
			    닫기: function() {
			    $("#profile").dialog("close");
			    }
			};
		
		if(usrSeq == memUsrSeq) {
			buttons["탈퇴"] = function() {
				$("#leave-party").dialog({
					height: 200,
			        width: 250,
			        modal: true,
			        buttons:{
			        	확인 :  function() {
			        	var leavepartyconfirm = $(".leavepartyconfirm").val();
			        	if(leavepartyconfirm==="탈퇴"){
			        	$("#leave-party-yes").submit();
			        	}
			        	else {
			        		swal("정확히 '탈퇴' 를 입력해주세요!");
			        	}
			    }
			     }
				});
			};
		}
		
		$( "#profile" ).dialog({
// autoOpen: false,
	        height: 400,
	        width: 450,
	        modal: true,
	        buttons: buttons,
	  } );
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
					if(heightV < 200){
						heightV = 200;
					}
// console.log(heightV);
// console.log($(this).data('seq'));
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
			
// console.log(postSeq);
		$.ajax( {
		    url : "/poorip/poolparty/get/"+postSeq,
		    type: "post",
		    dataType: "json",
	// data: ,
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
//				console.log(postSeq);
				$("#modifyeachform #update-postSeq").val(postSeq);
			    $("#modifyeachform #update-title").val(response.data.title);
			    $("#modifyeachform #update-contents").val(response.data.contents);
			    $("#modifyeachform #update-trv-seq").val(response.data.trvSeq).change();
			    $("#modifyeachform #update-reviewPubYn-y").attr("id","update-reviewPubYn-y-" + postSeq );
			    $("#modifyeachform label[for='update-reviewPubYn-y']").attr("for","update-reviewPubYn-y-" + postSeq );
			    $("#modifyeachform #update-reviewPubYn-n").attr("id","update-reviewPubYn-n-" + postSeq );
			    $("#modifyeachform label[for='update-reviewPubYn-n']").attr("for","update-reviewPubYn-n-" + postSeq );
			    
			    $("#modifyeachform #update-hidden-n").attr("id","update-hidden-n-" + postSeq );
			    $("#modifyeachform label[for='update-hidden-n']").attr("for","update-hidden-n-" + postSeq );
			    $("#modifyeachform #update-hidden-y").attr("id","update-hidden-y-" + postSeq );
			    $("#modifyeachform label[for='update-hidden-y']").attr("for","update-hidden-y-" + postSeq );
			    
			    $("#modifyeachform #pooleditimg").attr("id","pooleditimg-" + postSeq );
			    $("#modifyeachform label[for='pooleditimg']").attr("for","pooleditimg-" + postSeq );
			    if (response.data.reviewPubYn == 'Y'){
			    	$("#modifyeachform #update-reviewPubYn-y-"+ postSeq ).prop("checked", true);
			    } else {
			    	$("#modifyeachform #update-reviewPubYn-n-"+ postSeq ).prop("checked", true);
			    }
// $("#modifyeachform
// #update-reviewPubYn").val(response.data.reviewPubYn).change();
			    if (response.data.hidden == 'Y'){
			    	$("#modifyeachform #update-hidden-y-"+ postSeq ).prop("checked", true);
			    } else {
			    	$("#modifyeachform #update-hidden-n-"+ postSeq ).prop("checked", true);
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
//		console.log(postSeq);
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
				 /* data:"", */
				// contentType: "application/json",
				    success: function( response ){
				    	swal({
				    		  title: "공유되었습니다!",
				    		  text: "",
				    		  timer: 700,
				    		  showConfirmButton: false
				    		});
				       if( response.result == "fail") {
				    	   console.log( response.message );
				    	   return;
				       }
				    	// 통신 성공 (response.result == "success" )
//						console.log( "APPROVE" + response.data );
				    	
				    	
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
// console.log(postSeq);
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
				// contentType: "application/json",
				    success: function( response ){
// console.log ( response );
				       if( response.result == "fail") {
				    	   console.log( response.message );
				    	   return;
				       }
				    	// 통신 성공 (response.result == "success" )
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
	$("#pool-img-changebtn").click(function() {
		var imgVal = $('#pool-img-upload')
		.val();
		if (imgVal == '') {
			swal("이미지 파일이 없습니다!")
			return false;
		}

		$("#pool-image-form")
		.ajaxForm({
					url : "/poorip/poolparty/changePic",
					enctype : "multipart/form-data",
					dataType : "json",
					success : function(
							response) {
						$(
						'#poolparty-Img-Modal')
						.modal(
						'toggle');
						console
						.log(response);
						document
						.getElementById("pool-main-pic").src = "/poorip"
							+ response.data;
						console
						.log(response.data);
					},
					error : function(
							data) {
						console
						.log("ajax 에러가 발생하였습니다.")
					}

				});
	});
	
	$('.pool-post-contents .img-upload-pool').change(function() {
		 $("#poolimgnames").html('');
		  var i = $(this).prev('label').clone();
		  var file = this.files;
		  
		  for (var i = 0; i < file.length; i++) {
		        $("#poolimgnames").append(file.length + "개의 사진이 업로드 되었습니다. ");
		        return;
		    }
		 
		});
	
	$(document).on("change","#modifyeachform .pool-post-contents .img-edit-pool",function() {
		 $("#modifyeachform .pool-editimgnames").html('');
		  var i = $(this).prev('label').clone();
		  var file = this.files;
		  console.log(file.length);
		  for (var i = 0; i < file.length; i++) {
			  
		        $("#modifyeachform .pool-editimgnames").append(file.length + "개의 사진이 업로드 되었습니다. ");
		        return;
		    }
		 
		});

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
	// contentType: "application/json",
	    success: function( response ){
	  
	    	if( response.result != "success" ) {
	    		console.log( response.message );
	    		return;
	    	}
	    	if( response.data.post.length== 0 ) {
// console.log("FINISH");
	    		isEnd = true;
	    		return;
	    	}
// console.log( response );
	    	var postPic = [] , i=0;
			$( response.data.post ).each( function(index, vo){
				var Nonmember = true;
// console.log( index + ":" + vo.post + vo.postPic );
				html = "<div id='post-"+vo.postSeq+"' class='col-md-7 col-md-offset-4 pool-detail-post' style='margin-left: 15%;'>";
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
//				console.log(Nonmember)
				
				if(Nonmember==false) {
					html = html +"<div class='row margin_up_down post-header nonmember'>";
				}
				
				html = html + "<div class='col-md-6 img_inline'>"+
				"	<img src='"+vo.picture+"'> <h6>"+vo.name+"</h6>";
				if(vo.trvName!='관련 여행정보 없음'){
				html = html + "<h6> in <span style='color:rgba(22, 39, 125, 0.55);'> " + vo.trvName + "</span></h6>"; 
				}
				if (vo.title.length >= 32){
					postTitle = vo.title.substring(0,32) + '...';
				} else {
					postTitle = vo.title;
				}

				html = html + "</div>"+
							"<div class='col-md-6' style='text-align: right; margin-top: 5%; font-size:0.9em; float:right; margin-top:0px;'>"+ vo.crtDate+
							"</div>"+
								"<div style='font-size: 20px; position: absolute; margin-top: 28px;margin-left: 62px;'><strong>"+postTitle+"</strong></div>"+
							"</div>";

				html = html + "<p style='text-align: left; margin-left: 30px;'>"+vo.contents.replace('\n','<br>')+"</p>";
				
				// 포스트 사진
				 if(response.data.postPic.length> 0) {
// console.log("exist postPic");
					 var isExistPic = 'N';
					 $( response.data.postPic).each( function( index2, picvo) {
						 if(vo.postSeq == picvo.postSeq){
							 if(isExistPic == 'N'){
								 html = html+"<div class='galleria' id='postPic-"+picvo.postSeq+"'>"
								 postPic[i] = picvo.postSeq;
							 }
// html = html+"<div href='/poorip"+picvo.path+"/"+picvo.fileName+"'
// data-lightbox='"+picvo.postSeq+"' data-title='"+vo.title+"'>" +
							 html = html+"<img src='/poorip"+picvo.path+"/"+picvo.fileName+"' data-seq='"+picvo.postSeq+"'>" ;
							 isExistPic = 'Y';
						 }
					 });
					 if(isExistPic == 'Y'){
						 html = html + "</div>"
						 i++;
					 }
				 }
				 	
				 html = html + "<div class='row margin_up_down underline' style='margin:auto; display:inline-block; width:100%;'>" +
				 				"<div class='col-md-3 sns-button-left' >";
				 if(vo.usrSeq == authUsrSeq){
					 html = html + "<button class='modify gray_button' data-postseq='"+vo.postSeq +"' style='width:70px;' >수정</button>" ; 
						
				 }
				 
				 html = html + "</div>";
			
				 if(vo.usrSeq >0) {
					html= html+  
						"<div class='col-md-3 sns-button-center ' >" +
						"<button class='sharepost gray_button' style='width:70px; margin:auto;'" +
							"data-postseq='0'"+
								">공유</button>"+
							"</div>";
				
				 }
				 
				 html = html + "<div class='col-md-3 col-md-offset-6 sns-button-right'>";
				 
				 if(vo.usrSeq == authUsrSeq){
						html = html + "<button style='width:70px;' class='rightalign delete gray_button' data-postseq='"+vo.postSeq +"' data-usrseq='"+vo.usrSeq +"'>삭제</button>";
						
				 }
				 html = html +
				 	"</div>" + 
					"</div>"+
					
					"</div>";
				 	$("#postList").append(html);
			})
			page++;
//			console.log("page:"+page);
			
			// galleria 슬라이드 실행
			$(".galleria > img").load(function(){
				for (var i = 0; i < postPic.length; i++) {
					$pic = $('#postPic-'+postPic[i]+'> img');
// console.log(i+"번째 이미지");
// console.log($pic.attr('src'));
					var heightV = $pic.height();
// console.log("postPic["+i+"]:"+postPic[i]+", heightV:"+heightV);
					if ( heightV == 0 || heightV <= 200){
						heightV = 350;
					}
					Galleria.run('#postPic-'+postPic[i] , { debug: false, lightbox: true , height: heightV});
				}
				postPic =[];
			})
			
// $(".galleria").each(function(index){
// $(this).find("img").each(function(index){
// if(index == 0){
// // console.log(index+"번째 이미지");
// // console.log($(this).attr('src'));
// var heightV = $(this).height();
// var postSeq = $(this).data('seq')
// // console.log(heightV);
// // console.log($(this).data('seq'));
// Galleria.loadTheme('/poorip/assets/js/galleria.classic.js');
// Galleria.run('#postPic-'+postSeq , { lightbox: true , height: heightV});
// }
// })
// });
			
			
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
// console.log(data.data);
		  			$("#poollike").text(data.data);
	        	} else {
	        		$("#poollike").removeClass("poollikeoff");
	        		$("#poollike").addClass("poollikeon");
	        		
	        		poolikeyn = false;
// console.log(data.data);
	        		$("#poollike").text(data.data);
	        	} 
	          }
	        		
	      });
}
function reqeustJoin(){
// console.log("reqeustJoin");
	// Ajax 통신
	$.ajax( {
	    url : "invite",
	    type: "post",
	    dataType: "json",
	    data: { "poolpartySeq" : $("#poolSeq").val() },
	    success: function( response ){
// console.log ( response );
		       if( response.result == "fail") {
		    	   console.log( response );
		    	   return;
		       }
	    	// 통신 성공 (response.result == "success" )
	    	if(response.result == "success" ) {
	    		swal({
	    			  title: "",
	    			  text: "<span style='color:#75a6ca;'>풀</span> 가입을 요청했습니다!",
	    			  html: true
	    			});
	    		$("#reqeustjoin").text("승인 대기중");
	    	}
	       return true;
	    }
	   });
	
	
}
function invite() {
// console.log("invite");
	
	if ($("#inviteNick").val() == ""){
		swal({
 		   title: "닉네임을 입력해주세요",
 		   text: "",
 		   imageUrl: "/poorip/assets/images/exclamation-mark.png"
 		 });
		return;
	}
	$.ajax( {
	    url : "invite",
	    type: "post",
	    dataType: "json",
	    data: { "poolpartySeq" : $("#poolSeq").val() ,
	    	    "usrNm" : $("#inviteNick").val() },
	    success: function( response ){
// console.log ( response );
		       if( response.result == "fail") {
		    	   swal({
		    		   title: "요청에 실패하였습니다.",
		    		   text: "상대방의 닉네임을 다시 한번 확인하세요!",
		    		   imageUrl: "/poorip/assets/images/exclamation-mark.png"
		    		 });
		    	   return;
		       }
	    	// 통신 성공 (response.result == "success" )
	    	if(response.result == "success" ) {
	    		swal("요청이 완료되었습니다!", "Have A Fun!", "success")
	    		
	    	}
	       return true;
	    }
	   });
}



$(document).ready(function() {
	var sock = null;
	$(document).ready(function() {
		var usrNick = $("#chatusrNick").val();
		var poolSeq = $("#chatPoolSeq").val();
		
		
		sock = new SockJS("/poorip/echo-ws");
		sock.onopen = function() {
			sock.send(usrNick  + "님 반갑습니다");
		}
		
		sock.onmessage = function(evt) {
			$("#chatMessage-" + poolSeq).append(evt.data + "<br/>");
		}
		
		sock.onclose = function() {
			sock.send("퇴장");
		}
		
		$("#sendMessage-" + poolSeq).click(function() {
			
			console.log(poolSeq);
			if($("#message-" + poolSeq).val() != "") {
				
				sock.send(usrNick + " : " + $("#message-" + poolSeq).val());
				
				$("message-" + poolSeq).val("");
			}
			
		})
	});
});
