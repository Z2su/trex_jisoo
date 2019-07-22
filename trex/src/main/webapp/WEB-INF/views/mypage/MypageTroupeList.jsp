<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/Perform.css"
	type="text/css" media="all">
<div id="contentswrap">

	<!-- subvisual -->
	<div id="subvisual">
		<div class="subv_performance">
			<div class="subv_pat">
				<p>
					<strong></strong> 문화로 시민을 행복하게! 대전예술의전당
				</p>
			</div>
		</div>
	</div>
	<!-- //subvisual -->

	<!-- navigation -->
	<div id="navigation">
		<div class="naviwrap">
			<a href="<%=request.getContextPath()%>/">HOME</a>&gt;
			<navi> <a
				href="<%=request.getContextPath()%>/mypage/MypageTroureList ">마이페이지</a>&gt;
			<a href="<%=request.getContextPath()%>/mypage/MypageTroureList ">공연단정보조회</a>
			</navi>
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
			<h3 class="cnt_ti">공연단정보조회</h3>

			<div id="txt">
				<div class="dot_line bott_mar_15"></div>

				<h4 class="top_mar_100">개인정보</h4>
				<table cellpadding="0" cellspacing="0" width="100%" border="0"
					class="table1">
					<tbody class="text-center">

						<tr>
							<td>회원코드</td>
							<td><input type="tro_code" value="${troupe.tro_code}"
								readonly="readonly"></td>
						</tr>

						<tr>
							<td>* 아이디</td>
							<td><input type="id" value="${loginUser.mem_id}"
								readonly="readonly"></td>
						</tr>

						<tr>
							<td>* 패스워드</td>
							<td><input type="pwd" value="${loginUser.mem_pwd}"
								readonly=""></td>
						</tr>

						<div id="txt">
					<table cellpadding="0" cellspacing="0" width="100%" border="0" class="table1">

						<tbody class="text-center">
							<tr>
								<td>* 사업자 번호</td>
							<td>
								<input type="name" value="${troupe.bupanum}"readonly="readonly">
							</td>
							</tr>
							<tr>
								<td>* 사업자 이름</td>
								<td><input type="birth" value="${troupe.name}"
									readonly="readonly"></td>
							</tr>
							<tr>
								<td>* 주소</td>
								<td><input type="address" value="${gmem.address}"
									readonly="readonly"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="mile" value="${loginUser.mem_email}"
									readonly="readonly"></td>
							</tr>
						
					</tbody>
				</table>
			</div>
		</div>

			<div class="board_butt">
				<button type="button" id="ModifyBtn">수정</button>
			</div>
			
			<script>
				$('#ModifyBtn').on('click', function(e) {
					location="<%=request.getContextPath()%>/mypage/MypageTroupeModify"
				});
			</script>
		</div>

		<!-- //container -->
	</div>