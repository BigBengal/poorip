/* Theme Name: Worthy - Free Powerful Theme by HtmlCoder
 * Author:HtmlCoder
 * Author URI:http://www.htmlcoder.me
 * Version:1.0.0
 * Created:November 2014
 * License: Creative Commons Attribution 3.0 License (https://creativecommons.org/licenses/by/3.0/)
 * File Description: Place here your custom scripts
 */

/* When the user clicks on the button, 
 toggle between hiding and showing the dropdown content */

$(function() {

	var dateFormat = "mm/dd/yy", from = $(".fromDatePick").datepicker({
		defaultDate : "+1w",
		changeMonth : true,
		numberOfMonths : 2
	}).on("change", function() {
		to.datepicker("option", "minDate", getDate(this));

	}), to = $(".toDatePick").datepicker({
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

function openOptions() {
	document.getElementById("profileDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
	if (!event.target.matches('#loginpic')) {

		var dropdowns = document.getElementsByClassName("dropdown-content");
		var i;
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			if (openDropdown.classList.contains('show')) {
				openDropdown.classList.remove('show');
			}
		}
	}
}

function validate(trvSeq) {
	var likeIcon = document.getElementById("scrapTrvInfo-" + trvSeq);

	$.ajax({
		url : "/poorip/scrap/scrapInput",
		type : "post",
		data : "trvSeq=" + trvSeq,

		success : function(data) {
			console.log(data);
			if (data.result == "fail") {
				console.log("삭제함");
				likeIcon.src = "/poorip/assets/images/scrapicon.png";

			} else {
				console.log("스크랩함");
				likeIcon.src = "/poorip/assets/images/scrapicon-scraped.png";
			}
			;
		},
		error : function(data) {
			// alert("ajax 에러가 발생하였습니다.")
		}
	});

};

function setDate(ctySeq) {
	event.preventDefault();
	$("#scrap-date-info-" + ctySeq).empty();
	$("#travel-date-info").empty();
	var param = jQuery("#set-date-scrap-" + ctySeq).serialize();
	console.log(param);
	console.log(ctySeq);
	$.ajax({
		url : "/poorip/scrap/scrapSave/" + ctySeq,
		type : "post",
		data : param,

		success : function(data) {
			$.ajax({
				url : "/poorip/scrap/showDate",
				type : "post",
				data : "ctySeq=" + ctySeq,

				success : function(result) {

					var htmlDate = "<div id='city-travel-duration-'" + ctySeq + "' ><h4><strong> 여행 기간은 " + result.data.dateFrom + " ~ "
							+ result.data.dateTo + " 입니다<strong><h4></div>";
					console.log(htmlDate + "HEY??");
					$("#scrap-date-info-" + ctySeq).prepend(htmlDate);

					$.ajax({
						url : "/poorip/scrap/showDuration",
						type : "post",
						data : "",

						success : function(result) {

							var htmlTravelDate =  result.data.dateFrom
									+ " ~ " + result.data.dateTo
									+ " 총 여행일 수는   " + result.data.dateDiff + "일 입니다"
								;
							console.log(htmlTravelDate);
							$("#travel-date-info").prepend(htmlTravelDate);
							
						

						},
						error : function(data) {
							// alert("ajax 에러가 발생하였습니다.")
						}

					});

				},
				error : function(data) {
					// alert("ajax 에러가 발생하였습니다.")
				}

			});

		},
		error : function(data) {
			// alert("ajax 에러가 발생하였습니다.")
		}

	});
};



function clearDate(ctySeq) {
	event.preventDefault();
	$("#travel-date-info").empty();
	$.ajax({
	url : "/poorip/scrap/renewDate",
	type : "post",
	data : "ctySeq=" + ctySeq,

	success : function(result) {

		console.log(result);
		document.getElementById("scrap-date-info-" + ctySeq).innerHTML = "";
		
		$.ajax({
			url : "/poorip/scrap/showDuration",
			type : "post",
			data : "",

			success : function(result) {

				var htmlTravelDate =  result.data.dateFrom
						+ " ~ " + result.data.dateTo
						+ " 총 여행일 수는   " + result.data.dateDiff + "일 입니다"
					;
				console.log(htmlTravelDate);
				$("#travel-date-info").prepend(htmlTravelDate);
				
			

			},
			error : function(data) {
				// alert("ajax 에러가 발생하였습니다.")
			}

		});
	

	},
	error : function(data) {
		// alert("ajax 에러가 발생하였습니다.")
	}

});
}

function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	};
	
  function signOut() {
	    var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	      console.log('User signed out.');
	    });
	  };

	  

