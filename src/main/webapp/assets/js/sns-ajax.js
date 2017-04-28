
var dialogDeleteForm = null;
var isEnd = false;
var page = 0;
var post_render = function( vo ) {
   var post_html = "<div class='form-group'>" + 
                  "<p class='col-sm-2'>" + vo.postSeq + "</p>" +
                     "<p class='col-sm-10 text-center' style='font-size: 20px'><strong>" + vo.title + "</strong></p>" +
                  "</div>" +
                  "<div class='form-group'>" +
               "<div class='col-md-offset-4'>" +
                     "<p class='col-md-12'>" + 
                        "<div class='cycle-slideshow'" +
                           "data-cycle-fx='scrollHorz'" +
                           "data-cycle-timeout='0'" +
                           "data-cycle-prev='prev'" +
                           "data-cycle-next='#next' id='first-html-" + vo.postSeq + "'>" ;

                 $( "#my-sns-list" ).append(post_html);
}

var postPic_render = function(vo2, vo) {
   var postPic_html = "<a href='/poorip" + vo2.path + "/" + vo2.fileName + " 'width='500px' id='middle-html-" + vo2.postPicSeq + "' data-lightbox='sns-images-"+ vo.postSeq+ "' id='middle-html-" + vo.postSeq + "'><img src='/poorip" + vo2.path + "/" + vo2.fileName + " 'width='500px' ></a>" + vo2.postPicSeq;
                              

                  $( "#first-html-"+vo.postSeq ).append(postPic_html);
}

var last_render = function(vo, postPicSeq) {
	console.log("1,2,3!!!!!" + postPicSeq);
  if(postPicSeq!=null) {
   var last_html =               "</div>" +
                           "<div class='text-center'>" +
                              "<a herf=# id='prev'> ! </a>" +
                              "<a herf=# id='nexr'> < </a>" +
                           "</div>" +
                        "</p>" +
                     "</div>" +
                     "</div>" + 
                  "<div class='form-group'>" +
                  "<p class='col-md-12 text-center' style='font-size: 15px'>" + vo.contents + "</p>" +
               "</div>" + 
               "<div class='form-group'>" +
                  "<p class='col-md-7'> </p>" +
                  "<p class='col-md-5' align='left'>" + vo.crtDate + "</p>" +
               "</div>" +
               "<div class='form-group'>" +
                  "<p class='col-md-4' align='left' data-postSeq='" + vo.postSeq + "'><img alt='삭제' src='/poorip/assets/images/delete-btn.png' style='width: 30px'></p>" +
                     "<p class='col-md-4' align='center'><img alt='공유' src='/poorip/assets/images/share-btn.png' style='width: 30px'></p>" +
                     "<p class='col-md-4' align='right'><img alt='수정' src='/poorip/assets/images/write-btn.png' style='width: 30px'></p>" + 
                  "</div>";

               $("#middle-html-"+postPicSeq).after(last_html);
  }  
  else {
	  var last_html =	   "</div>" +
       "<div class='text-center'>" +
          "<a herf=# id='prev'> ! </a>" +
          "<a herf=# id='nexr'> < </a>" +
       "</div>" +
    "</p>" +
 "</div>" +
 "</div>" + 
"<div class='form-group'>" +
"<p class='col-md-12 text-center' style='font-size: 15px'>" + vo.contents + "</p>" +
"</div>" + 
"<div class='form-group'>" +
"<p class='col-md-7'> </p>" +
"<p class='col-md-5' align='left'>" + vo.crtDate + "</p>" +
"</div>" +
"<div class='form-group'>" +
"<p class='col-md-4' align='left' data-postSeq='" + vo.postSeq + "'><img alt='삭제' src='/poorip/assets/images/delete-btn.png' style='width: 30px'></p>" +
 "<p class='col-md-4' align='center'><img alt='공유' src='/poorip/assets/images/share-btn.png' style='width: 30px'></p>" +
 "<p class='col-md-4' align='right'><img alt='수정' src='/poorip/assets/images/write-btn.png' style='width: 30px'></p>" + 
"</div>";

$("#first-html-"+vo.postSeq).after(last_html);
	  
  };
} 

var fetchList = function() {
   if( isEnd == true ) {
      return;
   }
   console.log("!");
   $(window).data('ajaxready', true).scroll(function(e) {
       if ($(window).data('ajaxready') == false) {
          return;
       };
       if ($(window).scrollTop() >= ($(document).height() - $(window).height())) {
           $(window).data('ajaxready', false);
               $.ajax( {
               url : "sns/main/" + page,
               type : "get",
               dataType: "json",
               data : "",
               success: function( response ) {
                  //console.log(response);
                  if( response.result != "success" ) {
                     return 
                  }
                  
                  if( response.data.length == 0 ) {
                     isEnd = true;
                     return;
                  }
                  var postPicSeq = null;
                  ++page;
                  $( response.data.post ).each( function( index, vo) {
                     //console.log(index + "  ++++"+ vo.title);    
                     console.log(1);
                     post_render( vo );
                     console.log("datalength" + response.data.postPic[vo.postSeq].length);
                     if(response.data.postPic[vo.postSeq].length> 0) {
                     $( response.data.postPic[vo.postSeq]).each( function( index, vo2) {
                        
                    	 postPic_render( vo2, vo );
                        console.log(2);
                        console.log("yyy"+ response.data.postPic[vo.postSeq][index].postPicSeq);
                        	if(index == $( response.data.postPic[vo.postSeq]).length-1) {
                        		postPicSeq= vo2.postPicSeq;
                        		console.log(postPicSeq);
                        	};
                        
                     });
                     };
                     console.log(3);
                  last_render( vo, postPicSeq );
                  postPicSeq= null;
                  });
                  
                  
                  $(window).data('ajaxready', true);
         
               },
               error: function( XHR, status, error ) {
                  console.error( status + " : " + error );
               }
               });
};
   });
};
$(function() {
   

   $( window ).scroll(function(){
      var $window = $(this);
      var scrollTop = $window.scrollTop();
      var windowHeight = $window.height();
      var documentHeight = $(document).height();
      
      if( scrollTop + windowHeight +3 > documentHeight ) {
         fetchList();
      }
   });
});

var writeVisible = false;

function showWrite(){
	if ( writeVisible == true ) {
		$("#sns-write").hide();	
		writeVisible = false;
	} else {
		$("#sns-write").show();
		writeVisible = true;
	}
	
}
