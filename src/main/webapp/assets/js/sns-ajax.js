
var dialogDeleteForm = null;
var isEnd = false;
var page = 0;

var writeVisible = false;
var shareVisible = false;

var post_render = function(vo) {
	var auth = $("#usr-profile-pic").val();
	var trvInfoName, ctyName;
	if(vo.name == "관련 여행정보 없음") {
		trvInfoName = "Somewhere In Europe";
	} else {
		trvInfoName = vo.name;
	}
	
	if(vo.ctyName =="뱅갈") {
		ctyName = "Mysterious City"; 
	} else {
		ctyName = vo.ctyName
	}
	var post_html = "<div id='sns-post-" + vo.postSeq + "' class='sns-post-group' style='background-color:white ;' >" + 
				   		"<div class='form-group'   style='padding-top: 10px; background-color:#e6e6e6; margin-right: 0px;" + "margin-left: 0px;'>" + 
					   		"<img class='sns-profile-pic' src='"+auth+"'>" +
					   		"<div class='text-center' style='font-size: 20px; padding-bottom: 10px; display:inline-block; margin-left:10px;'><strong>" + vo.title + "</strong>" +
					   			"<h6 style='display:inline-block;'>&nbsp&nbspat " + trvInfoName + "&nbsp[&nbsp" + ctyName + "&nbsp]</h6></div>" +
						   		"<div class='form-group sns-date' >" +
						   			"<p class='col-md-5 sns-date'  style='font-size:13px'>" + vo.crtDate + "</p>" +
						   		"</div>" +
						   	"</div>" +
						   	"<div class='form-group' style='display:block; width:70%; margin:auto;'>" +
						   		"<div class='col-md-offset-4' style='margin:auto;'>" +
//						   			"<p class='col-md-12'>" + 
						   				"<div class='form-group sns-post-content' style='width:100%;'>" +
						   					"<p class='col-md-12 text-center' style='font-size: 15px'>" + vo.contents + "</p>" +
						   				"</div>";
	return post_html;
//						   				"<div class='cycle-slideshow'" +
//									   	"data-cycle-fx='scrollHorz'" +
//									   	"data-cycle-timeout='0'" +
//									   	"data-cycle-prev='prev'" +
//									   	"data-cycle-next='#next' id='first-html-" + vo.postSeq + "'>" ;
//                 $( "#my-sns-list" ).append(post_html);
}

var edit_post_render = function( vo ) {
	   var post_html = "<div id='sns-post-" + vo.postSeq + "' class='sns-post-group' style='background-color: white;'>" + 
	   					"<div class='form-group'  style='padding-top: 10px; background-color:#e6e6e6; margin-right: 0px;" +
                        "margin-left: 0px;'>" + 
                        "<img class='sns-profile-pic' src=''>" +
	                     "<div class='text-center' style='font-size: 20px; padding-bottom: 10px; display:inline-block; margin-left:10px;'><strong>" + vo.title + "</strong></div>" +
	                  "</div>" +
	                  "<div class='form-group sns-post-content'>" +
	               "<div class='col-md-offset-4' style='margin:auto;'>" +
	                     "<p class='col-md-12'>" + 
	                        "<div class='cycle-slideshow'" +
	                           "data-cycle-fx='scrollHorz'" +
	                           "data-cycle-timeout='0'" +
	                           "data-cycle-prev='prev'" +
	                           "data-cycle-next='#next' id='first-html-" + vo.postSeq + "'>" ;

	                 $( "#my-sns-list" ).prepend(post_html);
	}


var postPic_render = function(vo2) {
   if(vo2.fileName!=null) {
	   var postPic_html = 
//		   					"<a class='sns-image' href='/poorip" + vo2.path + "/" + vo2.fileName + " 'width='40%' id='middle-html-" + vo2.postPicSeq +
//		   					"' data-lightbox='sns-images-"+ vo2.postSeq+"' id='middle-html-" + vo2.postSeq + "'>" +
   							"<img src='/poorip" + vo2.path + "/" + vo2.fileName + "'>";
   }
   return postPic_html;
   
//   		$( "#first-html-"+vo2.postSeq ).append(postPic_html);
//   } else {
//	   var postPic_html =  "<div id='middle-html-" + vo2.postPicSeq + "></div>"
//	   $( "#first-html-"+vo2.postSeq ).append(postPic_html);
//   };
}

