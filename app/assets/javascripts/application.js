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
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

$(function() {
  $('li.button.radius').click(function(){
    var newCurrent = $(this),
        headlines = $('.h-result'),
        bodies = $('.b-result');

    $('li.current').removeClass('current');
    newCurrent.addClass('current');

    headlines.css('font-family', newCurrent.attr('data-headline_font'));
    bodies.css('font-family', newCurrent.attr('data-body_font'));
    headlines.last().html(newCurrent.attr('data-headline_font'));
    bodies.last().html(newCurrent.attr('data-body_font'));
    $('#font_id').val(newCurrent.attr('data-font_id'));
  })
});

