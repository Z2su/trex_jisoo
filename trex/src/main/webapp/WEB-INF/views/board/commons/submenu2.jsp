<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="leftwrap">
	<h2 id="leftTi" style="background:url(<%=request.getContextPath()%>/resources/images/sidemenu.jpg) 0 0 no-repeat">${submenuTitle }</h2>


	<!-- 탭메뉴 및 좌측메뉴 펼침기능 시작 부분 -->
<script type="text/javascript">menuclick('submenu1');</script>
	
			<!--LEFTMENU START-->
			<ul class="lm_2th">
				
						
						<c:forEach items="${submenuList }" var="submenu" varStatus="status">
						
						
						<li><a href="/html/kr/together/together_0301.html"
						class="link_2th" onclick="menuclick('submenu${status.count}');return false;"
						onkeypress="">${submenu[0] }</a>
						<div id="submenu${status.count}" style="display: none; cursor: hand;">
							<ul class="lm_3th">
								<li><a href="${submenu[1]}"
									class="link_3th">- 회원안내</a></li>
								<li><a
									href="/_prog/_board/?code=paying_notice&amp;site_dvs_cd=kr&amp;menu_dvs_cd=030103&amp;site_dvs_cd=kr&amp;menu_dvs_cd=030103&amp;site_dvs_cd=kr&amp;menu_dvs_cd=030103"
									class="link_3th">- 회원소식</a></li>
								<li><a href="/html/kr/together/together_030102.html"
									class="link_3th">- Artner</a></li>
							</ul>
						</div>
						</li>

							
						</c:forEach>
		
						
					
				</ul>
	
	
	

	<div class="clearfix"></div>
</div>
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
								jQuery("#" + old_Lmenu).parent().find(">a")
										.removeClass("link_2th_ov").addClass(
												"link_2th");
							}
							jQuery("#" + submenu).parent().find(">a")
									.removeClass("link_2th").addClass(
											"link_2th_ov");

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

<!-- //leftmenu-->

<!-- 탭메뉴 및 좌측메뉴 펼침기능 시작 부분 -->
