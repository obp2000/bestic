(function($) {

	$.fn.gcorners = function(options) {
		// Default settings
		settings = $.extend({}, {
			width: 10,
			height: 10,
			color: '000000'
		}, options);

		try {
			// Get the element ID
			var elID = $(this).attr("id");
			// If there is no id attribute then stop here
			if(elID == '' || elID == undefined) return false;
			
			// Set the new HTML and  include the current HTML
			var beforeHTML = "<div id='"+ elID +"-top'>";
			beforeHTML += "<div class='gctr'></div>";
			beforeHTML += "<div class='gctl'></div>";
			beforeHTML += "<div class='gctm'></div></div>";
			$(this).before(beforeHTML);
			var afterHTML = "<div id='"+ elID +"-bot'>";
			afterHTML += "<div class='gcbr'></div>";
			afterHTML += "<div class='gcbl'></div>";
			afterHTML += "<div class='gcbm'></div></div>";
			$(this).after(afterHTML);
			
			// Add some styling in the head
			var styleStr = "<style type=\"text/css\">";
			styleStr += "#" + elID + "-top { height:100%; }";
			styleStr += "#" + elID + "-top .gctl { float:left; background:transparent url(curved.php?w="+ (settings.width * 2) +"&h="+ (settings.height * 2) +"&c="+ settings.color +") no-repeat; width:"+ settings.width +"px; height:"+ settings.height +"px; }";
			styleStr += "#" + elID + "-top .gctr { float:right; background:transparent url(curved.php?w="+ (settings.width * 2) +"&h="+ (settings.height * 2) +"&c="+ settings.color +") no-repeat -"+ settings.width +"px 0px; width:"+ settings.width +"px; height:"+ settings.height +"px; }";
			styleStr += "#" + elID + "-top .gctm { background:#"+ settings.color +"; height:"+ settings.height +"px; margin-left:"+ settings.width +"px; margin-right:"+ settings.width +"px; }";
			styleStr += "#" + elID + "-bot { height:100%; }";
			styleStr += "#" + elID + "-bot .gcbl { float:left; background:transparent url(curved.php?w="+ (settings.width * 2) +"&h="+ (settings.height * 2) +"&c="+ settings.color +") no-repeat 0px -"+ settings.height +"px; width:"+ settings.width +"px; height:"+ settings.height +"px; }";
			styleStr += "#" + elID + "-bot .gcbr { float:right; background:transparent url(curved.php?w="+ (settings.width * 2) +"&h="+ (settings.height * 2) +"&c="+ settings.color +") no-repeat -"+ settings.width +"px -"+ settings.height +"px; width:"+ settings.width +"px; height:"+ settings.height +"px; }";
			styleStr += "#" + elID + "-bot .gcbm { background:#"+ settings.color +"; height:"+ settings.height +"px; margin-left:"+ settings.width +"px; margin-right:"+ settings.width +"px; }";
			styleStr += "</style>";
			$('head').append(styleStr);
			
		} catch(exception){
			return false;
		}
		
		// Returns the jQuery object to allow for chainability.  
		return this;
	};

})(jQuery);