var last_render = function(vo, picExist, postPicSeqArray) {
//	var postPicSeqArray = postPicSeqArray;
	var last_html = 
//				   "		</p>" +
//				   "	</div>" +
				   "</div>" + 
				   "<div class='row margin_up_down underline' style='display:block; text-align:center; width:100%; margin-left: 0px; margin-top:10px; clear:both;'>" +
					   "<button class='sns-post-footer gray_button' style='width:70px;' id='share-dialog' onclick='postShare(" + vo.postSeq + ")' >공유</button>" +
					   "<button class='sns-post-footer gray_button' style='width:70px; float:right;' onclick='postDelete(" + vo.postSeq + ")' >삭제</button>" +
					   "<button class='sns-post-footer gray_button' style='width:70px; float:left;' ";	
	if(picExist == 'Y') {
	  last_html = last_html +
				  "	onclick='showPostEdit(\"" + vo.contents + "\",\"" + vo.title + "\",\""+vo.trvSeq +"\",\""+vo.postSeq+"\",\""+postPicSeqArray+"\")'>수정</button>" +
				  "</div>" ;
//	  $("#middle-html-"+postPicSeq).after(last_html);
	} else {
		last_html = last_html +
				 " onclick='showPostEdit(\"" + vo.contents + "\",\"" + vo.title + "\",\""+vo.trvSeq +"\",\""+vo.postSeq+"\")'>수정</button>" +
				 "</div>" ;
//		$("#first-html-"+vo.postSeq).after(last_html);
	};
	return last_html;
} 

var showPoolList = function(vo) {
	var poolList = 
				    "<a href=/poorip/poolparty/" + vo.poolSeq + ">" + 
				    "<div>" +
				   "<h6>" + vo.poolName + "</h6>" +
				   "<img src='/poorip" + vo.poolPic + "' class='img100'>" + 
				   "<br><span style='font-size:0.5em; color:black;'>" + vo.ctyName + "</span>" +
				   "</div></a>";
	
	$(".sns-poollist-title").after(poolList);
}

var fetchList = function() {
//	console.log("fetchList");
	if( isEnd == true ) {
		return;
	}
	$(window).data('ajaxready', true).scroll(function(e) {
		if ($(window).data('ajaxready') == false) {
			return;
		};
		if ($(window).scrollTop() >= ($(document).height() - $(window).height())) {
			$(window).data('ajaxready', false);
			$.ajax( {
				url : "sns/main/" + page,
				type : "get",
				dataType: "json",
				data : "",
				success: function( response ) {
//					console.log(response);
					if( response.result != "success" ) {
						return 
					}

					if( response.data.length == 0 ) {
						isEnd = true;
						return;
					}
					var picExist = 'N';
					var postHtml;
					var postPicSeqArray = [];
//					console.log(response.data);
					++page;
					$( response.data.post ).each( function( index, vo) {
//						console.log(vo.name);
						// 글 처음
						postHtml = post_render( vo);
						
//						console.log("datalength" + response.data.postPic[vo.postSeq].length);
						// 사진 추가
						if(response.data.postPic[vo.postSeq].length> 0) {
							//갤러리아 슬라이드 LIB 전용 div 입력
							postHtml = postHtml + "<div class='galleria' id='postPic-"+vo.postSeq+"'>";
							$( response.data.postPic[vo.postSeq]).each( function( index, vo2) {
								postPicSeqArray.push(vo2.postPicSeq); 
								postHtml = postHtml + postPic_render( vo2 );
//								if(index == $( response.data.postPic[vo.postSeq]).length-1) {
//									postPicSeq= vo2.postPicSeq;
//									console.log("postPicSeq:"+postPicSeq);
//								};
							});
							postHtml = postHtml + "</div>";
							picExist = 'Y'
						};
//						console.log(postPicSeqArray);
						// 글 마무리
						postHtml = postHtml + last_render( vo, picExist, postPicSeqArray );
						postPicSeqArray = [];
						picExist = 'N';
						$( "#my-sns-list" ).append(postHtml);	
					});
					
					var postPic = response.data.post
					//galleria 슬라이드 실행
					$(".galleria > img").load(function(){
						for (var i = 0; i < postPic.length; i++) {
							$pic = $('#postPic-'+postPic[i].postSeq+'> img');
//							console.log(i+"번째 이미지");
//							console.log($pic.attr('src'));
							var heightV = $pic.height();
//							console.log("postPic["+i+"]:"+postPic[i].postSeq+", heightV:"+heightV);
							if ( heightV != null ){
								if( heightV == 0) heightV = 400;
								Galleria.loadTheme('/poorip/assets/js/galleria.classic.js');
								Galleria.run('#postPic-'+postPic[i].postSeq , { debug: false, lightbox: true , height: heightV});
							}
						}
						postPic =[];
					})
					$(window).data('ajaxready', true);

				},
				error: function( XHR, status, error ) {
					console.error( status + " : " + error );
				}
			});
		};
	});
};

