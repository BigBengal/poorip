<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PoOrip에 오신것을 환영합니다!</title>
<meta name="description"
	content="Worthy a Bootstrap-based, Responsive HTML5 Template">
<meta name="author" content="htmlcoder.me">

<!-- Date Picker -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Web Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700,300&amp;subset=latin,latin-ext'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300'
	rel='stylesheet' type='text/css'>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet">

<!-- Font Awesome CSS -->
<link
	href="${pageContext.request.contextPath}/assets/fonts/font-awesome/css/font-awesome.css"
	rel="stylesheet">

<!-- Plugins -->
<link
	href="${pageContext.request.contextPath}/assets/css/animations.css"
	rel="stylesheet">
<!-- Worthy core CSS file -->
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">


<!-- Custom css -->
<link href="${pageContext.request.contextPath}/assets/css/custom.css"
	rel="stylesheet">

<!-- Date Picker css -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--   		<link rel="stylesheet" href="/resources/demos/style.css"> -->


<!-- Reviews -->
<link href="${pageContext.request.contextPath}/assets/css/lightbox.css" rel="stylesheet">
</head>


<body class="no-trans">
	<!-- scrollToTop -->
	<!-- ================ -->
	<div class="scrollToTop">
		<i class="icon-up-open-big"></i>
	</div>

	<!-- header start -->
	<!-- ================ -->
	<header class="header fixed clearfix navbar navbar-fixed-top">
		<div class="container">
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div>
	</header>
	<!-- header end -->

	<!-- banner start -->
	<!-- ================ -->
	<div id="banner" class="banner-addinfo">
		<div class="banner-image banner-image-common">
			<div class="backstretch mypage-backstretch" style="position:relative;">
				<img
					src="${pageContext.request.contextPath }/assets/images/greece-santorini.jpg">
			</div>
		</div>
		<div class="banner-caption">
			<div class="container">
				<c:import url="/WEB-INF/views/scrap/scrapBanner.jsp" />
			</div>
		</div>
	</div>
	
	
	<!-- banner end -->
	<div class="section">
		<div class="container">
			<c:import url="/WEB-INF/views/scrap/scrapInfo.jsp" />
		</div>
	</div>


	<!-- member start -->
	<!-- ================ -->
<!-- 	<div class="section translucent-bg bg-image-2 pb-clear"> -->
<%-- 		<c:import url="/WEB-INF/views/include/member.jsp" /> --%>
<!-- 	</div>  -->
	<!-- member end -->

	<!-- finder start -->
	<!-- ================ -->
	<%-- <div class="default-bg space">
		<div class="container">
			<c:import url="/WEB-INF/views/include/finder.jsp" />
		</div>
	</div> --%>
	<!-- finder end -->

	<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
	<div class="se-pre-con"></div>
	<!-- footer start -->
	<!-- ================ -->
	<footer id="footer">
		<c:import url="/WEB-INF/views/include/footer.jsp" />
	</footer>
	<!-- footer end -->
	
	
	
	<!-- Jquery and Bootstap core js files -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/plugins/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.min.js"></script>

	<!-- Modernizr javascript -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/plugins/modernizr.js"></script>

	<!-- Isotope javascript -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/plugins/isotope/isotope.pkgd.min.js"></script>

	<!-- Backstretch javascript -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/plugins/jquery.backstretch.min.js"></script>

	<!-- Appear javascript -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/plugins/jquery.appear.js"></script>
	
	<!-- Initialization of Plugins -->
	
	
	<!-- Light Box -->
	<script src="${pageContext.request.contextPath }/assets/js/lightbox.js"></script>
	<!-- date picker -->
<!-- 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- facebook  -->
	<script src="${pageContext.request.contextPath }/assets/js/facebook_auth.js"></script>
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/template.js"></script>
	
	
	<c:import url="/WEB-INF/views/include/ajax.jsp" />
	
	<!-- Custom Scripts -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/custom.js"></script>
	
	
<%-- <c:forEach items="${sessionScope}" var="attr"> --%>
<%--     ${attr.key}=${attr.value}<br> --%>
<%-- </c:forEach> --%>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBdfn7ld2w_RvKQbflObkV6r5ClLuqqUp4&callback=initMap">
    </script>
