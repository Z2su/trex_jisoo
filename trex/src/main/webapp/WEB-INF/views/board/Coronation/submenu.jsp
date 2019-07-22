<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- leftmenu-->

<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/common.css"
   type="text/css" media="all">

<div id="leftwrap">
	<h2 id="leftTi"
		style="background:url(<%=request.getContextPath()%>/resources/images/sidemenu.jpg) 0 0 no-repeat">대관안내</h2>

	<!--LEFTMENU START-->

	<script type="text/javascript">
	<!--
		var old_menu = '';
		var old_cell = '';
		var old_Lmenu = '';

		function menuclick(submenu) {
			if (old_menu != submenu) {
				if (old_menu != '') {
					old_menu = 'none';
				}
				jQuery(".lm_2th > li > div").hide();
				if (old_menu != '') {
					jQuery("#" + old_Lmenu).parent().find(">a").removeClass(
							"link_2th_ov").addClass("link_2th");
				}
				jQuery("#" + submenu).parent().find(">a").removeClass(
						"link_2th").addClass("link_2th_ov");

				document.getElementById(submenu).style.display = 'block';
				old_menu = document.getElementById(submenu).style.display;
				old_Lmenu = submenu;
			} else {
				document.getElementById(submenu).style.display = 'none';
				old_menu = '';
			}
		}
	//-->
	</script>



	<ul class="lm_2th">

		<li><a href="<%=request.getContextPath()%>/board/Coronation/list"
			class="link_2th" onclick="menuclick('submenu1');return false;" onkeypress="">정기/수시대관 공고</a></li>
		<li><a href="<%=request.getContextPath()%>/board/Coronation/app/list"
			class="link_2th" onclick="menuclick('submenu2');return false;" onkeypress="">대관 신청</a></li>
		<li><a href="<%=request.getContextPath()%>/board/Coronation/list"
			class="link_2th" onclick="menuclick('submenu1');return false;" onkeypress="">대관 일정</a></li>
		<li><a href="<%=request.getContextPath()%>/board/Coronation/hall/list"
			class="link_2th" onclick="menuclick('submenu3');return false;" onkeypress="">대관 시설</a></li>

	</ul>

	<div class="clearfix"></div>
</div>

<!-- //leftmenu-->

<!-- 탭메뉴 및 좌측메뉴 펼침기능 시작 부분 -->
