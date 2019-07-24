<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="contentswrap">

	<!-- subvisual -->
	<div id="subvisual">
		<div class="subv_performance">
			<div class="subv_pat">
				<p>
					<strong><img src="/resources/images/ma_service_type.png"
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
				href="<%=request.getContextPath()%>/board/board/adlist">광고게시판</a>
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
			<h3 class="cnt_ti">상세보기</h3>
			<div id="txt">
				<div class="right top_mar_15">
					<a href="adlist"> <img src="/resources/images/list.gif"
						border="0" alt="목록"></a> 
					<c:if test="${loginUser.mem_code eq ad.writer }" >	
					<a href="admodify?ad_num=${ad.ad_num }"><img
						src="/resources/images/modify.gif" alt="수정"></a> <a
						href="addelete?ad_num=${ad.ad_num }"><img
						src="/resources/images/delete.gif" alt="삭제"></a>
					</c:if>
					<c:if test="${fn:substring(loginUser.mem_code,0,2) eq 'EP' }">
						<a href="agree1"> <img
							src="<%=request.getContextPath()%>/resources/images/regist.png"
							alt="등록"></a>
					</c:if>
					<c:if test="${fn:substring(loginUser.mem_code,0,2) eq 'EP' }">
						<a href="<%=request.getContextPath()%>/agree2"> <img
							src="<%=request.getContextPath()%>/resources/images/cancel.png"
							alt="취소"></a>
					</c:if>
				</div>

				<table width="100%" class="table1" border="0" cellspacing="0"
					cellpadding="0" summary="테이블의 설명이 들어가는 부분입니다.">
					<colgroup>
						<col style="width: 96px;">
						<col style="width: 544px;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="t_head t_left center">제목</th>
							<td class="t_end">${ad.title }</td>
						</tr>
						<tr>
							<th scope="row" class="t_head t_left center">작성자</th>
							<td class="t_end">${ad.writer }</td>
						</tr>

						<tr>
							<th scope="row" class="t_head t_left center">작성일</th>
							<td class="t_end">${ad.regist_date }</td>
						</tr>

						<tr>
							<th scope="row" class="t_head t_left center">이미지</th>
							<td>	
								
								<img src="${ad.thumbimg}" class="thumbImg" />
							</td>
						</tr>

						<td class="t_end EditText" colspan="2">${ad.cont}</td>
					</tbody>
				</table>




			</div>




		</div>
	</div>
	<!-- //container -->
</div>

