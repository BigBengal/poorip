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
	
	

	
	var dateFormat = "yy-mm-dd", from = $(".fromDatePick").datepicker({
		dateFormat : 'yy-mm-dd',
		defaultDate : "+1w",
		changeMonth : true,
		numberOfMonths : 2
	}).on("change", function() {
		to.datepicker("option", "minDate", getDate(this));

	}), to = $(".toDatePick").datepicker({
		dateFormat : 'yy-mm-dd',
		defaultDate : "+1w",
		changeMonth : true,
		numberOfMonths : 2
	}).on("change", function() {
		from.datepicker("option", "maxDate", getDate(this));
		// dateTo = getDate(this);
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

// 스크랩 여부

// function openOptions() {
// document.getElementById("profileDropdown").classList.toggle("show");
// }

// Close the dropdown menu if the user clicks outside of it
// window.onclick = function(event) {
// if (!event.target.matches('#loginpic')) {
//
// var dropdowns = document.getElementsByClassName("dropdown-content");
// var i;
// for (i = 0; i < dropdowns.length; i++) {
// var openDropdown = dropdowns[i];
// if (openDropdown.classList.contains('show')) {
// openDropdown.classList.remove('show');
// }
// }
// }
// }

function validate(trvSeq) {
	var likeIcon = document.getElementById("scrapTrvInfo-" + trvSeq);

	$
			.ajax({
				url : "/poorip/scrap/scrapInput",
				type : "post",
				data : "trvSeq=" + trvSeq,

				success : function(data) {
					console.log(data);
					if (data.result == "fail") {
						console.log("삭제함");
						swal({
							title : "",
							html : "<span style='color:#75a6ca; font-size:1.1em;'><strong>스크랩</span>을 삭제하였습니다!</strong>"
						// html: true
						});
						likeIcon.src = "/poorip/assets/images/star_off.png";

					} else {
						swal({
							title : "",
							html : "<span style='color:#75a6ca; font-size:1.1em;'><strong>스크랩</span>이 완료되었습니다!</strong>"
						// html: true
						});
						console.log("스크랩함");
						likeIcon.src = "/poorip/assets/images/star_on.png";
					}
					;
				},
				error : function(data) {
					// alert("ajax 에러가 발생하였습니다.")
				}
			});

};

// 날짜 지정
function setDate(ctySeq) {
	event.preventDefault();
	// $("#scrap-date-info-" + ctySeq).empty();
	// $("#travel-date-info").empty();
	var param = jQuery("#set-date-scrap-" + ctySeq).serialize();
	$.ajax({
		url : "/poorip/scrap/scrapSave/" + ctySeq,
		type : "post",
		data : param,

		success : function(data) {
			// console.log(data);
			if (data.result == "fail") {
				console.log("저장 오류");
			} else {
				// 선택 도시 일정 선택
				var htmlDate = data.data.cityDate.dateFrom + " ~ "
						+ data.data.cityDate.dateTo;
				$("#scrap-date-info-" + ctySeq).html(htmlDate);

				// 전체 일정 설정
				var htmlTravelDate = data.data.totalDate.dateFrom + " ~ "
						+ data.data.totalDate.dateTo + " 총 여행일 수는   "
						+ data.data.totalDate.dateDiff + "일 입니다";
				// console.log(htmlTravelDate);
				$("#travel-date-info").html(htmlTravelDate);

			}
		},
		error : function(data) {
			// alert("ajax 에러가 발생하였습니다.")
		}

	});
};

// 날짜 초기화

function clearDate(ctySeq) {
	event.preventDefault();
	// $("#travel-date-info").empty();
	$
			.ajax({
				url : "/poorip/scrap/renewDate",
				type : "post",
				data : "ctySeq=" + ctySeq,

				success : function(result) {

					console.log(result);
					document.getElementById("scrap-date-info-" + ctySeq).innerHTML = "&nbsp;";

					if (result.data == null) {
						$("#travel-date-info").empty();
						return;
					}
					var htmlTravelDate = result.data.dateFrom + " ~ "
							+ result.data.dateTo + " 총 여행일 수는   "
							+ result.data.dateDiff + "일 입니다";
					console.log(htmlTravelDate);
					$("#travel-date-info").html(htmlTravelDate);
				},
				error : function(data) {
					// alert("ajax 에러가 발생하였습니다.")
				}
			});
}

function onSignIn(googleUser) {

	var profile = googleUser.getBasicProfile();
	console.log('ID: ' + profile.getId()); // Do not send to your backend! Use
											// an ID token instead.
	console.log('Name: ' + profile.getName());
	console.log('Image URL: ' + profile.getImageUrl());
	console.log('Email: ' + profile.getEmail()); // This is null if the
													// 'email' scope is not
													// present.
};

function signOut() {
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function() {
		console.log('User signed out.');
	});
};

$(document)
		.ready(
				function() {
					$("#pool-img-changebtn")
							.click(
									function() {
										var imgVal = $('#pool-img-upload')
												.val();
										if (imgVal == '') {
											swal("이미지 파일이 없습니다!")
											return false;
										}

										console.log("YO!?");
										$("#pool-image-form")
												.ajaxForm(
														{
															url : "/poorip/poolparty/changePic",
															enctype : "multipart/form-data",
															dataType : "json",
															success : function(
																	response) {
																$(
																		'#poolparty-Img-Modal')
																		.modal(
																				'toggle');
																console
																		.log(response);
																document
																		.getElementById("pool-main-pic").src = "/poorip"
																		+ response.data;
																console
																		.log(response.data);
															},
															error : function(
																	data) {
																console
																		.log("ajax 에러가 발생하였습니다.")
															}

														});
									});
				});


