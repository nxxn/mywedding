$(document).ready(function() {
  // browser window scroll (in pixels) after which the "back to top" link is shown
	var offset = 300,
	contacts_offset = 0,
	//browser window scroll (in pixels) after which the "back to top" link opacity is reduced
	offset_opacity = 1200,
	//duration of the top scrolling animation (in ms)
	scroll_top_duration = 700,
	//grab the "back to top" link
	$back_to_top = $('.cd-top');
	$to_contacts = $('.cd-top-envelope');

	//hide or show the "back to top" link
	$(window).scroll(function(){
		( $(this).scrollTop() > offset ) ? $back_to_top.addClass('cd-is-visible') : $back_to_top.removeClass('cd-is-visible cd-fade-out');
		( $(this).scrollTop() > contacts_offset ) ? $to_contacts.addClass('cd-is-visible') : $to_contacts.removeClass('cd-is-visible cd-fade-out');
		// if( $(this).scrollTop() > offset_opacity ) {
		// 	$back_to_top.addClass('cd-fade-out');
		// }
	});

	//smooth scroll to top
	$back_to_top.on('click', function(event){
		event.preventDefault();
		$('body,html').animate({
			scrollTop: 0 ,
		 	}, scroll_top_duration
		);
	});

	//smooth scroll to contacts
	$to_contacts.on('click', function(event){
		event.preventDefault();
		$('html, body').animate({
      scrollTop: $("#section-contact").offset().top
    	}, scroll_top_duration
		);
	});

	$('#new_message').on('submit', function() {
		$('#call_me_back_modal').modal('show');
	});

	$("#new_message").bind("ajax:complete", function(event,xhr,status) {
  	$('#new_message').trigger("reset");
	});

	// Modals validation

  // $('#new_message').formValidation({
  //   framework: 'bootstrap',
  //   locale: 'ru_RU',
  //   excluded: [':disabled'],
  //   icon: {
  //     valid: 'glyphicon glyphicon-ok',
  //     invalid: 'glyphicon glyphicon-remove',
  //     validating: 'glyphicon glyphicon-refresh'
  //   },
  //   fields: {
  //     email: {
  //       validators: {
  //         notEmpty: {
  //           message: 'Представьтесь, пожалуйста'
  //         }
  //       }
  //     },
  //     username: {
  //       validators: {
  //         notEmpty: {
  //           message: 'Укажите номер, на который перезвонить'
  //         }
  //       }
  //     }
	// 		message: {
  //       validators: {
  //         notEmpty: {
  //           message: 'Укажите номер, на который перезвонить'
  //         }
  //       }
  //     }
  //   }
  // });

});
