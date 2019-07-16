<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	

<div id="contentswrap">

	<!-- subvisual -->
	<div id="subvisual">
		<div class="subv_performance">
			<div class="subv_pat">
				<p>
					<strong><img
						src="/resources/images/ma_service_type.png"
						alt="Daejeon Arts Center"></strong> 문화로 시민을 행복하게! 대전예술의전당
				</p>
			</div>
		</div>
	</div>
	<!-- //subvisual -->

	<!-- navigation -->
	<div id="navigation">
		<div class="naviwrap">
			<a href="/html/kr/" class="nv_home">HOME</a>&gt;
			<navi> <a
				href="<%=request.getContextPath()%>/board/board/prlist">게시판</a>&gt;<a
				href="/html/kr/performance/performance_010101.html">홍보게시판</a>
			<div class="nv_service">
				<a class="nvs_print" href="#total"
					onclick="printContent('/html/kr/performance/performance_010101.html?mode=V&amp;code=2946');return false"><span
					class="hide">Print</span></a>

			</div>
		</div>
	</div>
	<!-- //navigation -->

	<!-- container -->
	<div id="container">
		<%@ include file="/WEB-INF/views/board/commons/submenu.jsp"%>


		<!-- content-->
		<div id="content">
			<!-- 컨텐츠 타이틀 -->
			<h3 class="cnt_ti">홍보 리스트</h3>

			<!--  내용은 여기에 !!!!  -->

			

		</div>
	</div>
	<!-- //container -->
</div>