;(function($){
	$.bltCheckboxSettings = {
		restricted: false,
		checkedClass: 'checked',
		onChecked: function(data){},
		onUnchecked: function(data){},
		onChange: function(data){}
	};

	$.fn.bltCheckbox = function(options){
		var settings = $.extend({},$.bltCheckboxSettings,options || {});
		var thisClone = this;
		var numChecked = 0;
		return this.each(function(){
			$('input',this).attr(settings.checkedClass,false);
			$(this).click(function(){
				if($(this).hasClass(settings.checkedClass)){
					$(this).removeClass(settings.checkedClass);
					$('input',this).attr(settings.checkedClass,false);
					if(numChecked>0) numChecked--;
					var callbackData = new Object();
					callbackData.unCheckedItem = $('input',this).attr("id");
					settings.onUnchecked(callbackData);
				} else {
					if(settings.restricted===true){
						thisClone.each(function(){
							if($(this).hasClass(settings.checkedClass)) {
								$(this).removeClass(settings.checkedClass);
								if(numChecked>0) numChecked--;
								var callbackData = new Object();
								callbackData.changedItem = $('input',this).attr("id");
								settings.onChange(callbackData);
							}					
						});
					}
					$(this).addClass(settings.checkedClass);
					$('input',this).attr(settings.checkedClass,true);
					numChecked++;
					var callbackData = new Object();
					callbackData.checkedItem = $('input',this).attr("id");
					settings.onChecked(callbackData);
				}
			});
		});
	};
})(jQuery)