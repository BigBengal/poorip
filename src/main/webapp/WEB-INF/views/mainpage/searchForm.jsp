<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PoOrip에 오신것을 환영합니다!</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css"
	integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd"
	crossorigin="anonymous">
<!-- Date Picker css -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--   		<link rel="stylesheet" href="/resources/demos/style.css"> -->

<style>
body {
	background-color: #f7f7f7;
}

.container {
	margin: 150px auto;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
$(function(){
	$("#citypool").autocomplete({
        source : function(request, response) {
            $.ajax({
                url : "poolpart/poolsearch",
                type : "post",
                dataType : "json",
                data: "citypool="+$("#citypool").val(),
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
			$(location).attr('href','/poorip/travelinfobycity?citypool='+ui.item.value+"&ctyName="+ui.item.label);
		}
    });
});
</script>
</head>
<body>
	<div id="jquery-script-menu">
	</div>
	<div class="container">
		<h1>♡가고싶은 여행지를 검색하세요♡</h1>
		<form id="search_form" action="${pageContext.request.contextPath}/poolparty/poolsearch" method="get">
			<input type="text" style="margin-bottom: 1em;" placeholder="Search..."
				class="form-control" id="kwd" name="citypool">
			<p class="text-center" style="text-align: center;">
			<label for="from">출발</label> <input type="text" id="from" name="from"
				style="color: #000000"> <label for="to">도착</label> <input
				type="text" id="to" name="to" style="color: #000000"> <input
				type="submit" id="serch" value="검색하기"
				style="width: 75; font-family: 맑은고딕; background-color: #3ed0c8">
			</p>
		</form>
	</div>

	<!-- date picker -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			var dateFormat = "mm/dd/yy", from = $("#from").datepicker({
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 2
			}).on("change", function() {
				to.datepicker("option", "minDate", getDate(this));
			}), to = $("#to").datepicker({
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 2
			}).on("change", function() {
				from.datepicker("option", "maxDate", getDate(this));
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
</body>
</html>
