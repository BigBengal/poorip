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

	var dateFormat = "mm/dd/yy", from = $("#fromDate").datepicker({
		defaultDate : "+1w",
		changeMonth : true,
		numberOfMonths : 2
	}).on("change", function() {
		to.datepicker("option", "minDate", getDate(this));

	}), to = $("#toDate").datepicker({
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
         data: "trvSeq="+trvSeq,
         
         success : function(data) {
        	 console.log(data);
             if(data.result=="fail") {
            	 console.log("삭제함");
            	 likeIcon.src="/poorip/assets/images/scrapicon.png";
        
             } else {
            	 console.log("스크랩함");
            	 likeIcon.src="/poorip/assets/images/scrapicon-scraped.png";
             };
         },
         error : function(data) {
//              alert("ajax 에러가 발생하였습니다.")
         }
     });
	
	
};

function setDate(ctySeq) {
	event.preventDefault();
	$("#scrap-date-info-"+ctySeq).empty();
	var param = jQuery("#set-date-scrap-"+ctySeq).serialize();
	console.log(param);
	console.log(ctySeq);
		$.ajax({
        url : "/poorip/scrap/scrapSave/" + ctySeq,
        type : "post",
        data: param, 
        
        success : function(data) {
        	$.ajax({
                url : "/poorip/scrap/showDate",
                type : "post",
                data: "ctySeq="+ ctySeq, 
                
                success : function(result) {
                	
                	
                	var html = "<p >" + result.data.dateFrom  + " ~ " + result.data.dateTo + "</p>";
    		
                	$("#scrap-date-info-"+ctySeq).append(html);
                   
                },
                error : function(data) {
//                     alert("ajax 에러가 발생하였습니다.")
                }
                
        	 });
           
        },
        error : function(data) {
//             alert("ajax 에러가 발생하였습니다.")
        }
        
	 });
	};



