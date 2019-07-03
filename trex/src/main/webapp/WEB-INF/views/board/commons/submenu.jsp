<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="leftwrap">
	<h2 id="leftTi"
		style="background:url(<%=request.getContextPath()%>/resources/images/sidemenu.jpg) 0 0 no-repeat">${submenuTitle }</h2>

	<!--LEFTMENU START-->




	<ul class="lm_2th">
	<c:forEach items="${submenuList }" var="submenu" varStatus="status">

		<li><a href="${submenu[1]}"
			class="link_2th" onclick="menuclick('submenu${status.count}');return false;"
			onkeypress="">${submenu[0] }</a>
			
			</li>
	</c:forEach>
		

	</ul>
	
	

	<div class="clearfix"></div>
</div>


<!-- //leftmenu-->

<!-- 탭메뉴 및 좌측메뉴 펼침기능 시작 부분 -->
