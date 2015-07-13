$(document).ready(function() {

  $('.submit_wish').click(function() {
    $(this).parent().hide();
    $(this).parent().parent().addClass("checked_wish");
  });

});
