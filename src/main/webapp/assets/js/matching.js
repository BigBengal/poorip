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
			series: [{ valueField: "value", name: usrNick, color: '#5f8b95', type: "area" },
					 { valueField: "value", name: usrNick, color: '#5f8b95', type: "line" }],
			commonSeriesSettings: {
				type: "line"
			},
			legend: { visible: false },
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
	        	$('#making-pool-form-'+usrSeq).submit();
	        },
	        "CANCLE": function() {
	          $( this ).dialog( "close" );
	        }
	      }
	});
}

function madePool(usrSeq){
	dialog = $("#made-pool-"+usrSeq).dialog({
		resizable: false,
	      height: "auto",
	      width: 400,
	      modal: true,
	      buttons: {
	        "CANCEL": function() {
	          $( this ).dialog( "close" );
	        }
	      }
	});
}

var showVisible = true;
var showDateListVisible = true;

function showDateList(usrSeq){
	if ( showVisible == true ) {
		var addHeight = $("#dateList-"+usrSeq).height();
		var oriHeight = $("#personContainer-"+usrSeq).height();
		$("#personContainer-"+usrSeq).height(oriHeight+addHeight);
		$("#dateList-"+usrSeq).show();	
		showVisible = false;
	} else {
		var oriHeight = $("#personContainer-"+usrSeq).height();
		var hideHeight = $("#dateList-"+usrSeq).height();
		$("#personContainer-"+usrSeq).height(oriHeight-hideHeight);
		$("#dateList-"+usrSeq).hide();
		showVisible = true;
	}
}

function showSameDateList(usrSeq){
	if ( showDateListVisible == true ) {
		$("#showDateList-"+usrSeq).show();	
		showDateListVisible = false;
	} else {
		$("#showDateList-"+usrSeq).hide();
		showDateListVisible = true;
	}
}
