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
</script>