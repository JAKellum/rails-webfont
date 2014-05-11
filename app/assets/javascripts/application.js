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

$('.option').click(function(){
  var index = ($(this).data('index'));
  var pair_to_show = $('.pair')[index]
  var headline = $(this).data('headline');
  $('.pair').hide();
  $(pair_to_show).show();
  $('#headline').css('font-family', function(headline){
    return headline;
  });
  $('#body').css('font-family', $(this).data('body'));
});

function changeStyle(index){

}


$('li.button.playful').click(function(){
  if(!$(this).hasClass('current')){
    $('li.button.serious').toggleClass('current');
    $('input[name=playful]').val(1);
    $(this).toggleClass('current');
  }
});

$('li.button.serious').click(function(){
  if(!$(this).hasClass('current')){
    $('li.button.playful').toggleClass('current');
    $('input[name=playful]').val(0);
    $(this).toggleClass('current');
  }
});

$('li.button.light').click(function(){
  if(!$(this).hasClass('current')){
    $('li.button.dramatic').toggleClass('current');
    $('input[name=light]').val(1);
    $(this).toggleClass('current');
  }
});

$('li.button.dramatic').click(function(){
  if(!$(this).hasClass('current')){
    $('li.button.light').toggleClass('current');
    $('input[name=light]').val(0);
    $(this).toggleClass('current');
  }
});

$('li.button.modern').click(function(){
  if(!$(this).hasClass('current')){
    $('li.button.classical').toggleClass('current');
    $('input[name=modern]').val(1);
    $(this).toggleClass('current');
  }
});
$('li.button.classical').click(function(){
  if(!$(this).hasClass('current')){
    $('li.button.modern').toggleClass('current');
    $('input[name=modern]').val(0);
    $(this).toggleClass('current');
  }
});


$('li.button.radius')
// $(function() {
//   $('li.button.radius').click(function(){
//     var newCurrent = $(this),
//         headlines = $('.h-result'),
//         bodies = $('.b-result');

//     $('li.current').removeClass('current');
//     newCurrent.addClass('current');
//     headlines.css('font-family', newCurrent.attr('data-headline_font'));
//     bodies.css('font-family', newCurrent.attr('data-body_font'));
//     headlines.last().html(newCurrent.attr('data-headline_font'));
//     bodies.last().html(newCurrent.attr('data-body_font'));
//     $('#pair_id').val(newCurrent.attr('data-pair_id'));
//   })
// });

