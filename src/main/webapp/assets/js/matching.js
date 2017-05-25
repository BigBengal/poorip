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
	console.log("uauauaua");
//	var dataSource = [];
	var showChart = ".chart-div";
	console.log("sssssssss");
	$(showChart).each(function (index){
		var usrSeq = $(this).data("usrseq");
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
		console.log(dataSource);
//		dataSource[index] = { "일정":dateScore, "음식취향":foodScore, "관광취향":sightScore, "활동적 지수":activityScore, "럭셔리":luxuryScore, "성향":useriSurveyScore };

		$("#chart-"+usrSeq).dxPolarChart({
			dataSource: dataSource,
			useSpiderWeb: true,
			series: [{ valueField: "value", name: usrSeq}],
			commonSeriesSettings: {
				type: "line"
			},
			tooltip: {
				enabled: true
			}
		});
		console.log(usrSeq);

	});

}
