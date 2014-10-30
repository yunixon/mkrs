jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();
});




$(function(){
	$( ".item" ).first().addClass('active');
	$('#slider-thumbs ul li a').first().attr('class', 'selected'); 
	
	$('#slider-thumbs ul li:nth-child(1) a').attr('id', 'carousel-selector-0');
	$('.carousel-inner .item:nth-child(1)').attr('data-slide-number', '0');

	$('#slider-thumbs ul li:nth-child(2) a').attr('id', 'carousel-selector-1');
	$('.carousel-inner .item:nth-child(2)').attr('data-slide-number', '1');

	$('#slider-thumbs ul li:nth-child(3) a').attr('id', 'carousel-selector-2');
	$('.carousel-inner .item:nth-child(3)').attr('data-slide-number', '2');

	$('#slider-thumbs ul li:nth-child(4) a').attr('id', 'carousel-selector-3');
	$('.carousel-inner .item:nth-child(4)').attr('data-slide-number', '3');

	$('#slider-thumbs ul li:nth-child(5) a').attr('id', 'carousel-selector-4');
	$('.carousel-inner .item:nth-child(5)').attr('data-slide-number', '4');


	$('#images-carousel').carousel({
	    interval: 8000
	});

// handles the carousel thumbnails
	$('[id^=carousel-selector-]').click( function(){
	  var id_selector = $(this).attr("id");
	  var id = id_selector.substr(id_selector.length -1);
	  id = parseInt(id);
	  $('#images-carousel').carousel(id);
	  $('[id^=carousel-selector-]').removeClass('selected');
	  $(this).addClass('selected');
	});

	// when the carousel slides, auto update
	$('#images-carousel').on('slid.bs.carousel', function (e) {
	  var id = $('.item.active').data('slide-number');
	  id = parseInt(id);
	  $('[id^=carousel-selector-]').removeClass('selected');
	  $('[id=carousel-selector-'+id+']').addClass('selected');
});

});


$(function(){

  $('#item-container').masonry({
    itemSelector: '.box',
    columnWidth: 265,
    gutterWidth: 20
  });

});


$(function(){
	$('.custom-form.password.repeat').hide();
	$('.custom-form.password').on('input', function() {
	    $('.custom-form.password.repeat').fadeIn('slow');
	});
});


$(function(){
	$('.bootstrap-tagsinput input').attr('placeholder', 'Įveskite naudotas medžiagas');
	$('.bootstrap-tagsinput input').attr('style', 'width:14em!important');
});

$(function(){
	$(".listing-info .info.tags").text(function(i, val) {
	    return val.replace(/,/g, ", ");
	});
});