<script>
$(document).ready(function(){
	
	$('.modal').on('shown.bs.modal', function () {
		var trvSeq = $(this).find('div div.modal-body a img').data('trvseq');
		showItemMap(trvSeq);
	});
	$( "#sortable" ).sortable({
		 cursor: 'move',
		update: function( event, ui ) {
// 			console.log(event);
// 			console.log(ui.item);
// 		 	var start_pos = ui.item.data('start_pos');
//             var idx = ui.item.index();
// 			console.log(start_pos+","+idx);
// 			ui.item.data('start_pos',index);
// 			console.log("done"+ui.item.data('start_pos'));
// 			$( ".ui-state-default" ).each(function(index){
// 				$( ".ui-state-default" ).eq(index).data('city_pos',index);
// // 				console.log("wow");
// 			})
			// 여행 도시 순서 저장
			saveCityOrder();
			// 도시 이동시 맵 Draw
			showCityNavMap("0");
// 			var ctyseq=$( ".ui-state-default a" ).eq(idx).data('city-name');
// 			console.log("done:"+ctyseq+","+ui.item.data('start_pos'));
		}
	});
    $( "#sortable" ).disableSelection();
    
    var list = $(".sortdetail");
    var list2 = $('.isotope-container');
//     sort1.sortable({
//     	handle: ".overlay-container",
//     	items: ".isotope-item",
//     	sort1.isotope('reloadItems')
//     });
//     $( "#sortdetail11" ).disableSelection();
// 	list.isotope({
// 	  transformsEnabled: false
// 	  , itemSelector: '.isotopey'
// 	  , onLayout: function() {
// 	    list
// 	    .css('overflow', 'visible')
// // 	    .css('position','relative')
// 		;
// 	  }  
// 	});
    list.sortable({
    	  cursor: 'move'
    	  //, tolerance: 'intersection'  //'pointer' is too janky
//     	  , start: function(event, ui) {                        
//     	    //add grabbing and moving classes as user has begun
//     	    //REMOVE isotopey so that isotope does not try to sort our item,
//     	    //resulting in the item moving around and flickering on 'change'
//     	    ui.item.addClass('grabbing moving').removeClass('isotopey');
    	    
//     	    ui.placeholder
//     	      .addClass('starting') //adding the 'starting' class removes the transitions from the placeholder.
// //     	      //remove 'moving' class because if the user clicks on a tile they just moved,
// //     	      //the placeholder will have 'moving' class and it will mess with the transitions
//     	      .removeClass('moving')
// //     	      //put placeholder directly below tile. 'starting' class ensures the
// //     	      //placeholder simply appears and does not 'fly' into place
//     	      .css({
//     	        top: ui.originalPosition.top
//     	        , left: ui.originalPosition.left
//     	      })
    	      
//     	      ;
//     	    //reload the items in their current state to override any previous
//     	    //sorting and to include placeholder, but do NOT call a re-layout
//     	    list.isotope('reloadItems');                    
//     	  }                
//     	  , change: function(event, ui) {
//     	    //change only fires when the DOM is changed. the DOM changes when 
//     	    //the placeholder moves up or down in the document order 
//     	    //within the sortable container
    	    
//     	    //remove 'starting' class so that placeholder can now move smoothly
//     	    //with the interface
//     	    ui.placeholder.removeClass('starting')
//     	    .css({
//     	        top: ui.position.top,
//     	        left: ui.position.left
//     	      });
//     	    //reload items to include the placeholder's new position in the DOM. 
//     	    //then when you sort, everything around the placeholder moves as 
//     	    //though the item were moving it.
//     	    list
//     	      .isotope('reloadItems')
// //     	      .isotope({ sortBy: 'original-order'})
			
//     	    ;
//     	  }
//     	  , beforeStop: function(event, ui) {
// //     	    //in this event, you still have access to the placeholder. this means
// //     	    //you know exactly where in the DOM you're going to place your element.
// //     	    //place it right next to the placeholder. jQuery UI Sortable removes the
// //     	    //placeholder for you after this event, and actually if you try to remove
// //     	    //it in this step it will throw an error.
//     	    ui.placeholder.after(ui.item);                    
//     	  }
    	  , stop: function(event, ui) {
    	    //user has chosen their location! remove the 'grabbing' class, but don't
    	    //kill the 'moving' class right away. because the 'moving' class is 
    	    //preventing your item from having transitions, you should keep it on
    	    //until isotope is done moving everything around. it will "snap" into place
    	    //right where your placeholder was.
    	    
    	    //also, you must add the 'isotopey' class back to the box so that isotope
    	    //will again include your item in its sorting list
//     	    ui.item.removeClass('grabbing').addClass('isotopey');
    	    
    	    //reload the items again so that your item is included in the DOM order
    	    //for isotope to do its final sort, which actually won't move anything
    	    //but ensure that your item is in the right place
//     	    list
//     	      .isotope('reloadItems');
    	    list2
    	      .isotope('reloadItems')
    	      .isotope({ sortBy: 'original-order', 
    	    	  transitionDuration: '0.0s'}, function(){
    	        //finally, after sorting is done, take the 'moving' class off.
    	        //doing it here ensures that your item "snaps" and isn't resorted
    	        //from its original position. since this happens on callback,
    	        //if the user grabbed the tile again before callback is fired,
    	        //don't remove the moving class in mid-grab
    	        
    	        //for some reason in this code pen, the callback isn't firing predictably
//     	        console.log(ui.item.is('.grabbing')); 
    	        
    	      });
//     	      .css({
//     	        top: '150px'
//     	      })
// 			if (!ui.item.is('.grabbing')) {
// 			ui.item.removeClass('moving');                        
// 			};
    	  }
    	  ,update: function( event, ui ) {
//     		  $( ".ui-state-default" ).each(function(index){
//   				$( ".ui-state-default" ).eq(index).data('start_pos',index);
// //   				console.log("wow");
//   			})
			var ctyseq = ui.item.data('ctyseq');
			// 여행정보 순서 저장
			saveTravelOrder(ctyseq);
			// 도시 이동시 맵 Draw
			showCityNavMap(ctyseq);
    	  }
    	});
    
	
});

