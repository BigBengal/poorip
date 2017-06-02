$(function(){

	$.widget( "custom.catcomplete", $.ui.autocomplete, {
	      _create: function() {
	        this._super();
// 	        this.wrapper = $( "<span>" )
// 	          .addClass( "custom-combobox" )
// 	          .insertAfter( this.element );
	        this._createShowAllButton();
	        this.widget().menu( "option", "items", "> :not(.ui-autocomplete-category)" );
	      },
	      _renderMenu: function( ul, items ) {
	        var that = this,
	          currentCategory = "";
	        $.each( items, function( index, item ) {
	          var li;
	          if ( item.category != currentCategory ) {
	            ul.append( "<li class='ui-autocomplete-category'>" + item.category + "</li>" );
	            currentCategory = item.category;
	          }
	          li = that._renderItemData( ul, item );
	          if ( item.category ) {
	            li.attr( "aria-label", item.category + " : " + item.label );
	          }
	        });
	      },
	      _createShowAllButton: function() {
	          var input = $("#city-kwd"),
	            wasOpen = false;
	   
	          $( "#searchshowall" )
	            .attr( "title", "전체 도시 보기" )
	            .tooltip()
	            .on( "mousedown", function() {
// 	            	console.log(wasOpen + "," + input.val());
	            	if (input.val() == ""){
	              		wasOpen = input.catcomplete("widget").is( ":visible" );
	            	}
	            })
	            .on( "click", function() {
	              input.trigger( "focus" );
	   
	              // Close if already visible
	              if ( wasOpen ) {
	                return;
	              }
	   
	              // Pass empty string as value to search for, displaying all results
	              input.val("");
	              input.catcomplete( "search", " " );
	            });
	        }
	    });
	
	$("#city-kwd").catcomplete({
		delay: 0,
        source : function(request, response) {
            $.ajax({
                url : "search",
                type : "post",
                dataType : "json",
                data: "kwd="+$("#city-kwd").val(),
                success : function(data) {
                	if( data.result == "fail") {
     		    	   return;
     		    	}
                    var result = data;
					//console.log(JSON.stringify(result.data));
                    response(
                            $.map($.parseJSON(JSON.stringify(result.data)), function(item) {
//                             	console.log(result);
                                return {
                                    label: item.name,
//                                     value: item.ctySeq,
                                    category: '< ' + item.contents + ' >',
                                }
                            })
                        );
                },
                error : function(data) {
//                     alert("ajax 에러가 발생하였습니다.")
                }
            });
        }
		,select : function( event, ui ) {
			$(this).val(ui.item.value);
			$("#travel_search").submit();
		}
    });

});
var render = function( vo, reviewNum, postSeq ){
	
	var html = "<div class='col-md-12' style='border-style:solid; border-width:1px; margin:2px; padding:2px'>" +
				"<div id='reviewtitle' style='margin-bottom:20px'>" + vo.title + "<h6 style='display:inline-block; float:right'>" + vo.crtDate + "</h6></div>" +
			   "<div id='reviewbody-"	+	postSeq	+ "'>" + vo.contents + "<c:if test='${!empty authUser }'>" +
			   "<a href='javascript:;' style='display:inline; float:right; margin-top:5px; margin-right:5px;' id='like-review-button-"+postSeq+"' data-post-seq='"+ vo.postSeq+ "' onclick=reviewLike("+ vo.postSeq+ ")> " + 
			   "<img id='like-button-img-"+postSeq+"' src='${pageContext.request.contextPath}/assets/images/like_off.png' style='width:100%' ></a> " + 
			   "</c:if><h5 id='like-count-" + postSeq + "' style='float:right; margin-right:10px'> 라이크" + vo.likeCount + "</h5></div>" + 
			   "</div>"
			   ;			
		
	$("#review-"+reviewNum ).append(html);
}
var renderpic = function(vo, reviewNum, postSeq) {
	if(vo.path!='null'&&vo.path!=null) {
		var htmlpic = "<a href=/poorip" + vo.path + "/" + vo.fileName + " data-lightbox='image-" + postSeq + "' data-title='My caption' class='review-pics-anchor' ><img src=/poorip" + vo.path + "/" + vo.fileName + " class='review-pics'></a>";
		$("#reviewbody-"+postSeq).after(htmlpic);
	}
	
}
function hasNull(target) {
    for (var member in target) {
        if (target[member] == null)
            return true;
    }
    return false;
}
function send(trvSeq, reviewNum){
	var likeIcon = document.getElementById("scrapTrvInfo-"+trvSeq);
	var $travelPic = $("#travelPic-"+trvSeq)
	
	if (! $travelPic.is(".loaded")){
		$.ajax({
	        url : "/poorip/travelpic/" + trvSeq,
	        type : "post",
	        dataType: "json",
	        success : function(response) {
	        	$travelPic.addClass("loaded");
	        	
	        	if (response.result == "fail") {
// 	        		console.log('#travelPic-'+trvSeq + ";" + response.message);
	        		Galleria.loadTheme('/poorip/assets/js/galleria.classic.js');
	        		Galleria.run('#travelPic-'+trvSeq , { debug: false, lightbox: true});
	        		return;
	        	}
	        	
	        	$( response.data ).each( function(index, vo){
// 	        		console.log(vo);
	       			$travelPic.append("<img src='/poorip"+vo.path + "/" + vo.fileName + "' />");
	        	});
	        	
				Galleria.loadTheme('/poorip/assets/js/galleria.classic.js');
	        	Galleria.run('#travelPic-'+trvSeq , {  debug: false, lightbox: true});
	        },
	        error : function(data) {
				    alert("travelpic ajax 에러가 발생하였습니다.")
	        }
	    });

        
	}
	
	$.ajax({
        url : "/poorip/scrap/scrapValidate",
        type : "post",
        data: "trvSeq="+ trvSeq,
        dataType: "text",
        success : function(data) {
            if(data==="YES") {

            	likeIcon.src="/poorip/assets/images/star_on.png";
            }else {
 				if(likeIcon != null)
        			likeIcon.src="/poorip/assets/images/star_off.png";
        	}
        },
        error : function(data) {
			    alert("scrapValidate ajax 에러가 발생하였습니다.")
        }
    });
	
	$.ajax({
        url : "/poorip/reviews/" + trvSeq,
        type : "post",
        dataType : "json",
        data: "reviewNum=" + reviewNum ,
        success : function(response) {
        	
        		$( response.data ).each( function(index, vo){
//         			console.log(vo);
				var postSeq = vo.postSeq;
        		render( vo, reviewNum, postSeq );
        		
        		$.ajax({
			        url : "/poorip/reviewLikeValidate/" +trvSeq,
			        type : "post",
			        data: "",
			        dataType: "json",
			        success : function(result) {
			        	$( result.data ).each( function(index, vo){
			        		
			        		var likePostIcon = document.getElementById("like-button-img-"+vo.postSeq);
// 			        		console.log(likePostIcon);
			        		likePostIcon.src = "/poorip/assets/images/like_on.png";
			        	});
			         
			        },
			        error : function(data) {
						    //alert("ajax 에러가 발생하였습니다.")
			        }
			    });
        		
				
        		$.ajax({
        			
        			url:"/poorip/reviewpic/" + postSeq,
        			type: "post",
        			dataType: "json",
        			success : function(review) {
//         					console.log(review);
        					if( review.result != "success" ) {
  							
        		    		return;
        		    		} 
        					if(hasNull(review.data)) {
        						return;
        					}
        			 							
        					$(review.data).each(function (index,vo){
//         						console.log(vo);
        					renderpic(vo, reviewNum, postSeq);
        				});
        					
        					
        			}
        			
        		});
        	
		        });
        	},
		        error : function(data) {
		        	console.log("fail" + data);
		//             alert("ajax 에러가 발생하였습니다.")
		        }
		    });
		
		
		
		$("#reviewpic-"+reviewNum ).empty();
		$("#review-"+reviewNum ).empty();
		
	}

