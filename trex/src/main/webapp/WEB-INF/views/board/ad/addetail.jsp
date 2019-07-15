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
			<navi>
			<a href="<%=request.getContextPath() %>/board/board/prlist">게시판</a>&gt;<a
				href="<%=request.getContextPath() %>/board/board/adlist">광고게시판</a>
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
			<h3 class="cnt_ti">광고 리스트</h3>
			<table width="100%" class="table1 center" border="0" cellspacing="0"
				cellpadding="0" summary="테이블의 설명이 들어가는 부분입니다.">
				<colgroup>
					<col style="width: 64px;">
					<col style="width: 320px;">
					<col style="width: 100px;">
					<col style="width: 140px;">
					<col style="width: 90px;">

				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="t_head">번호</th>
						<th scope="col" class="t_head">제목</th>
						<th scope="col" class="t_head">작성자</th>
						<th scope="col" class="t_head">작성일</th>
						<th scope="col" class="t_head t_end">승인여부</th>
					</tr>
				</thead>
				<tbody>
				
				<tbody>
					<c:if test="${!empty adlist }">
					<c:forEach items="${adlist }" var ="adVO">
					 	<tr>
						<th scope="col" >${adVO.ad_num }</th>
						<th scope="col" >${adVO.title }</th>
						<th scope="col" >${adVO.writer }</th>
						<th scope="col" >${adVO.regist_date }</th>
						<th scope="col" >${adVO.app_result }</th>
					</tr>
					 </c:forEach>
					 </c:if>
					 
					<tr>
				
					
					
				</tbody>
				
				
					
				</tbody>
				
			</table>
			<div class="board_butt" style="margin: 10px 0;padding: 0 10px; text-align: right">

					<a href="">
					<img src="<%=request.getContextPath()%>/resources/images/list.gif" alt="목록"></a> 
					<a href="#">
					<img src="<%=request.getContextPath()%>/resources/images/write.gif" alt="쓰기"></a>
			</div>
			
			<div class="pageNum"><div class="pageNum"><span class="page">1</span><a href="?&amp;GotoPage=2" class="page_ov">2</a> </div></div>

		</div>
	</div>
	<!-- //container -->
</div>