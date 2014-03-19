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
/*function toggleCurrent(button) {
  $(button).toggleClass('current');
}*/
$(function() {
  $('li.button.radius').click(function(){
    $('.current').removeClass('current');
    $(this).toggleClass('current');
  })
});

$(function() {
  $('li.button.radius').click(function() {
    var current = $('.current');
    $("[id*='alphabet']").hide();
    current.removeClass('current');
    $(this).toggleClass('current');
    $('#alphabet' + current[0].innerHTML).show();
  });
});


/*
  $(function() {
  var urlParams = $(location).attr('href').match(/(casual|formal)|\W\d(\W|$)/g);
  var replaceContent = function() {
    $.ajax({
      type: 'GET',
      url: 'alphabet' + "?category=" + urlParams[0] + "&slider1=" + urlParams[1].match(/\d/) + "&slider2=" + urlParams[2].match(/\d/) + "&slider3=" + urlParams[3].match(/\d/),
      //url: 'alphabet' + "?category=" + urlParams[0] + "&slider1=" + (parseInt(urlParams[1].match(/\d/)) + 1) + "&slider2=" + (parseInt(urlParams[2].match(/\d/)) + 2) + "&slider3=" + (parseInt(urlParams[3].match(/\d/)) + 2),
      dataType: 'html',
      success : function(data) {
        var alpha = $(data).find('#alphabet').children();
        $('#alphabet').html(alpha);
      }
    });
  };

  $('li.button.radius').click(function(){
    $('.current').removeClass('current');
    $(this).toggleClass('current');
    $('#alphabet').html(replaceContent);
  });
});
*/

