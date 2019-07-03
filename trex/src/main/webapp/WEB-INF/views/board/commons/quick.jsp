<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="decorator"
   uri="http://www.opensymphony.com/sitemesh/decorator"%>
<div id="divMenu" style="top: 0px; visibility: visible;">
	<h2>QUICK</h2>
	<ul>
		<li class="qm1"><a href="/html/kr/festival/2018_grand.html">페스티벌</a></li>
		<li class="qm2"><a
			href="/html/kr/customer/customer_04020101.html">회원안내</a></li>
		<li class="qm3"><a href="/html/kr/customer/customer_040301.html">오시는길</a></li>
		<li class="qm4"><a href="/html/kr/intro/intro_050601.html">후원안내</a></li>
		<li class="qm5"><a href="http://cyber.djac.or.kr/"
			target="_blank">사이버투어</a></li>
	</ul>
	<a class="qtop" href="#total">TOP</a>
</div>

<script type="text/javascript">
	var menu_list = jQuery("#divMenu >ul > li.image_rot");
	var img_rot = jQuery("#divMenu >ul > li").eq(1);
	menu_list.bind("mouseover", qm_rot);

	function qm_rot() {
		var img_idx = menu_list.index(jQuery(this));
		img_rot.find(">a>img").attr("src",
				"/images/kr/common/qm_rot0" + (img_idx + 1) + ".gif");
	}

	var slidemenu_X = 0; //상단 제한 값
	var slidemenu_Y = 500; //하단 제한 값
</script>
<script type="text/javascript">
	// slide menu  2006-06-14
	var isDOM = (document.getElementById ? true : false);
	var isIE4 = ((document.all && !isDOM) ? true : false);
	var isNS4 = (document.layers ? true : false);
	var isNS = navigator.appName == "Netscape";

	function getRef(id) {
		if (isDOM)
			return document.getElementById(id);
		if (isIE4)
			return document.all[id];
		if (isNS4)
			return document.layers[id];
	}

	function getSty(id) {
		x = getRef(id);
		return (isNS4 ? getRef(id) : getRef(id).style);
	}

	function moveRightEdge() {
		var yMenuFrom, yMenuTo, yOffset, timeoutNextCheck;

		if (isNS4) {
			yMenuFrom = document.getElementById('divMenu').style.top;
			yMenuTo = windows.pageYOffset + slidemenu_X; // 위쪽 위치
		} else if (isDOM) {
			yMenuFrom = parseInt(document.getElementById('divMenu').style.top,
					10);
			yMenuTo = (isNS ? window.pageYOffset
					: document.documentElement.scrollTop)
					+ slidemenu_X; // 위쪽 위치
		}
		timeoutNextCheck = 30;

		divMenu_H = document.getElementById('divMenu');
		limit_H = (parseInt(document.documentElement.scrollHeight) - slidemenu_Y)
				- parseInt(divMenu_H.offsetHeight);
		divMenu_t = parseInt(document.getElementById('divMenu').style.top);
		if (yMenuFrom != yMenuTo) {
			yOffset = Math.ceil(Math.abs(yMenuTo - yMenuFrom) / 20);
			if (yMenuTo < yMenuFrom) {
				yOffset = -yOffset;
			}
			if (isNS4) {
				if (yOffset > 0) {
					if (divMenu_t < limit_H) {
						document.getElementById('divMenu').style.top += yOffset
								+ "px";
					}
				} else {
					document.getElementById('divMenu').style.top += yOffset
							+ "px";
				}

			} else if (isDOM) {
				if (yOffset > 0) {
					if (divMenu_t < limit_H) {
						document.getElementById('divMenu').style.top = parseInt(document
								.getElementById('divMenu').style.top)
								+ yOffset + "px";
					}
				} else {
					document.getElementById('divMenu').style.top = parseInt(document
							.getElementById('divMenu').style.top)
							+ yOffset + "px";
				}
			}
			timeoutNextCheck = 10;
		}

		setTimeout("moveRightEdge()", timeoutNextCheck);
	}

	if (isNS4) {
		var divMenu = document["divMenu"];
		document.getElementById('divMenu').style.top = slidemenu_X + "px";
		document.getElementById('divMenu').style.visibility = "visible";
		moveRightEdge();
	} else if (isDOM) {
		var divMenu = getRef('divMenu');
		document.getElementById('divMenu').style.top = slidemenu_X + "px";
		document.getElementById('divMenu').style.visibility = "visible";
		moveRightEdge();
	}
</script>