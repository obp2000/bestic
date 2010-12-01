/*
 * jQuery kradio plugin
 * Version 1.0
 * @tested with 1.4.2
 *
 * 
 * Copyright (c) 2010 Keta
 * GPL licensed:
 * http://www.gnu.org/licenses/gpl.html
 *
 *
 * HOW TO USE
 * ----------
 * 1. Put all the radio buttons you want modified inside a <div> 
 *    with class 'kradio'. (ie. <div class='kradio'> ... </div>'
 *
 * 2. Your radio input's "alt" text will be the text displayed. So give it/them one.
 *    (ie. <div class='kradio'> <input type='radio' alt="Coconut" /> </div>

 * 3. You're done. Feel free to modify the CSS to your likes.
 *
 */


(function($) {
 	
	jQuery.fn.kradio = function() {
		
		// for each radion button inside kradio..
		$('.kradio input:radio').each(function() {

			// Grab the original radio button's attributes
			alt = $(this).attr('alt');
			id = $(this).attr('id');
			name = $(this).attr('name');
			value = $(this).attr('value');
			class = $(this).attr('class');
			checked = $(this).attr('checked')

			// Hide original radio button
			$(this).css('display', 'none');
			
			// Create div with new radio button and add the 
			// attributes from the original
			div = "\
			<div class='kradio-unselected'>\
			<input type='radio'\
			name='" + name + "'\
			id='" + id + "'\
			value='" + value + "'\
			class='" + class + "'>\
			" + alt + "</div>";
			
			// Append new radio button & div
			$('.kradio').append(div);
			
			// Hide the new radio buttons as well (just the button, not the div!)
			$('.kradio-unselected input:radio').css('visibility', 'hidden');
			
			// if 'checked' is true, check this radio button
			if( checked == true ) {
				// add attr to last kradio-unselected
				$('.kradio-unselected input:radio:last').attr('checked', 'checked')
				$('.kradio-unselected:last').addClass('kradio-selected')
			}
			
		});
		
		$('.kradio-unselected').click(function() {
			// Remove 'kradio-selected' class from all divs
			// So if a div/radio is selected, this will de-select it.
			$('.kradio-unselected').removeClass('kradio-selected');
			
			// Add 'selected' class to clicked div
			$(this).addClass('kradio-selected');
			
			// And add the 'checked' attribute since it was just clicked
			$(this).children().attr('checked', 'checked');
		})
		
		return this;
	};

 
})(jQuery);
