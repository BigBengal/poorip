<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <link href="<c:url value='/resources/css/jquery-ui.css' />" rel="stylesheet" type="text/css"/> --%>

<script type="text/javascript">
$(function(){
	$("#kwd").autocomplete({
        source : function(request, response) {
            $.ajax({
                url : "search",
                type : "post",
                dataType : "json",
                data: "kwd="+$("#kwd").val(),
                success : function(data) {
                    var result = data;
//                     console.log(JSON.stringify(result.data));
                    response(
                            $.map($.parseJSON(JSON.stringify(result.data)), function(item) {
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
			   "<div id='reviewbody-"	+	postSeq	+ "'>" + vo.contents + "<a href='javascript:;' style='display:inline; float:right; margin-top:5px; margin-right:5px;' id='like-review-button-"+postSeq+"' data-post-seq='"+ vo.postSeq+ "' onclick=reviewLike("+ vo.postSeq+ ")><img id='like-button-img-"+postSeq+"' src='${pageContext.request.contextPath}/assets/images/water-tube.png' style='width:100%' ></a><h5 style='float:right; margin-right:10px'> 라이크" + vo.likeCount + "</h5></div>" + 
			   "</div>"
			   ;			
		
	$("#review-"+reviewNum ).append(html);
}
var renderpic = function(vo, reviewNum, postSeq) {
	if(vo.path!='null'&&vo.path!=null) {
		var htmlpic = "<a href=${pageContext.request.contextPath}/assets/images/pool-party.jpg data-lightbox='image-1' data-title='My caption' ><img src=${pageContext.request.contextPath}/assets/images/pool-party.jpg></a>" + vo.path ;
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
	
	showtMap(trvSeq);
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
						    alert("ajax 에러가 발생하였습니다.")
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
		        	console.log("fail" + data);
		//             alert("ajax 에러가 발생하였습니다.")
		        }
		    });
		
		
		
		$("#reviewpic-"+reviewNum ).empty();
		$("#review-"+reviewNum ).empty();
		
		
		console.log("나와라");
		$("#project-31").on("shown.bs.modal", function () {
			console.log("나와라2");
	        google.maps.event.trigger(map, 'resize');
	        map.setCenter(center);
		});
		
	}

function showtMap(seq) {
    var myLatlng = new google.maps.LatLng(48.858450, 2.294494);
    var mapId = "map-"+seq;
    var mapOptions = {
      zoom: 15,
      center: myLatlng
    }
    var map = new google.maps.Map(document.getElementById(mapId), mapOptions);

    var marker = new google.maps.Marker({
        position: myLatlng,
        title:"Poorip!!"
    });
    
	// To add the marker to the map, call setMap();
    marker.setMap(map);
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
        	if(result.data=="decreased_like") {
 
        		likePostIcon.src = "/poorip/assets/images/water-tube.png";
        	}
        	if(result.data=="increased_like") {
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
								    alert("ajax 에러가 발생하였습니다.")
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
					    alert("ajax 에러가 발생하였습니다.")
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