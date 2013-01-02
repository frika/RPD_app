/* Author: 

*/



$('document').ready(function(){

	$('#firstBatch').click(function(e){
		$('div#container').hide();
		$('div.image-featured').css('visibility', 'hidden');
		e.preventDefault();
		$('div#first').css('visibility', 'visible');
	});
	$('#secondBatch').click(function(e){
		$('div#container').hide();
		$('div.image-featured').css('visibility', 'hidden');
		e.preventDefault();
		$('div#second').css('visibility', 'visible');
	});
	$('#thirdBatch').click(function(e){
		$('div#container').hide();
		$('div.image-featured').css('visibility', 'hidden');
		e.preventDefault();
		$('div#third').css('visibility', 'visible');
	});
	$('a#close-YIP').click(function(e) {
		e.preventDefault();
		$('div#container').fadeIn();
		$('div.image-featured').css('visibility', 'hidden');
	});
	$('a.toggle-caption').click(function(e) {
		e.preventDefault();
		$('div.caption-YIP').text($(this).attr('title')).fadeToggle();
	});
	
	
	$(".fancybox").fancybox({
		width       : 320,
		padding     : 0,
		helpers : {
    		title : {
    			type : 'outside'
    		}
    	},
		openEffect	: 'none',
		closeEffect	: 'none'
	});


	
});
(function($) {
    
  var allPanels = $('.accordion > dd').hide();
  $('.accordion > dt > a').live('click', function() {
  	var something = $(this);
    allPanels.slideUp('fast');
    $('.accordion > dt > a').removeClass('open');
    if ($(this).parent().next().css('display') === 'none'){
    	$(this).parent().next().slideDown('fast', function(){
    		$('body').animate({scrollTop : something.offset().top}, 'fast');
    	});
    	$(this).addClass('open');	
    	
    	return false;
	} else {
		$(this).parent().next().slideUp('fast');
		$(this).removeClass('open');
		return false;
	}
	
  });

})(jQuery);


















