/*!
 *   shadowOn jQuery plugin
 *   Written by David Hansson 2010
 *   http://shadowon.codeplex.com/
 *
 *   Copyright 2010, MIT License
 *   http://shadowon.codeplex.com/license
 *	 This copyright header must be kept intact!
 *
 *   Based on "Javascript Drop Shadows" written by James Player 2009
 *   http://www.springload.co.nz/love-the-web/javascript-drop-shadoww
 */

(function ($) {
	$.fn.shadowOn = function (options) {
		var opts = $.extend({}, $.fn.shadowOn.defaults, options);

		$(this).each(function () {
			if (!/^(?:a|button|div|dl|fieldset|form|h1|h2|h3|h4|h5|h6|hr|iframe|img|input|ol|select|span|table|textarea|ul)$/i.test(this.tagName)) {
				return;
			}
			var imagepath = opts.imagepath;
			var imageset = opts.imageset;
			var autoresize = opts.autoresize;
			var resizetimer = opts.resizetimer;
			var wrapelement = this.tagName == 'DIV' ? false : true;
			var boxWidth = $(this).outerWidth();
			var boxHeight = $(this).outerHeight();
			var okWidth = boxWidth > 22;
			var okHeight = boxHeight > 21;
			var guid = jQuery.Guid.New();
			var zIndex = $(this).css("zIndex");
			var offset = $(this).offset();
			var position = $(this).css("position");
			if (position.length < 8) position = 'relative';
			zIndex = zIndex == 'auto' ? -1 : (parseInt(zIndex) - 10);

			var workdiv = $(this);
			if (wrapelement) {
				if ($(this).hasClass("shadowOnWrapper")) {
					$("#" + $(this).attr("rel")).remove();
					$(this).removeClass("shadowOnWrapper");
				}
				$(this).attr("rel", guid).addClass("shadowOnWrapper").css("position", position);
				workdiv = $("<div></div>").attr("id", guid).css({ 'position': 'absolute', 'top': offset.top + 'px', 'left': offset.left + 'px', 'width': boxWidth + 'px', 'height': boxHeight + 'px', 'zIndex': zIndex });
			} else {
				$(workdiv).addClass("shadowOn").css("position", position).children("div.shadowOnBit").remove().end();
			}

			$(workdiv).append('<div class="shadowOnBit" style="background:url(' + imagepath + '/set' + imageset + '/tl.png) no-repeat;width:25px;height:25px;position:absolute;top:-10px;left:-12px;margin:0;padding:0;z-index:' + zIndex + '"></div>')
                      .append('<div class="shadowOnBit" style="background:url(' + imagepath + '/set' + imageset + '/tr.png) no-repeat;width:25px;height:25px;position:absolute;top:-10px;left:' + (boxWidth - 9) + 'px;margin:0;padding:0;z-index:' + zIndex + '"></div>')
                      .append('<div class="shadowOnBit" style="background:url(' + imagepath + '/set' + imageset + '/br.png) no-repeat;width:25px;height:25px;position:absolute;top:' + (boxHeight - 6) + 'px;left:' + (boxWidth - 9) + 'px;margin:0;padding:0;z-index:' + zIndex + '"></div>')
                      .append('<div class="shadowOnBit" style="background:url(' + imagepath + '/set' + imageset + '/bl.png) no-repeat;width:25px;height:25px;position:absolute;top:' + (boxHeight - 6) + 'px;left:-12px;margin:0;padding:0;z-index:' + zIndex + '"></div>');

			if (okWidth) {
				$(workdiv).append('<div class="shadowOnBit" style="background:url(' + imagepath + '/set' + imageset + '/t.png) repeat-x;width:' + (boxWidth - 22) + 'px;height:10px;position:absolute;top:-10px;left:13px;margin:0;padding:0;z-index:' + zIndex + '"></div>')
                          .append('<div class="shadowOnBit" style="background:url(' + imagepath + '/set' + imageset + '/b.png) repeat-x;width:' + (boxWidth - 22) + 'px;height:19px;position:absolute;top:' + boxHeight + 'px;left:13px;margin:0;padding:0;z-index:' + zIndex + '"></div>');
			}
			if (okHeight) {
				$(workdiv).append('<div class="shadowOnBit" style="background:url(' + imagepath + '/set' + imageset + '/r.png) repeat-y;width:15px;height:' + (boxHeight - 21) + 'px;position:absolute;top:15px;left:' + (boxWidth) + 'px;margin:0;padding:0;z-index:' + zIndex + '"></div>')
                          .append('<div class="shadowOnBit" style="background:url(' + imagepath + '/set' + imageset + '/l.png) repeat-y;width:12px;height:' + (boxHeight - 21) + 'px;position:absolute;top:15px;left:-12px;margin:0;padding:0;z-index:' + zIndex + '"></div>');
			}

			if (wrapelement) {
				$("body").append(workdiv);
			}

			if (autoresize) {
				var el = $(this);
				jQuery.data(el, 'position', { top: offset.top, left: offset.left, width: boxWidth, height: boxHeight });
				$(el).doTimeout(guid, resizetimer, function () {
					var t = jQuery.data(el, 'position').top;
					var l = jQuery.data(el, 'position').left;
					var w = jQuery.data(el, 'position').width;
					var h = jQuery.data(el, 'position').height;
					var offset1 = $(el).offset();
					if (t != offset1.top || l != offset1.left || w != $(el).outerWidth() || h != $(el).outerHeight()) {
						jQuery.removeData(el);
						$(el).doTimeout(guid);
						$(el).shadowOff();
						$(el).shadowOn({ 'imagepath': imagepath, 'imageset': imageset, 'autoresize': autoresize, 'resizetimer': resizetimer });
						return false;
					}
					return true;
				});
			}
		});
	}

	$.fn.shadowOn.defaults = {
		imagepath: 'images',
		imageset: '4',
		autoresize: true,
		resizetimer: 250
	};

	$.fn.shadowOff = function () {
		return this.each(function (i, e) {
			if ($(e).hasClass("shadowOn")) {
				$(e).removeClass("shadowOn");
				$(e).children("div.shadowOnBit").remove();
			} else if ($(e).hasClass("shadowOnWrapper")) {
				var id = $(e).attr("rel");
				$("#" + id).remove();
				$(e).removeClass("shadowOnWrapper");
				$(e).removeAttr("rel");
			}
		});
	};
})(jQuery);