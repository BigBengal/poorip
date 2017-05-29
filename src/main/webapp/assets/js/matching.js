$(document).ready(function() {
	$(".banner-image").backstretch('/poorip/assets/images/matching-background.jpg');
	showChart();
});


$(window).load(function() {
	// Animate loader off screen
	$(".se-pre-con").fadeOut("slow");
	;
});


function showChart() {
	var showChart = ".chart-div";
	$(showChart).each(function (index){
		var usrSeq = $(this).data("usrseq");
		var usrNick = $(this).data("usrnick")
		var foodScore = $(this).data("foodscore");
		var sightScore = $(this).data("sightscore");
		var activityScore = $(this).data("activityscore");
		var luxuryScore = $(this).data("luxuryscore");
		var dateScore = $(this).data("datescore");
		var useriSurveyScore = $(this).data("userisurveyscore");

		var dataSource = [{
			arg: "일정",
			value: dateScore
		}, {
			arg: "음식취향",
			value: foodScore
		}, {
			arg: "관광취향",
			value: sightScore
		}, {
			arg: "활동적 지수",
			value: activityScore
		}, {
			arg: "럭셔리",
			value: luxuryScore
		}, {
			arg: "성향",
			value: useriSurveyScore
		}];
		
//		dataSource[index] = { "일정":dateScore, "음식취향":foodScore, "관광취향":sightScore, "활동적 지수":activityScore, "럭셔리":luxuryScore, "성향":useriSurveyScore };

		$("#chart-"+usrSeq).dxPolarChart({
			dataSource: dataSource,
			useSpiderWeb: true,
			series: [{ valueField: "value", name: usrNick}],
			commonSeriesSettings: {
				type: "line"
			},
			tooltip: {
				enabled: true
			}
		});
	});

}

function makingPool(usrSeq){
	dialog = $("#making-pool-"+usrSeq).dialog({
		resizable: false,
	      height: "auto",
	      width: 400,
	      modal: true,
	      buttons: {
	        "MAKE": function() {
//	          $( this ).dialog( "close" );
//	          $.ajax( {
//	      		url : "/poorip/poolparty/make",
//	      		type: "post",
//	      	    dataType: "json",
//	      	    data: "usrSeq="+usrSeq,
//	      	    success: function( response ){
//	      	    	if( response.result != "success" ) {
//	      	    		return;
//	      	    	}
//	      	    },
//	      	    error: function( XHR, status, error ){
//	      	       console.error("Error" );
//	      	   	}
//	          });
	        	$('#making-pool-form-'+usrSeq).submit();
	        },
	        "CENCLE": function() {
	          $( this ).dialog( "close" );
	        }
	      }
	});

}
