<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
			<navi> <a href="<%=request.getContextPath()%>/board/pr/prlist">게시판</a>&gt;<a
				href="<%=request.getContextPath()%>/board/pr/prlist">홍보게시판</a>&gt;<a
				href="#">상세보기</a>
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

			<table width="100%" class="table1" border="0" cellspacing="0"
				cellpadding="0" summary="테이블의 설명이 들어가는 부분입니다.">
				<caption>테이블요약이 들어가는 부분입니다.</caption>
				<colgroup>
					<col style="width: 96px;">
					<col style="width: 544px;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" class="t_head t_left center">제목</th>
						<td class="t_end">${pr.title }</td>
					</tr>
					<tr>
						<th scope="row" class="t_head t_left center">작성자</th>
						<td class="t_end">${pr.writer }</td>
					</tr>

					<tr>
						<th scope="row" class="t_head t_left center">작성일</th>
						<td class="t_end">${pr.regdate }</td>
					</tr>
					<tr>
						<th scope="row" class="t_head t_left center">내용</th>
						<td class="t_end"></td>
					</tr>
					<td class="t_end EditText" colspan="2">${pr.cont}</td>
				</tbody>
			</table>

			<div class="right top_mar_15">
				<a href="prlist"><img
					src="/images/kr/common/bt_list.gif" border="0" alt="목록"></a>
				<a
					href="prmodify?pr_num=${pr.pr_num }"><img
					src="/_prog/_board/skin/blue/img/button/cancel.gif" alt="수정"></a>
				<a
					href="prdelete?pr_num=${pr.pr_num }"><img
					src="/_prog/_board/skin/blue/img/button/list.gif" alt="삭제"></a>
			</div>


		</div>




	</div>
</div>
<!-- //container -->
</div>