$(function() {

   $( window ).scroll(function(){
      var $window = $(this);
      var scrollTop = $window.scrollTop();
      var windowHeight = $window.height();
      var documentHeight = $(document).height();
      
      if( scrollTop + windowHeight +3 > documentHeight ) {
    	  
         fetchList();
         
     	};
     	
      });

   });
$(document).ready(function(){
	$('.pool-post-contents #sns-postimg').change(function() {
		 $(".sns-editimgnames").html('');
		  var i = $(this).prev('label').clone();
		  var file = this.files;
		  
		  for (var i = 0; i < file.length; i++) {
		        $(".sns-editimgnames").append(file.length + "개의 사진이 업로드 되었습니다. ");
		        return;
		    }
		 
		});
	
	$('.pool-post-contents #sns-editimg').change(function() {
		 $(".sns-editimgnames").html('');
		  var i = $(this).prev('label').clone();
		  var file = this.files;
		  
		  for (var i = 0; i < file.length; i++) {
		        $(".sns-editimgnames").append(file.length + "개의 사진이 업로드 되었습니다. ");
		        return;
		    }
		 
		});

	$.ajax( {
		url : "sns/main/" + page,
		type : "get",
		dataType: "json",
		data : "",
		success: function( response ) {
//			console.log(response);
			if( response.result != "success" ) {
				return 
			}

			if( response.data.length == 0 ) {
				isEnd = true;
				return;
			}
			var picExist = 'N';
			var postHtml;
			var postPicSeqArray = [];
			++page;
//			console.log(response.data);
			$(response.data.poolList).each(function(index, vo) {
				if(vo.ctyName == null) {
					vo.ctyName = "도시 미정";
				}
				showPoolList(vo);
			});
//			$( response.data.post ).each( function( index, vo) {
//				var trvInfoName;
//				var ctyName;
//				
//				post_render( vo, trvInfoName, ctyName );
//				if(response.data.postPic[vo.postSeq].length> 0) {
//					$( response.data.postPic[vo.postSeq]).each( function( index, vo2) {
//						postPicSeqArray.push(vo2.postPicSeq); 
//						postPic_render( vo2, vo );
//
//						if(index == $( response.data.postPic[vo.postSeq]).length-1) {
//							postPicSeq= vo2.postPicSeq;
//						};
//
//					});
//				};
//				last_render( vo, postPicSeq, postPicSeqArray );
//				postPicSeqArray = [];
//				postPicSeq= null;
//			});
			$( response.data.post ).each( function( index, vo ) {
//				console.log(vo.name);
				// 글 처음
				postHtml = post_render( vo);
				
//				console.log("datalength" + response.data.postPic[vo.postSeq].length);
				// 사진 추가
				if(response.data.postPic[vo.postSeq].length> 0) {
					//갤러리아 슬라이드 LIB 전용 div 입력
					postHtml = postHtml + "<div class='galleria' id='postPic-"+vo.postSeq+"'>";
					$( response.data.postPic[vo.postSeq]).each( function( index, vo2) {
						postPicSeqArray.push(vo2.postPicSeq); 
						postHtml = postHtml + postPic_render( vo2 );
//						if(index == $( response.data.postPic[vo.postSeq]).length-1) {
//							postPicSeq= vo2.postPicSeq;
//							console.log("postPicSeq:"+postPicSeq);
//						};
					});
					postHtml = postHtml + "</div>";
					picExist = 'Y'
				};
//				console.log(postPicSeqArray);
				// 글 마무리
				postHtml = postHtml + last_render( vo, picExist, postPicSeqArray );
				postPicSeqArray = [];
				picExist = 'N';
				$( "#my-sns-list" ).append(postHtml);
			});
			var postPic = response.data.post
			//galleria 슬라이드 실행
			$(".galleria > img").load(function(){
				for (var i = 0; i < postPic.length; i++) {
					$pic = $('#postPic-'+postPic[i].postSeq+'> img');
//					console.log(i+"번째 이미지");
//					console.log($pic.attr('src'));	
					var heightV = $pic.height();
//					console.log("postPic["+i+"]:"+postPic[i].postSeq+", heightV:"+heightV);
					if ( heightV != null ){
						if( heightV == 0) heightV = 400;
						Galleria.loadTheme('/poorip/assets/js/galleria.classic.js');
						Galleria.run('#postPic-'+postPic[i].postSeq , { debug: false, lightbox: true , height: heightV});
					}
				}
				postPic =[];
			})
		},
		error: function( XHR, status, error ) {
			console.log('ERROR');
		}
	});
});

