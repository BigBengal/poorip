<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <link href="<c:url value='/resources/css/jquery-ui.css' />" rel="stylesheet" type="text/css"/> --%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
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
			console.log(ui.item.value);
			$(location).attr('href','/poorip/city/'+ui.item.value);
		}
    });

});
var render = function( vo, reviewNum, postSeq ){
	
	var html = "<div class='col-md-12'>" +
				"<p id='reviewtitle'>" + vo.title + "</p>" +
			   "<p id='reviewbody-"	+	postSeq	+ "'>" + vo.contents + "</p>" + 
			   "</div>"
			   ;			
		
	$("#review-"+reviewNum ).append(html);
	console.log("PLLLLLLLLLLLLEASE" + reviewNum);

}

var renderpic = function(vo, reviewNum, postSeq) {
	var htmlpic = "<a href=${pageContext.request.contextPath}/assets/images/pool-party.jpg data-lightbox='image-1' data-title='My caption'><img src=${pageContext.request.contextPath}/assets/images/pool-party.jpg height=200px width=200px ></a>" + vo.path ;
	$("#reviewbody-"+postSeq).append(htmlpic);
}


function send(trvSeq, reviewNum){

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
    
        				$(review.data).each(function (index,vo){
        					/* console.log(vo) */
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

</script>
