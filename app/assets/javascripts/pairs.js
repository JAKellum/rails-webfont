// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

/*$('#1').bind("slider:changed", function (event, data) {
  alert(data.value);
});*/
function bind_sliders() {
  $('#slider1').bind("slider:changed", function( event, data ) {
    $('#a1').val(data.value);
  });
  $('#slider2').bind("slider:changed", function( event, data ) {
    $('#a2').val(data.value);
  });
  $('#slider3').bind("slider:changed", function( event, data ) {
    $('#a3').val(data.value);
  });
};

$('li.button.playful').click(function(){
  if(!$(this).hasClass('current')){
    $(this).toggleClass('current');
  }
});

$('li.button.serious').click(function(){
  if(!$(this).hasClass('current')){
    $(this).toggleClass('current');
  }
});
