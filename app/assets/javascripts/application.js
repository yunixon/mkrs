// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// Dropdown //

$(document).ready(function(){
  $(".user-tooltip").hide();
  $(".profile-pic").click(function(e){
  	e.stopPropagation();
    e.preventDefault();
    $(".user-tooltip").show();
  });

  jQuery('html').click(function(){
    if( !jQuery(event.target).hasClass('.user-tooltip') ){
        jQuery('.user-tooltip').hide();
    	}
  });  

});


$(document).mouseup(function (e)
{
    var container = $("YOUR CONTAINER SELECTOR");

    if (!container.is(e.target) // if the target of the click isn't the container...
        && container.has(e.target).length === 0) // ... nor a descendant of the container
    {
        container.hide();
    }
});
