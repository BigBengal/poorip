
var dialogDeleteForm = null;
var isEnd = false;
var page = 0;
var post_render = function( vo ) {
   var post_html = "<div id='sns-post-" + vo.postSeq + "' class='sns-post-group' style='background-color:white ; box-shadow: 2px 2px 2px #888888 ;' >" + 
   					"<div class='form-group'   style='padding-top: 30px; background-color:#ccd9ff; margin-right: 0px;" +
                    "margin-left: 0px;'>" + 
                     "<div class='text-center' style='font-size: 20px; padding-bottom: 10px;'><strong>" + vo.title + "</strong></div>" +
                  "</div>" +
                  "<div class='form-group' style='display:block; width:70%; margin:auto;'>" +
               "<div class='col-md-offset-4' style='margin:auto;'>" +
                     "<p class='col-md-12'>" + 
                        "<div class='cycle-slideshow'" +
                           "data-cycle-fx='scrollHorz'" +
                           "data-cycle-timeout='0'" +
                           "data-cycle-prev='prev'" +
                           "data-cycle-next='#next' id='first-html-" + vo.postSeq + "'>" ;

                 $( "#my-sns-list" ).append(post_html);
}


var edit_post_render = function( vo ) {
	   var post_html = "<div id='sns-post-" + vo.postSeq + "' class='sns-post-group' style='background-color: white;' box-shadow: 2px 2px 2px #888888 ;'>" + 
	   					"<div class='form-group'  style='padding-top: 30px; background-color:#ccd9ff; margin-right: 0px;" +
                        "margin-left: 0px;'>" + 
	                     "<div class='text-center' style='font-size: 20px; padding-bottom: 10px;'><strong>" + vo.title + "</strong></div>" +
	                  "</div>" +
	                  "<div class='form-group' style='display:block; width:70%; margin:auto;'>" +
	               "<div class='col-md-offset-4' style='margin:auto;'>" +
	                     "<p class='col-md-12'>" + 
	                        "<div class='cycle-slideshow'" +
	                           "data-cycle-fx='scrollHorz'" +
	                           "data-cycle-timeout='0'" +
	                           "data-cycle-prev='prev'" +
	                           "data-cycle-next='#next' id='first-html-" + vo.postSeq + "'>" ;

	                 $( "#my-sns-list" ).prepend(post_html);
	}


var postPic_render = function(vo2, vo) {
   if(vo2.fileName!=null) {
   var postPic_html = "<a class='sns-image' href='/poorip" + vo2.path + "/" + vo2.fileName + " 'width='500px' id='middle-html-" + vo2.postPicSeq + "' data-lightbox='sns-images-"+ vo.postSeq+ "' id='middle-html-" + vo.postSeq + "'><img src='/poorip" + vo2.path + "/" + vo2.fileName + " style='width=500px; margin:auto;' ></a>";
                              

                  $( "#first-html-"+vo.postSeq ).append(postPic_html);
   }
   else {
	   var postPic_html =  "<div id='middle-html-" + vo2.postPicSeq + "></div>"
	   $( "#first-html-"+vo.postSeq ).append(postPic_html);
   };
}

