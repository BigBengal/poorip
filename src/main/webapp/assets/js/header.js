/**
 *  상단 메뉴 전용 스크립트
 */
$(document).ready(function(){
	var $myMenu = $("#myMenu");
		
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

	//Scroll Spy (스크롤 위치를 기반으로 네비게이션 대상을 갱신하기 위하)
	//-----------------------------------------------
	if($(".scrollspy").length>0) {
		$("body").addClass("scroll-spy");
		$('body').scrollspy({ 
			target: '.scrollspy',
			offset: 152
		});
	}

	//Smooth Scroll ( 스크롤을 에니메이션으로 내려주는 것)
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

});

$(window).load(function() {
	// Animate loader off screen
	$(".se-pre-con").fadeOut("slow");
	;
});