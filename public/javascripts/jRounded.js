/*
 * jRounded 1.0 - jQuery rounded corners plugin
 *
 * Copyright (c) 2009 jQuery Howto
 *
 * Licensed under the GPL license:
 *   http://www.gnu.org/licenses/gpl.html
 *
 * URL:
 *   http://jquery-howto.blogspot.com
 *
 * Author URL:
 *   http://me.boo.uz
 *
 */
(function($){ 
  $.fn.extend({ 
    box: function() { 
      return $(this).each(function(){
		$(this).wrap('<div class="box"><div></div><div class="tl"></div><div class="tr"></div><div class="bl"></div><div class="br"></div></div>');
      });
    }
  })
})(jQuery);