var last_render = function(vo, postPicSeq, postPicSeqArray) {
	var postPicSeqArray = postPicSeqArray;
  if(postPicSeq!=null) {
   var last_html =               "</div>" +
                        "</p>" +
                     "</div>" +
                     "</div>" + 
                  "<div class='form-group' style='display: block;margin:auto; width:40%;'>" +
                  "<p class='col-md-12 text-center' style='font-size: 15px'>" + vo.contents + "</p>" +
               "</div>" + 
               "<div class='form-group sns-date' >" +
                  "<p class='col-md-5 sns-date'  align='left'>" + vo.crtDate + "</p>" +
               "</div>" +
               "<div class='form-group' style='display:block; text-align:center; width:100%; margin-bottom:10%; margin-left: 0px; clear:both;'>" +
                  "<a href='javascript:;'><img alt='삭제' src='/poorip/assets/images/delete-btn.png' class='sns-post-footer' style='width: 3%; display:inline-block; float:left' onclick='postDelete(" + vo.postSeq + ")'></a>" +
                     "<a href='javascript:;'><img alt='공유' src='/poorip/assets/images/share-btn.png' class='sns-post-footer' id='share-dialog' style='width: 3%; display:inline-block;' onclick='postShare(" + vo.postSeq + ")'></a>" +
                     "<a href='#sns-edit-form' id='edit-form-tag'><img alt='수정' src='/poorip/assets/images/write-btn.png' class='sns-post-footer' style='width: 3%; display:inline-block; float:right' onclick='showPostEdit(\"" + vo.contents + "\",\"" + vo.title + "\",\""+vo.trvSeq +"\",\""+vo.postSeq+"\",\""+postPicSeqArray+"\")' class='sns-post-edit'><a/>" + 
                  "</div></div>";

               $("#middle-html-"+postPicSeq).after(last_html);
  }  
  else {
	  var last_html =	   "</div>" +
		    "</p>" +
		 "</div>" +
		 "</div>" + 
		"<div class='form-group'>" +
				"<p class='col-md-12 text-center' style='font-size: 15px'>" + vo.contents + "</p>" +
		"</div>" + 
		"<div class='form-group sns-date' >" +
				"<p class='col-md-5 sns-date'    align='left'>" + vo.crtDate + "</p>" +
		"</div>" +
		"<div class='form-group' style='text-align:center; display:block; width:100%; margin-bottom:10%; margin-left: 0px; clear:both;'>" +
				"<a href='javascript:;'><img alt='삭제' src='/poorip/assets/images/delete-btn.png' class='sns-post-footer' style='width: 3%; display:inline-block; float:left' onclick='postDelete(" + vo.postSeq + ")'></a>" +
				 "<a href=javascript:;><img alt='공유' src='/poorip/assets/images/share-btn.png' class='sns-post-footer' id='share-dialog' style='width: 3%; display:inline-block;' onclick='postShare(" + vo.postSeq + ")' ></a>" +
				 "<a href='#sns-edit-form' id='edit-form-tag'><img alt='수정' src='/poorip/assets/images/write-btn.png' class='sns-post-footer' style='width: 3%; display:inline-block; float:right' onclick='showPostEdit(\"" + vo.contents + "\",\"" + vo.title + "\",\""+vo.trvSeq +"\",\""+vo.postSeq+"\")'  class='sns-post-edit'></a>" + 
		"</div>" ;

$("#first-html-"+vo.postSeq).after(last_html);
	  
  };
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
					//console.log(response);
					if( response.result != "success" ) {
						return 
					}

					if( response.data.length == 0 ) {
						isEnd = true;
						return;
					}
					var postPicSeq = null;
					var postPicSeqArray = [];
					++page;
					$( response.data.post ).each( function( index, vo) {
						//console.log(index + "  ++++"+ vo.title);    
						post_render( vo );
//						console.log("datalength" + response.data.postPic[vo.postSeq].length);
						if(response.data.postPic[vo.postSeq].length> 0) {
							$( response.data.postPic[vo.postSeq]).each( function( index, vo2) {
								postPicSeqArray.push(vo2.postPicSeq); 
								postPic_render( vo2, vo );

								if(index == $( response.data.postPic[vo.postSeq]).length-1) {
									postPicSeq= vo2.postPicSeq;
//									console.log(postPicSeq);
								};

							});
						};
//						console.log(postPicSeqArray);
						last_render( vo, postPicSeq, postPicSeqArray );
						postPicSeqArray = [];
						postPicSeq= null;
					});


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
	console.log("ss");
	$.ajax( {
		url : "sns/main/" + page,
		type : "get",
		dataType: "json",
		data : "",
		success: function( response ) {
			//console.log(response);
			if( response.result != "success" ) {
				return 
			}

			if( response.data.length == 0 ) {
				isEnd = true;
				return;
			}
			var postPicSeq = null;
			var postPicSeqArray = [];
			++page;
			$( response.data.post ).each( function( index, vo) {
				post_render( vo );
				if(response.data.postPic[vo.postSeq].length> 0) {
					$( response.data.postPic[vo.postSeq]).each( function( index, vo2) {
						postPicSeqArray.push(vo2.postPicSeq); 
						postPic_render( vo2, vo );

						if(index == $( response.data.postPic[vo.postSeq]).length-1) {
							postPicSeq= vo2.postPicSeq;
						};

					});
				};
				last_render( vo, postPicSeq, postPicSeqArray );
				postPicSeqArray = [];
				postPicSeq= null;
			});
		},
		error: function( XHR, status, error ) {
			console.log('ERROR');
		}
	});
});

var writeVisible = false;
var shareVisible = false;

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
		writeVisible = true;
	}
}

function showPostEdit(contents, title, trvSeq, postSeq, postPicSeqArray) {

	$("#sns-write").hide();	
	$("#sns-edit").show();
	writeVisible = true;
	$(".form-group #edit-title").val(title);
	$(".form-group #edit-contents").val(contents);
	$("#sns-trv-seq").val(trvSeq).change();
	$("#postSeq").val(postSeq);
	$("#postPicSeqArray").val(postPicSeqArray);
	$('html, body').animate({
        scrollTop: $( $('#edit-form-tag').attr('href') ).offset().top
    }, 500);
	return;
}
$("#sns-edit-button").click(function() {
	var title = $(".form-group #edit-title").val()
	var contents = $(".form-group #edit-contents").val();
	var trvSeq = $("#sns-trv-seq").val();
	var postSeq = $("#postSeq").val();
	var postPicSeqArray = $("#postPicSeqArray").val();
	console.log(title, contents, trvSeq, postSeq, postPicSeqArray);
	
	$("#sns-edit-ajax").ajaxForm({
			url : "sns/editPost/" + postSeq + "/",
			enctype: "multipart/form-data",
			dataType: "json",
	        success : function(response) {
	        	 var postPicSeq = null;
	        	 var postPicSeqArray = [];
	        	console.log(response);
	        	document.getElementById('sns-post-'+postSeq).innerHTML = "";
	        	$( response.data.post ).each( function( index, vo) {
                    //console.log(index + "  ++++"+ vo.title);    
                    console.log(1);
                    edit_post_render( vo );
                   
                    $( response.data.postPic).each( function( index, vo2) {
                   	 postPicSeqArray.push(vo2.postPicSeq); 
                   	 postPic_render( vo2, vo );
                       console.log("yyy"+ response.data.postPic.postPicSeq);
                       	if(index == $( response.data.postPic).length-1) {
                       		postPicSeq= vo2.postPicSeq;
                       		console.log(postPicSeq);
                       	};
                       
                    });
                   
//                    console.log(postPicSeqArray);
                    last_render( vo, postPicSeq, postPicSeqArray );
                    postPicSeqArray = [];
                 postPicSeq= null;
                 });
	        	
	        },
	        error : function(data) {
				    alert("ajax 에러가 발생하였습니다.")
	        }
	       
	    });
	$("#sns-edit").hide();

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

function postShare(postSeq){
	
	$("#share-sns-post").dialog({
		

		resizable: false,
	      height: "auto",
	      width: 1000,
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



