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