function reviewLike(postSeq) {

	var likePostIcon = document.getElementById("like-button-img-"+postSeq);
	$.ajax({
        url : "/poorip/reviewLike/" +postSeq,
        type : "post",
        data: "",
        dataType: "json",
        success : function(result) {
        	var likes = result.data;
        	if(likes.length > 5){
        	var lastIndex = likes.lastIndexOf('-');
        	var decreasedLike = likes.substring(lastIndex+1, likes.length );
        	if(decreasedLike=="decreased_like") {
//         		console.log("여기??");
        		var decreased = likes.slice(0, -15);
        		$("#like-count-"+ postSeq).text("라이크" + decreased);
        		likePostIcon.src = "/poorip/assets/images/like_off.png";
        	}
        	}
        	else {
//         		console.log("라이크충");
        		$("#like-count-"+ postSeq).text("라이크" + result.data);
        		likePostIcon.src = "/poorip/assets/images/like_on.png";
        	}
         
        },
        error : function(data) {
			    alert("reviewLike ajax 에러가 발생하였습니다.")
        }
    });
};


function sendTrvSeq1(trvSeq) {
			event.preventDefault();
			$.ajax({
		        url : "/poorip/reviews/" +trvSeq,
		        type : "post",
		        data: "like=like",
		        dataType: "json",
		        success : function(response) {
		        	$( response.data ).each( function(index, vo){
						var reviewNum = vo.trvSeq;
		        		var postSeq = vo.postSeq;
		        		render( vo, reviewNum, postSeq );
		        		$.ajax({
					        url : "/poorip/reviewLikeValidate/" +trvSeq,
					        type : "post",
					        data: "",
					        dataType: "json",
					        success : function(result) {
					        	$( result.data ).each( function(index, vo){
					        		var likePostIcon = document.getElementById("like-button-img-"+vo.postSeq);
// 					        		console.log(likePostIcon);
					        		likePostIcon.src = "/poorip/assets/images/like_on.png";
					        	});
					         
					        },
					        error : function(data) {
								    //alert("ajax 에러가 발생하였습니다.")
					        }
					    });
		        		
		        		$.ajax({
		        			
		        			url:"/poorip/reviewpic/" + postSeq,
		        			type: "post",
		        			dataType: "json",
		        			success : function(review) {
		        					if( review.result != "success" ) {
		  							
		        		    		return;
		        		    		} 
		        					if(hasNull(review.data)) {
		        						return;
		        					}
		        			 							
		        					$(review.data).each(function (index,vo){        					
		        					renderpic(vo, reviewNum, postSeq);
		        				});
		        					
		        					
		        			}
		        			
		        		});
		        	});
		        },
		        error : function(data) {
					    //alert("ajax 에러가 발생하였습니다.")
		        }
		    });
			$("#review-"+trvSeq ).empty();
		};
$(document).ready(function(){
			  $("#test_delete").click(function(){
			    message();
			  });
			  $("#cancel").click(function(){
			    hide();
			  });
			});
				
			function message()
			{
			  $("#delete_message").slideDown();
			}

			function hide()
			{
			  $("#delete_message").slideUp();
			}