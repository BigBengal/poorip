<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <link href="<c:url value='/resources/css/jquery-ui.css' />" rel="stylesheet" type="text/css"/> --%>

<script type="text/javascript">
$(function(){
	$("#city-kwd").autocomplete({
        source : function(request, response) {
            $.ajax({
                url : "search",
                type : "post",
                dataType : "json",
                data: "kwd="+$("#city-kwd").val(),
                success : function(data) {
                	
                	if( response.result == "fail") {
     		    	   return;
     		    	}
                    var result = data;
					//console.log(JSON.stringify(result.data));
					//console.log("YO"+ result);
                    response(
                            $.map($.parseJSON(JSON.stringify(result.data)), function(item) {
                            	console.log(result);
                                return {
                                    label: item.name,
                                    value: item.ctySeq
                                }
                            })
                        );
                },
                error : function(data) {
//                     alert("ajax 에러가 발생하였습니다.")
                }
            });
        },
		select : function( event, ui ) {
			console.log("UI + ITEM + VALUE " + ui.item.value);
			$(location).attr('href','/poorip/city/'+ui.item.value);
		}
    });
	
});
var render = function( vo, reviewNum, postSeq ){
	
	var html = "<div class='col-md-12' style='border-style:solid; border-width:1px; margin:2px; padding:2px'>" +
				"<div id='reviewtitle' style='margin-bottom:20px'>" + vo.title + "<h6 style='display:inline-block; float:right'>" + vo.crtDate + "</h6></div>" +
			   "<div id='reviewbody-"	+	postSeq	+ "'>" + vo.contents + "<c:if test='${!empty authUser }'>" +
			   "<a href='javascript:;' style='display:inline; float:right; margin-top:5px; margin-right:5px;' id='like-review-button-"+postSeq+"' data-post-seq='"+ vo.postSeq+ "' onclick=reviewLike("+ vo.postSeq+ ")> " + 
			   "<img id='like-button-img-"+postSeq+"' src='${pageContext.request.contextPath}/assets/images/water-tube.png' style='width:100%' ></a> " + 
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
	
	$.ajax({
        url : "/poorip/scrap/scrapValidate",
        type : "post",
        data: "trvSeq="+ trvSeq,
        dataType: "text",
        success : function(data) {
            if(data==="YES") {

            	likeIcon.src="/poorip/assets/images/scrapicon-scraped.png";
            }else {
 
        		likeIcon.src="/poorip/assets/images/scrapicon.png";
        	}
        },
        error : function(data) {
			    alert("ajax 에러가 발생하였습니다.")
        }
    });
	
	$.ajax({
        url : "/poorip/reviews/" + trvSeq,
        type : "post",
        dataType : "json",
        data: "reviewNum=" + reviewNum ,
        success : function(response) {
        	
        		$( response.data ).each( function(index, vo){
        			console.log(vo);
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
			        		likePostIcon.src = "/poorip/assets/images/water-tube2.png";
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
        					console.log(review);
        					if( review.result != "success" ) {
  							
        		    		return;
        		    		} 
        					if(hasNull(review.data)) {
        						return;
        					}
        			 							
        					$(review.data).each(function (index,vo){
        						console.log(vo);
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
	console.log("yay?" + postSeq);
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
        		console.log("여기??");
        		var decreased = likes.slice(0, -15);
        		$("#like-count-"+ postSeq).text("라이크" + decreased);
        		likePostIcon.src = "/poorip/assets/images/water-tube.png";
        	}
        	}
        	else {
        		console.log("라이크충");
        		$("#like-count-"+ postSeq).text("라이크" + result.data);
        		likePostIcon.src = "/poorip/assets/images/water-tube2.png";
        	}
         
        },
        error : function(data) {
			    alert("ajax 에러가 발생하였습니다.")
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
					        		console.log(likePostIcon);
					        		likePostIcon.src = "/poorip/assets/images/water-tube2.png";
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

</script>