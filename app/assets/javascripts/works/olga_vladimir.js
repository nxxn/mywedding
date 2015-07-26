$(document).ready(function() {

  $('.submit_wish').click(function() {
    $(this).parent().hide();
    $(this).parent().parent().addClass("checked_wish");
  });

  $('#rsvp_answer_form').on('submit', function() {
		$('#call_me_back_modal').modal('show');
	});

	$("#rsvp_answer_form").bind("ajax:complete", function(event,xhr,status) {
  	$('#rsvp_answer_form').trigger("reset");
	});

});
