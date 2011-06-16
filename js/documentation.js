
jQuery(document).ready(function () {
	bindFunctions();
});

function bindFunctions() {
	jQuery('.navexpander').click(function() {
		jQuery(this).addClass('navcontractor');
		jQuery(this).siblings('.navexpander').addClass('navcontractor');
		jQuery(this).removeClass('navexpander');
		jQuery(this).siblings('.navexpander').removeClass('navexpander');
		if(jQuery(this).is('img')) {
			jQuery(this).attr('src', minusImage);	
		} else {
			jQuery(this).siblings('img').attr('src', minusImage);	
		}
		jQuery(this).siblings('ul').show();
		
		bindFunctions();
	});
	
	jQuery('.navcontractor').click(function() {
		jQuery(this).addClass('navexpander');
		jQuery(this).siblings('.navcontractor').addClass('navexpander');
		jQuery(this).removeClass('navcontractor');
		jQuery(this).siblings('.navcontractor').removeClass('navcontractor');
		if(jQuery(this).is('img')) {
			jQuery(this).attr('src', plusImage);	
		} else {
			jQuery(this).siblings('img').attr('src', plusImage);	
		}
		jQuery(this).siblings('ul').hide();
		
		bindFunctions();
	});
}
