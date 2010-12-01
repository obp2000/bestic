/* ------------------------------------------------------------------------
	mfsNiceControls
	
	Developped By: Subhranil Dalal 
	Email Id: subranild@mindfiresolutions.com
	URL : http://www.mindfiresolutions.com/
	Inspired By: All heavy weight, less themes and non user friendly
				custom input elements.
	Version: 1.1
	
	Copyright: Feel free to redistribute the script/modify it, as
			   long as you leave my infos at the top.
			   
	Dual licensed under the MIT and GPL licenses:
	http://www.opensource.org/licenses/mit-license.php
	http://www.gnu.org/licenses/gpl.html
------------------------------------------------------------------------- */
jQuery.fn.mfsNiceControls = function(settings){ 
	settings = jQuery.extend({
					theme : 'default'
				}, settings);
	
	$(this).each(function(){
		$elm = $(this);
		$elm_id = $elm.attr('id');
		$elm.css('display','none');
		if($elm.is('[type=checkbox]')){
			if($elm.is(':checked')){
				$elm.after('<img src="images/'+settings.theme+'/checkbox_checked.gif" class="checkbox_checked" rel="'+$elm_id+'">');
			} else {
				$elm.after('<img src="images/'+settings.theme+'/checkbox_unchecked.gif" class="checkbox_unchecked" rel="'+$elm_id+'">');
			}
		}
		if($elm.is('[type=radio]')){
			if($elm.is(':checked')){
				$elm.after('<img src="images/'+settings.theme+'/radio_checked.gif" class="radio_checked" rel="'+$elm_id+'">');
			} else {
				$elm.after('<img src="images/'+settings.theme+'/radio_unchecked.gif" class="radio_unchecked" rel="'+$elm_id+'">');
			}
		}
		
	});
	$('.checkbox_checked,.checkbox_unchecked').bind('click',function(){
		$elm = $(this);
		var rel = $elm.attr('rel');
		if($('#'+rel).is(':checked')){
			$('#'+rel).removeAttr('checked');
			$elm.attr('src','images/'+settings.theme+'/checkbox_unchecked.gif').removeClass('checkbox_checked').addClass('checkbox_unchecked');
			
		} else {
			$('#'+rel).attr('checked','checked');
			$elm.attr('src','images/'+settings.theme+'/checkbox_checked.gif').removeClass('checkbox_unchecked').addClass('checkbox_checked');
		}	
	});
	$('.radio_checked,.radio_unchecked').bind('click',function(){
		$elm = $(this);
		var rel = $elm.attr('rel');
		var name = $('#'+rel).attr('name');
		$('input[name='+name+']').each(function(){$(this).removeAttr('checked');
		$(this).next('img').attr('src','images/'+settings.theme+'/radio_unchecked.gif').removeClass('radio_checked').addClass('radio_unchecked');
		});
		$elm.attr('src','images/'+settings.theme+'/radio_checked.gif').removeClass('radio_unchecked').addClass('radio_checked');
		$('#'+rel).attr('checked','checked');
		
	});
	
	
}; 