function saveCityOrder(){
	
	var ctySeq = [];
// 	console.log("----------");
	var $dragItem = $( ".ui-state-default a" );
	$dragItem.each(function(index){
		if(index != 0 ) 
			ctySeq[index-1] = $dragItem.eq(index).data('city-name');
	});
// 	console.log(ctySeq);
	
	// Ajax 통신
	$.ajax( {
	    url : "${pageContext.request.contextPath }/scrap/saveCityOrder",
	    type: "post",
	    dataType: "json",
	    data: { ctySeq : ctySeq },
	//  contentType: "application/json",
	    success: function( response ){
// 	    	console.log	( response );
	       if( response.result == "fail") {
	    	   console.log( response );
	    	   return;
	       }
	    	//통신 성공 (response.result == "success" )
// 	       console.log( response.data );
	    	
	    },
	    error: function( XHR, status, error ){
	       console.log("ERROR");
	    }

	   });
	
} 

function saveTravelOrder(citySeq){
	console.log("savePlaceOrder " + citySeq);
	var trvSeq = [];
	var $trvOrderItem = $( ".sortdetail div" );
	var i=0;
	$trvOrderItem.each(function(index){
		if(citySeq == $trvOrderItem.eq(index).data('ctyseq')){
			trvSeq[i] = $trvOrderItem.eq(index).data('trvseq');
			i++;
		}
	});
	console.log(trvSeq);
	// Ajax 통신
	$.ajax( {
	    url : "${pageContext.request.contextPath }/scrap/saveTravelOrder",
	    type: "post",
	    dataType: "json",
	    data: { trvSeq : trvSeq},
	//  contentType: "application/json",
	    success: function( response ){
// 	    	console.log	( response );
	       if( response.result == "fail") {
	    	   console.log( response );
	    	   return;
	       }
	    	//통신 성공 (response.result == "success" )
// 	       console.log( response.data );
	    	
	    },
	    error: function( XHR, status, error ){
	       console.log("ERROR");
	    }

	   });
}

function initMap() {
	console.log("Hello");
	showCityNavMap("0");
	};

	
