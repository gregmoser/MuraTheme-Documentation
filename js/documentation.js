
jQuery(document).ready(function () {
	bindFunctions();
});

function bindFunctions() {
	jQuery('img.navexpander').click(function() {
		jQuery(this).removeClass('navexpander');
		jQuery(this).addClass('navcontractor');
		jQuery(this).attr('src', minusImage);
		jQuery(this).siblings('ul').show();
		bindFunctions();
	});
	
	jQuery('img.navcontractor').click(function() {
		jQuery(this).removeClass('navcontractor');
		jQuery(this).addClass('navexpander');
		jQuery(this).attr('src', plusImage);
		jQuery(this).siblings('ul').hide();
		bindFunctions();
	});
}
