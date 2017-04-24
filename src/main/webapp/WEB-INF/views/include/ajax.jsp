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
				"<p id='reviewtitle'>" + vo.title + "</p>" +
			   "<p id='reviewbody-"	+	postSeq	+ "'>" + vo.contents + "</p>" + 
			   "</div>"
			   ;			
		
	$("#review-"+reviewNum ).append(html);
	console.log("PLLLLLLLLLLLLEASE" + reviewNum);

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
	console.log(likeIcon);
	
	$.ajax({
        url : "/poorip/scrap/scrapValidate",
        type : "post",
        data: "trvSeq="+ trvSeq,
        dataType: "text",
        success : function(data) {
        	console.log(data);
            if(data==="YES") {
            	
            	console.log("들어오냐고");
            	likeIcon.src="/poorip/assets/images/scrapicon-scraped.png";
            }else {
            	console.log("들어오냐고222");
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
				console.log(postSeq);
        		render( vo, reviewNum, postSeq );
        		
				
        		$.ajax({
        			
        			url:"/poorip/reviewpic/" + postSeq,
        			type: "post",
        			dataType: "json",
        			success : function(review) {
        				console.log(review.data);
        					if( review.result != "success" ) {
        		    		console.log( response.message );
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
        		$("#reviewpic-"+reviewNum ).empty();
		        });
        	},
		        error : function(data) {
		        	console.log("fail" + data);
		//             alert("ajax 에러가 발생하였습니다.")
		        }
		    });
		$("#review-"+reviewNum ).empty();
	}
	
$(".ScrapcityName").click(function (){
	var ctyName = $(this).data('city-name');
	console.log(ctyName);
	var dateFormat = "mm/dd/yy", from = $("#fromDate-"+ctyName).datepicker({
		defaultDate : "+1w",
		changeMonth : true,
		numberOfMonths : 2
	}).on("change", function() {
		to.datepicker("option", "minDate", getDate(this));

	}), to = $("#toDate-"+ctyName).datepicker({
		defaultDate : "+1w",
		changeMonth : true,
		numberOfMonths : 2
	}).on("change", function() {
		from.datepicker("option", "maxDate", getDate(this));
		dateTo = getDate(this);
	});

	function getDate(element) {
		var date;

		try {
			date = $.datepicker.parseDate(dateFormat, element.value);
		} catch (error) {
			date = null;
		}
		return date;
	}
		
});

</script>