function postDelete(postSeq){
	
	$("#delete-sns-post").dialog({
		resizable: false,
	      height: "auto",
	      width: 400,
	      modal: true,
	      buttons: {
	        "삭제": function() {
	          $( this ).dialog( "close" );
	          $.ajax( {
	      		url : "sns/deletePost",
	      		type: "post",
	      	    dataType: "json",
	      	    data: "postSeq="+postSeq,
	      	    success: function( response ){
	      	    	if( response.result != "success" ) {
//	      	    		console.log( response.message );
	      	    		return;
	      	    	} else {
	      	    		$("#sns-post-"+response.data).remove();
	      	    		return;
	      	    	} 
	      	    },
	      	    error: function( XHR, status, error ){
	      	       console.error("Error" );
	      	   	}
	          });
	        },
	        "취소": function() {
	          $( this ).dialog( "close" );
	        }
	      }
	});

}

function showWrite(){
	
	if ( writeVisible == true ) {
		$("#sns-write").hide();	
		writeVisible = false;
	} else {
		$("#sns-edit").hide();	
		$("#sns-write").show();
		writeVisible = true;
	}
	
}

function showShare() {
	if( shareVisible == true ){
		$("#sns-share").hide();
		shareVisible = false;
	} else {
		$("#sns-share").show();
		shareVisible = true;
	}
}


function showPostEdit(contents, title, trvSeq, postSeq, postPicSeqArray) {
	writeVisible = true;
	$(".form-group #edit-title").val(title);
	$(".form-group #edit-contents").val(contents);
	$("#sns-trv-seq").val(trvSeq).change();
	$("#postSeq").val(postSeq);
	$("#postPicSeqArray").val(postPicSeqArray);
	$("#sns-edit-form").modal("show");
	
	return;
}
$("#sns-edit-button").click(function() {
	var title = $(".form-group #edit-title").val()
	var contents = $(".form-group #edit-contents").val();
	var trvSeq = $("#sns-trv-seq").val();
	var postSeq = $("#postSeq").val();
	var postPicSeqArray = $("#postPicSeqArray").val();
//	console.log(title, contents, trvSeq, postSeq, "POST SEQ " + postPicSeqArray);
	
	$("#sns-edit-ajax").ajaxForm({
			url : "sns/editPost/" + postSeq + "/",
			enctype: "multipart/form-data",
			dataType: "json",
	        success : function(response) {
	        	 var postPicSeq = null;
	        	 var postPicSeqArray = [];
	        	console.log(response);
	/*document.getElementById('sns-post-'+postSeq).HTML = "";*/
	        	if(response.result == 'success'){
	        		location.reload();
	        		return;	
	        	}
//	        	$( response.data.post ).each( function( index, vo) {
//                    //console.log(index + "  ++++"+ vo.title);    
//                    console.log(1);
//                    edit_post_render( vo );
//                   
//                    $( response.data.postPic).each( function( index, vo2) {
//                   	 postPicSeqArray.push(vo2.postPicSeq); 
//                   	 postPic_render( vo2, vo );
//                       console.log("yyy"+ response.data.postPic.postPicSeq);
//                       	if(index == $( response.data.postPic).length-1) {
//                       		postPicSeq= vo2.postPicSeq;
//                       		console.log(postPicSeq);
//                       	};
//                       
//                    });
//                   
////                    console.log(postPicSeqArray);
//                    last_render( vo, postPicSeq, postPicSeqArray );
//                    postPicSeqArray = [];
//                 postPicSeq= null;
//                 });
	        	
	        },
	        error : function(data) {
				    console.log("ajax 에러가 발생하였습니다.")
	        }
	       
	    });
//	$('#sns-post-'+postSeq).replaceWith("");
//	$('#sns-edit-form').modal('toggle');
//	$('html,body').animate({
//        scrollTop: $("#sns-write-button").offset().top},
//        'slow');
});

