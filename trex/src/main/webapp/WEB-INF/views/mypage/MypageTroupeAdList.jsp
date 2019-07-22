<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="adList" value="${dataMap.adList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />

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
			<a href="<%=request.getContextPath() %>/mypage/MypageTroupeList">마이페이지</a>&gt;<a
				href="<%=request.getContextPath() %>/mypage/MypageTroupeAdList">광고신청조회</a>
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
			<h3 class="cnt_ti">광고신청조회</h3>
			<form id="search" action="list" method="post">
				<input name="page" type="hidden" value="${pageMaker.cri.page }">
				<input name="perPageNum" type="hidden"
					value="${pageMaker.cri.perPageNum }">
			<!-- 상단 우측버튼 -->
				<div class="wizard-actions-L"
					style="margin: 10px 0; padding: 0 10px; text-align: right">

					<div class="wizard-inner-R">
						<select id="searchType" name="searchType" style="width: 100px;"
							text class="form-control">
							<option value="">검색구분</option>
							<option value="t"
								${pageMaker.cri.searchType eq 't' ? 'selected':'' }>제목</option>
							<option value="w"
								${pageMaker.cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
							<option value="c"
								${pageMaker.cri.searchType eq 'c' ? 'selected':'' }>본문</option>
							<option value="tc"
								${pageMaker.cri.searchType eq 'tc' ? 'selected':'' }>제목+본문</option>
							<option value="cw"
								${pageMaker.cri.searchType eq 'cw' ? 'selected':'' }>본문+작성자</option>
							<option value="tcw"
								${pageMaker.cri.searchType eq 'tcw' ? 'selected':'' }>제목+본문+작성자</option>
						</select>

						<div class="input-group">
							<input id="searchValue" name="keyword"
								style="width: 100px; margin-left: 5px; border-radius: 0px !important;"
								placeholder="Search for ..." class="form-control" type="text"
								value="${pageMaker.cri.keyword }"> <span id="gridSearch"
								class="input-group-btn" style="display: inline;">
								<button type="button" id="searchADBtn"	class="btn btn-sm btn-white">검색</button>
							</span>
						</div>
						<span id="gridSearchReset" style="display: none;">
							<button type="button" class="btn btn-sm btn-white">
								<i class="red ace-icon fa fa-times bigger-120"></i>
							</button>
						</span>
					</div>

				</div>
				<!-- 상단 우측버튼 -->
				
			</form>
			<br />
			<table width="100%" class="table1 center" border="0" cellspacing="0"
				cellpadding="0">

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
					<c:if test="${!empty adList }">
						<c:forEach items="${adList }" var="adVO">
							<tr>
								<th scope="col">${adVO.ad_num }</th>
								<th scope="col"><a href="addetail?ad_num=${adVO.ad_num }">${adVO.title }</a></th>
								<th scope="col">${adVO.writer }</th>
								<th scope="col">${adVO.regist_date }</th>
							<c:choose>
							<c:when test= "${adVO.app_result eq 0}">
							<th scope="col">대기중</th>
							</c:when>
							<c:when test="${adVO.app_result eq 1}">
							<th scope="col">승인</th>
							</c:when>
							<c:when test="${adVO.app_result eq 2}">
							<th scope="col">거절</th>
							</c:when>
							<c:otherwise>
							<th scope="col"> 왜 안나와? </th>
							</c:otherwise>
							</c:choose>								
							</tr>
						</c:forEach>
					</c:if>
					<tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<!-- //container -->
</div>