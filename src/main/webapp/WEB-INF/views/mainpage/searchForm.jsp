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
<!-- <link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css"
	integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd"
	crossorigin="anonymous">
Date Picker css
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!--   		<link rel="stylesheet" href="/resources/demos/style.css"> -->

<!-- <style>
body {
	background-color: #f7f7f7;
}

.container {
	margin: 150px auto;
}
</style> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
	$(function() {
		var ctyNamesArray = [];
		$("#ctyName").autocomplete(
				{
					source : function(request, response) {
						$.ajax({
							url : "poolsearch",
							type : "post",
							dataType : "json",
							data : "ctyName=" + $("#ctyName").val(),
							success : function(data) {
								var result = data;
								response($.map($.parseJSON(JSON
										.stringify(result.data)),
										function(item) {
									console.log(item);
											return {
												label : item.name,
												value : item.name
											}
										}));

							},
							error : function(data) {

								console.log("fail" + data);
								//             alert("ajax 에러가 발생하였습니다.")
							}
						});
					}
				});

	});
</script>
</head>
<body>
	<!-- <div id="jquery-script-menu">
	</div> -->
	<div class="container">
		<h2 align="center">가고싶은 여행지를 검색하세요</h2>
		<form id="search_form" method="post" style="text-align:center">
			<input type="text" style="margin: auto;"
				placeholder="Search..." class="form-control-travel" id="ctyName"
				name="ctyName" >
			<p class="text-center" style="text-align: center;">
				<label for="from">출발</label> <input type="text" id="fromDate"
					name="fromDate" style="color: #000000; border-radius: 10px"> <label for="to" style="margin-left: 5px">도착</label>
				<input type="text" id="toDate" name="toDate" style="color: #000000; border-radius: 10px; margin-top: 10px">
				<input type="submit" id="serch" value="검색하기" onclick="searchformSubmit()"
					style="width: 75; font-family: 맑은고딕; background-color: black">
			</p>
		</form>
	</div>

	<!-- date picker -->
	
	<script>
		

		function searchformSubmit() {
			event.preventDefault();
			$("#poollist").empty();
			var param = jQuery("#search_form").serialize();
			console.log(param);
			$.ajax({
				url : "poolsearchList",
				type : "post",
				data : param,
				async : false,
				dataType : "json",
				success : function(response) {

					$(response.data).each(function(index, vo) {
						/* console.log(vo); */
						renderpool(vo);
					});
				},
				error : function(data) {
					console.log("fail" + data);
					//             alert("ajax 에러가 발생하였습니다.")
				}
			});

			$('html, body').animate({
				scrollTop : $("#poollist").offset().top
			}, 1000);
		}
		var renderpool = function(vo) {
			console.log(vo);

			var htmlpool = "<div class='col-md-12' style='border-style:solid; border-width:1px; margin:2px; padding:2px'>"
					+ "<p id='reviewtitle'>"
					+ vo.poolName
					+ "</p>"
					+ "<p id='reviewbody'>"
					+ vo.poolComment
					+ "</p>"
					+ "</div>"

			$("#poollist").prepend(htmlpool);
		}
	</script>
</body>
</html>