//function openOptions() {
//	document.getElementById("profileDropdown").classList.toggle("show");
//}

// Close the dropdown menu if the user clicks outside of it
//window.onclick = function(event) {
//	if (!event.target.matches('#loginpic')) {
//
//		var dropdowns = document.getElementsByClassName("dropdown-content");
//		var i;
//		for (i = 0; i < dropdowns.length; i++) {
//			var openDropdown = dropdowns[i];
//			if (openDropdown.classList.contains('show')) {
//				openDropdown.classList.remove('show');
//			}
//		}
//	}
//};

function div_share_show(s,h) {
	if(s == "Y") {
		document.getElementById(h).style.display = "";
	} else {
		document.getElementById(h).style.display = "none";
	}
}

$(function(){
	$("#share-dialog,#dialog-background,#btn-close-dialog").click(function () {
		$("#img-div-share-dialog,#dialog-background").show();
	});
})

function share_dialog_close(){
	$('#share-sns-post').dialog('close');
}

function postShare(postSeq){
	
	var win_width = window.innerWidth;
	if (win_width == 0){
		win_width = document.body.clientWidth;
	}
	
	$("#share-form").validate({
		rules: {
			"share_to[]": {
				required: true
			}
		},
		 messages: {
			"share_to[]":{ 	
				required : "공유할 풀파티를 선택하세요"		    }
		},
		submitHandler: function(form) {
			
	    	form.submit();
	    }
	});
	$("#share-sns-post").dialog({

		resizable: false,
	      height: "auto",
	      width: (win_width * 0.5),
	      modal: true
//	      buttons: {
//	        "공유": function() {
//	          $( this ).dialog( "close" );
//	          $.ajax( {
//	      		url : "sns/deletePost",
//	      		type: "post",
//	      	    dataType: "json",
//	      	    data: "postSeq="+postSeq,
//	      	    success: function( response ){
//	      	    	if( response.result != "success" ) {
//	      	    		console.log( response.message );
//	      	    		return;
//	      	    	} else {
//	      	    		$("#sns-post-"+response.data).remove();
//	      	    		return;
//	      	    	} 
//	      	    },
//	      	    error: function( XHR, status, error ){
//	      	       console.error("Error" );
//	      	   	}
//	          });
//	        },
//	        "취소": function() {
//	          $( this ).dialog( "close" );
//	        }
//	      }
	});
	
	document.getElementById("sns-share-postSeq").value = postSeq;
}

$("#sns-write-button").click(function(){
    $("#sns-write-form").modal("show");
});


$(function() {
    var a = function() {
        var b = $(window).scrollTop();
        var d = $("#sns-pool-list-anchor").offset().top;
        var c = $("#sns-pool-list");
        if (b > d) {
            c.css({position:"fixed",top:"200px"})
        } else {
            c.css({position:"absolute",right:"5%", top:"", bottom: "-35%", height:"500px", overflow:"auto"})
        }
    };
    $(window).scroll(a);a()
});

function myFunction() {
    var x = document.getElementById("sns-pool-list");
    if (x.className === "sns-post-lists") {
        x.className += " responsive";
    } else {
        x.className = "sns-post-lists";
    }
}
