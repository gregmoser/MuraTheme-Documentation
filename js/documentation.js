
jQuery(document).ready(function () {
	
	jQuery('div.leftNav img').click(function() {
		if(jQuery(this).hasClass('navexpander')) {
			jQuery(this).removeClass('navexpander');
			jQuery(this).addClass('navcontractor');
			jQuery(this).siblings('a').removeClass('navexpander');
			jQuery(this).siblings('a').addClass('navcontractor');
			jQuery(this).attr('src', minusImage);
			jQuery(this).siblings('ul').show();
		} else if(jQuery(this).hasClass('navcontractor')) {
			jQuery(this).removeClass('navcontractor');
			jQuery(this).addClass('navexpander');
			jQuery(this).siblings('a').removeClass('navcontractor');
			jQuery(this).siblings('a').addClass('navexpander');
			jQuery(this).attr('src', plusImage);
			jQuery(this).siblings('ul').hide();
		}
	});
	
	jQuery('div.leftNav a').click(function() {
		if(jQuery(this).hasClass('navexpander')) {
			jQuery(this).removeClass('navexpander');
			jQuery(this).addClass('navcontractor');
			jQuery(this).siblings('img').removeClass('navexpander');
			jQuery(this).siblings('img').addClass('navcontractor');
			jQuery(this).siblings('img').attr('src', minusImage);
			jQuery(this).siblings('ul').show();
		}
	});
});