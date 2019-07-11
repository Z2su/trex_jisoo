<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div id="contentswrap">

	<!-- subvisual -->
	<div id="subvisual">
		<div class="subv_performance">
			<div class="subv_pat">
				<p>
					<strong><img
						src="/images/kr/common_2015/ma_service_type.png"
						alt="Daejeon Arts Center"></strong> 문화로 시민을 행복하게! 대전예술의전당
				</p>
			</div>
		</div>
	</div>
	<!-- //subvisual -->

	<!-- navigation -->
	<div id="navigation">
		<div class="naviwrap">
			<a href="<%=request.getContextPath()%>" class="nv_home">HOME</a>&gt;
			<navi> <a href="<%=request.getContextPath()%>/board/pr/prlist">홍보게시판</a>&gt;
			<a href="<%=request.getContextPath()%>/board/event/list"
				class="navi_ov">이벤트</a>&gt; </navi>
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
	
	
	</div>
		<!--quick  -->
		<%@ include file="/WEB-INF/views/board/commons/quick.jsp"%>

	<!-- //container -->
</div>