// 여행 경로 보여주기
function showCityNavMap(citySeq){

	// 구글맵 활성화가 안 되면 리턴
	if (! $("#scrapmap").is('.googlemap'))
		return;

//  	console.log("구글맵 : " + citySeq);
	var mapUrlList = [];
	var tourDirection = [];
	var idx=0;
	// 기본 스크랩 도시 경로 div 설정
	var startSearch = ".scrap-"+citySeq;

	// 전체 일정 일 때는 전체 경로 표시 및 영역 크게
	if(citySeq == '0'){
		$("#scrapmap").css('height','600px');
		startSearch = "#sortable li a"
	} else {
		$("#scrapmap").css('height','');
	}
	
	$(startSearch).each(function(index){
		
		var url = $(this).data("url");
		
// 		console.log(url + catseq);
		if (url == "" || url == undefined){
			// 전체 일정 일 때는 filter로 for문 다시 처리 , 특정 도시 일때는 스킵
			if(citySeq == '0'){
				var filter = $(this).data("filter");
				$(filter).each(function(index){
					var chkUrl = $(this).data("url");
					if(chkUrl != "" && chkUrl != undefined){
						var catseq = $(this).data("catseq");
				    	var locArray = chkUrl.split(",");
				    	console.log($(this).find("div.image-box a span").text());
				    	mapUrlList[idx] = [ 'A', $.trim(locArray[0]), $.trim(locArray[1]), idx+1, $(this).find("div.image-box a span").text(), catseq-2 ];
				    	tourDirection[idx] = { lat: parseFloat($.trim(locArray[0])), lng: parseFloat($.trim(locArray[1])) };
				    	idx++;
					}
				});
			}
	    } else {
	    	
	    	// 특정 도시 일 때 배열 저장, 전체 일정 일 때는  위 if문에서 처리하는 것 
		    	var catseq = $(this).data("catseq");
		    	var locArray = url.split(",");
		    	
		    	mapUrlList[idx] = [ 'A', $.trim(locArray[0]), $.trim(locArray[1]), idx+1, $(this).find("div.image-box a span").text(), catseq-2 ];
		    	tourDirection[idx] = { lat: parseFloat($.trim(locArray[0])), lng: parseFloat($.trim(locArray[1])) };
		    	idx++;
	    }
	//		
	});
	// 스크랩을 하나도 하지 않았을 경우 구글맵 생성 방지
	if (idx == 0 ){
		$("#scrapmap").removeClass("googlemap").addClass("text-center");
		$("#scrapmap").html("<h2>스크랩 해주세요.</h2> <a href='http://localhost:9090/poorip/#portfolio'>스크랩 하러 가기</a>");	
	   	return;
    }
	
// 	console.log(tourDirection);
	var bounds = new google.maps.LatLngBounds();
    var map = new google.maps.Map(document.getElementById('scrapmap'), {
         zoom: 15,
         center: {lat: 1.88934575, lng: 2.4879015},
         mapTypeId: 'roadmap'
    });

    // 경로 정의
	var flightPath = new google.maps.Polyline({
          path: tourDirection,
          geodesic: true,
          strokeColor: '#FF0000',
          strokeOpacity: 1.0,
          strokeWeight: 2
        });
        
	var image = ['http://localhost:9090/poorip/assets/images/mapicon1.png', 'http://localhost:9090/poorip/assets/images/mapicon2.png', 'http://localhost:9090/poorip/assets/images/mapicon3.png' ];

        
	// Add multiple markers to map
    var infoWindow = new google.maps.InfoWindow(), marker, i;
	// Place each marker on the map  
    for( i = 0; i < mapUrlList.length; i++ ) {
    	var mapItem = mapUrlList[i];
        var position = new google.maps.LatLng(mapItem[1], mapItem[2]);
//         console.log(position);
        bounds.extend(position);
        marker = new google.maps.Marker({
        	position: position,
    		map: map,
// 	        icon: image,
// 	        shape: shape,
    		nimation: google.maps.Animation.DROP,
    	    icon: image[mapItem[5]],
//     		label: mapItem[0],
    		title: mapItem[0],
    		zIndex: mapItem[3],
    		info:mapItem[4]
        });
        
        // Add info window to marker    
        google.maps.event.addListener(marker, 'click', (function(marker) {
            return function() {
                infoWindow.setContent(marker.info);
                infoWindow.open(map, marker);
            }
        })(marker, i));

        // Center the map to fit all markers on the screen
        map.fitBounds(bounds);
	    map.panToBounds(bounds)
    }

    // Set zoom level
    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
        if (idx == 1) // 여행정보가 하나이면 중간 확대	
    		this.setZoom(15);
        google.maps.event.removeListener(boundsListener);
    });   

    //         setMarkers(map);
    flightPath.setMap(map);
}

// 1개의 여행정보 지도 보여주기
function showItemMap(seq) {
    var mapId = "map-"+seq;
    var url = $('#'+mapId).data("url");
    if (url == ""){
    	$('#'+mapId).removeClass("googlemap");
    	$('#'+mapId).text("정보없음");
    	return;
    }
    var locArray = url.split(",");
    var myLatlng = new google.maps.LatLng($.trim(locArray[0]),$.trim(locArray[1]));
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

function showCityMap(citySeq){
	event.preventDefault();
	var $scrapMap = $("#scrapmap");
	var $mapBtn = $("#scrapMapBtn-"+citySeq);
	if ($scrapMap.is('.googlemap')) {
		$scrapMap.css('display','none').removeClass("googlemap");
		$mapBtn.val('지도보기');

	} else {
		$scrapMap.css('display','').addClass("googlemap");
		$mapBtn.val('지도 숨기기');
		showCityNavMap(citySeq);
	}	
}
</script>
</body>
</html>