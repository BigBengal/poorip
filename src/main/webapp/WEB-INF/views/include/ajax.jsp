<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <link href="<c:url value='/resources/css/jquery-ui.css' />" rel="stylesheet" type="text/css"/> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
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
var isEnd = false;
var render = function( vo, prepend ){
	
	var html = "<div class='col-md-6'>" +
			   "<p id='reviewtitle'>" + vo.title + "</p>" +
			   "<p id='reviewbody'>" + vo.contents + "</p>" +
			   "</div>" +
			   "<div class='col-md-3'>" +
			   "<img src='${pageContext.request.contextPath }/assets/images/pool-party2.jpg' alt=''>" +
			   "</div>";
		
	$("#review").append( html );
	console.log("PLLLLLLLLLLLLEASE");

}

function send(trvSeq){
	
	if(trvSeq==null) {
		return;
	}
	if(isEnd==true) {
		return;
	}
	$.ajax({
        url : "/poorip/reviews/" + trvSeq,
        type : "post",
        dataType : "json",
        data: "",
        success : function(response) {
        	
        	if( response.data.length == 0 ) {
	    		isEnd = true;
	    		return;	
	    	}
        	
        	$( response.data ).each( function(index, vo){
        		console.log(vo);
        		
        		render( vo, false );
	    	
        	});
        },
        error : function(data) {
        	console.log("fail" + data);
//             alert("ajax 에러가 발생하였습니다.")
        }
    });
	$("#review").empty();
}
</script>
