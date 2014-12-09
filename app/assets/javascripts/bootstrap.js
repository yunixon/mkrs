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


/* Homepage */

$(function(){

  $('#featured-item-container').masonry({
    itemSelector: '.box',
    columnWidth: 180,
    gutterWidth: 18
  });

  $('#featured-item-container .box:first-child').addClass('col4-1');
  $('#featured-item-container .box:nth-child(2)').addClass('col4');
});


// $(function(){

//   $('.dropdown-toggle.settings span').removeClass('caret').addClass('icon-caret-down-two');
// });



$(function(){

  $('a.item-link').mouseover(function() {
    $(this).css( "background-color", "rgba(34,38,40, .5)" );
  }).mouseout(function() {
  	$(this).css( "background-color", "transparent" );;
  });

    $('.listing-author').mouseover(function() {
    $(this).prev().css( "background-color", "rgba(34,38,40, .5)" );
  }).mouseout(function() {
  	$(this).css( "background-color", "transparent" );
  });



});


$(document).ready(function(){
	Dropzone.autoDiscover = false;
	$("#old_photo").dropzone({
		removedfile: function(file){
			// grap the id of the uploaded file we set earlier
			var id = $(file.previewTemplate).find('.dz-remove').attr('id'); 
 
			// make a DELETE ajax request to delete the file
			$.ajax({
				type: 'DELETE',
				url: '/photos/' + id,
				success: function(data){
					console.log(data.message);
					$(file.previewElement).fadeOut("fast");
				}
			});
		}
	});
});



$(document).ready(function(){
	// disable auto discover
	Dropzone.autoDiscover = false;
 
	// grap our upload form by its id
	$("#new_photo").dropzone({
		thumbnailWidth:"230",
  		thumbnailHeight:"230",
  		maxFiles: "5",
		// restrict image size to a maximum 1MB
		maxFilesize: 1,
		// changed the passed param to one accepted by
		// our rails app
		paramName: "photo[image]",
		// show remove links on each image upload
		addRemoveLinks: true,
		// if the upload was successful
		success: function(file, response){
			// find the remove button link of the uploaded file and give it an id
			// based of the fileID response from the server
			$(file.previewTemplate).find('.dz-remove').attr('id', response.fileID);
			// add the dz-success class (the green tick sign)
			$(file.previewElement).addClass("dz-success");
		},
		//when the remove button is clicked
		removedfile: function(file){
			// grap the id of the uploaded file we set earlier
			var id = $(file.previewTemplate).find('.dz-remove').attr('id'); 
 
			// make a DELETE ajax request to delete the file
			$.ajax({
				type: 'DELETE',
				url: '/photos/' + id,
				success: function(data){
					console.log(data.message);
					$(file.previewElement).fadeOut("fast");
				}
			});
		}
	});	
});



$(document).ready(function(){
	jQuery('ul.nav li.dropdown').hover(function() {
	  jQuery(this).find('.dropdown-menu').stop(true, true).delay(50).fadeIn('fast');
	}, function() {
	  jQuery(this).find('.dropdown-menu').stop(true, true).delay(50).fadeOut('fast');
	});
});


/* Find empty container in profiles */

$(document).ready(function(){
	if($.trim($(".user-profile-section #item-container").html())=='') {
		$('.user-profile-section .user-profile-section-title').remove();
		$(".user-profile-section #item-container").remove();
		$('.user-profile-section').append("<div class='user-profile-items-empty'><p>Vartotojas nėra įkėlęs jokių rankdarbių.</p></div>");
	}
});