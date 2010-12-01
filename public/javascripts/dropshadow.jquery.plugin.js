/**
 * Drop Shadow Plugin jQuery
 * http://sarfraznawaz.wordpress.com/
 * Author: Sarfraz Ahmed (sarfraznawaz2005@gmail.com)
 */

(function($){

    $.fn.dropshadow = function(settings){
        // Extend default settings
        var opts = $.extend({}, $.fn.dropshadow.defaults, settings);

        return this.each(function(settings){
           var options = $.extend({}, opts, $(this).data());
           var $this = $(this);

		  $('<div>').appendTo($('body')).css({
			position: 'absolute',
			width: $this.width() + 'px',
			height: $this.height() + 'px',
			backgroundColor: options.shadowColor,
			zIndex: options.shadowLayer,
			top: ($this.offset().top + parseInt(options.distance, 10)) + 'px',
			left: ($this.offset().left + parseInt(options.distance, 10)) + 'px'
		  });
        });
    }

   // set default option values
  $.fn.dropshadow.defaults = {
	shadowColor: '#DFDFDF',
	shadowLayer: -1,
	distance:'5px'
  }

})(jQuery);
