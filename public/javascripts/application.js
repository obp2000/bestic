// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
		var icons = {
			header: "ui-icon-circle-triangle-e",
			headerSelected: "ui-icon-circle-triangle-s"
		};
		$("#left_accordion").accordion({ icons: icons, fillSpace: false, autoHeight: false, navigation: false, animated: 'bounceslide', active: 2 });
				
		$("#accordionResizer").resizable({
			resize: function() { $("#categories").accordion("resize"); }

		});
	
//		$("button").button({ icons: {primary:'ui-icon-gear',secondary:'ui-icon-triangle-1-s'} });
		hide_error_titles();
		attach_js();
		
	});


function attach_js() {
	attach_yoxview();
	attach_shadowOn();
}

function attach_yoxview() {
	$(".yoxview").yoxview({ lang: "ru", backgroundColor: "#FFF9E5", backgroundOpacity: 0.6, controlsInitialFadeTime: 100,
	controlsInitialDisplayTime: 100, titleDisplayDuration: 100 });
}

function attach_mColorPicker() {
	mColorPicker.main();
}

function attach_shadowOn() {
	$("#accordionResizer, .catalog_item, #categories, #seasons, #sizes, #colours, #photos, #edit_contacts > #contacts, #notice").shadowOn({ imageset: '29' });
}

function attach_jniceit() {
/*
	$('#form').NiceIt();
	$('form').bltCheckbox({restricted:true});
*/

}

function attach_jRounded() {
/*
	$('.item').corners( { radio: 5, borderSize: 1 } );
*/
}


function show_order() {
	$('#content').fadeIn(0.5);
}

function hide_error_titles() {
	$('#errorExplanation h2, #errorExplanation p').hide();
}
