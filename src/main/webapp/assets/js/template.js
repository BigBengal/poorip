/* Theme Name: Worthy - Free Powerful Theme by HtmlCoder
 * Author:HtmlCoder
 * Author URI:http://www.htmlcoder.me
 * Version:1.0.0
 * Created:November 2014
 * License: Creative Commons Attribution 3.0 License (https://creativecommons.org/licenses/by/3.0/)
 * File Description: Initializations of plugins 
 */

(function($){
	$(document).ready(function(){
	
		$(".banner-image").backstretch('assets/images/pool-party2.jpg');
		
		var $myMenu = $("#myMenu");	
		// myMenu 보기
		$("#MyMenuHover").mouseenter(function(){
			$myMenu.addClass("show");
		});
		$(".header").mouseleave(function(){
			$myMenu.removeClass("show");
		});
		
		// Fixed header
		//-----------------------------------------------
		$(window).scroll(function() {
			if (($(".header.fixed").length > 0)) { 
				if(($(this).scrollTop() > 0) && ($(window).width() > 767)) {
					$("body").addClass("fixed-header-on");
				} else {
					$("body").removeClass("fixed-header-on");
				}
			};
		});

		$(window).load(function() {
			if (($(".header.fixed").length > 0)) { 
				if(($(this).scrollTop() > 0) && ($(window).width() > 767)) {
					$("body").addClass("fixed-header-on");
				} else {
					$("body").removeClass("fixed-header-on");
				}
			};
		});

		//Scroll Spy
		//-----------------------------------------------
		if($(".scrollspy").length>0) {
			$("body").addClass("scroll-spy");
			$('body').scrollspy({ 
				target: '.scrollspy',
				offset: 152
			});
		}

		//Smooth Scroll
		//-----------------------------------------------
		if ($(".smooth-scroll").length>0) {
			$('.smooth-scroll a[href*=#]:not([href=#]), a[href*=#]:not([href=#]).smooth-scroll').click(function() {
				if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
					var target = $(this.hash);
					target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
					if (target.length) {
						$('html,body').animate({
							scrollTop: target.offset().top-151
						}, 1000);
						return false;
					}
				}
			});
		}

		// Animations
		//-----------------------------------------------
		if (($("[data-animation-effect]").length>0) && !Modernizr.touch) {
			$("[data-animation-effect]").each(function() {
				var $this = $(this),
				animationEffect = $this.attr("data-animation-effect");
				if(Modernizr.mq('only all and (min-width: 768px)') && Modernizr.csstransitions) {
					$this.appear(function() {
						setTimeout(function() {
							$this.addClass('animated object-visible ' + animationEffect);
						}, 400);
					}, {accX: 0, accY: -130});
				} else {
					$this.addClass('object-visible');
				}
			});
		};

		// Isotope filters
		//-----------------------------------------------
		if ($('.isotope-container').length>0) {
			$(window).load(function() {	
				$(".nav-pills > li").eq(0).addClass("active");
				var initFilter = $(".filters").find("li.active a").data('filter')
//				if ($(".filters").find("li.active a").data('filter') == 'Y') {
					$('.isotope-container').fadeIn();
					var $container = $('.isotope-container').isotope({
						itemSelector: '.isotope-item',
//						stamp: '.setup',
						layoutMode: 'masonry',
						transitionDuration: '0.6s',
						filter: initFilter,
						masonry: {
						    columnWidth: '.col-md-3'
						  }
//						filter: '.cities'
					});	
//				} else {
//					$('.isotope-container').fadeIn();
//					var $container = $('.isotope-container').isotope({
//						itemSelector: '.isotope-item',
//						layoutMode: 'masonry',
//						transitionDuration: '0.6s',
//						filter: '.web-design'
//					});	
//				};

				// filter items on button click
				$('.filters').on( 'click', 'ul.nav li a', function() {
					var filterValue = $(this).attr('data-filter');
					
					$(".filters").find("li.active").removeClass("active");
					$(this).parent().addClass("active");
					$container.isotope({ filter: filterValue });
					
					// 달력이 있으면 달력 초기화
					if ($('.fromDatePick').length>0) {
						var cityName = $(this).attr('data-city-name');
						$('#fromDate-'+cityName).datepicker( "option", "maxDate", null );
						$('#toDate-'+cityName).datepicker( "option", "minDate", null );
					}
					return false;
				});
			});
		};

		//Modal
		//-----------------------------------------------
		if($(".modal").length>0) {
			$(".modal").each(function() {
				$(".modal").prependTo( "body" );
				
			});
		}
		
		

	}); // End document ready
})(this.jQuery);


