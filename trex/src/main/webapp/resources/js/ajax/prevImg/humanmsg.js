/*
	HUMANIZED MESSAGES 1.0
	idea - http://www.humanized.com/weblog/2006/09/11/monolog_boxes_and_transparent_messages
	home - http://humanmsg.googlecode.com
*/

var humanMsg = {
	setup: function(appendTo, logName, msgOpacity) {
		humanMsg.msgID = 'humanMsg';

		// appendTo is the element the msg is appended to
		if (appendTo == undefined)
			appendTo = 'body';

		// The text on the Log tab
		if (logName == undefined)
			logName = 'Message Log';

		// Opacity of the message
		humanMsg.msgOpacity = 1;

		if (msgOpacity != undefined) 
			humanMsg.msgOpacity = parseFloat(msgOpacity);

		// Inject the message structure
		jQuery(appendTo).append('<table id="'+humanMsg.msgID+'" class="humanMsg" border="0" cellpadding="0" cellspacing="0"> \
          <tbody> \
            <tr> \
              <td class="tl"/><td class="b"/><td class="tr"/> \
            </tr> \
            <tr> \
              <td class="b"/> \
              <td class="body" style="background:#000"> \
                <div class="content" style="color:#fff;font-weight:bold"> \
					<p></p> \
				이미지 미리보기 \
                </div> \
                <div class="footer"> \
                </div> \
              </td> \
              <td class="b"/> \
            </tr> \
            <tr> \
              <td class="bl"/><td class="b"/><td class="br"/> \
            </tr> \
          </tbody> \
        </table>')
		
	},

	displayMsg: function(msg) {
		if (msg == '')
			return;

		clearTimeout(humanMsg.t2);

		// Inject message
		jQuery('#'+humanMsg.msgID+' p').html(msg)
	
		// Show message
		jQuery('#'+humanMsg.msgID+'').show().animate({ opacity: humanMsg.msgOpacity}, 200, function() {
		
			
		})

		// Watch for mouse & keyboard in .5s
		humanMsg.t1 = setTimeout("humanMsg.bindEvents()", 700)
		// Remove message after 5s
		humanMsg.t2 = setTimeout("humanMsg.removeMsg()", 1500)
	},

	bindEvents: function() {
	// Remove message if mouse is moved or key is pressed
		jQuery(window)
			.mousemove(humanMsg.removeMsg)
			.click(humanMsg.removeMsg)
			.keypress(humanMsg.removeMsg)
	},

	removeMsg: function() {
		// Unbind mouse & keyboard
		jQuery(window)
			.unbind('mousemove', humanMsg.removeMsg)
			.unbind('click', humanMsg.removeMsg)
			.unbind('keypress', humanMsg.removeMsg)

		// If message is fully transparent, fade it out
		if (jQuery('#'+humanMsg.msgID).css('opacity') == humanMsg.msgOpacity)
			jQuery('#'+humanMsg.msgID).animate({ opacity: 0 }, 500, function() { jQuery(this).hide() })
	}
};

jQuery(document).ready(function(){
	humanMsg.setup();
})

jQuery(document).ready(function() {
	jQuery('input.prev').bind('change',function() {
		var src = this.value;

		var viewImg = document.createElement('div');
		viewImg.style.width = '200px';
		viewImg.style.height = '300px';
		viewImg.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + src + "',sizingMethod=scale)";
		
		if (navigator.appName.charAt(0) == 'M') {
			humanMsg.displayMsg(viewImg);
		}
		
		return false;
	})

})