<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/Perform.css"
	type="text/css" media="all">
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
			<a href="<%=request.getContextPath()%>/">HOME</a>&gt;
			<navi> <a
				href="<%=request.getContextPath()%>/mypage/MypageTroureList">마이페이지</a>&gt;
			<a href="<%=request.getContextPath()%>/mypage/MypageTroureModify">공연단정보수정</a>
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
		<div id="txt">

			<div class="dot_line bott_mar_15"></div>

			<form name="inputFrm"
				action="https://www.djac.or.kr/_prog/_member/index.php"
				method="post" onsubmit="return mform_submit();">
				<input type="hidden" name="mode" value="MR"> <input
					type="hidden" name="user_mng_no" value="227373"> <input
					type="hidden" name="site_dvs_cd" value="kr"> <input
					type="hidden" name="menu_dvs_cd" value="060401"> <input
					type="hidden" name="idChk" value="1"> <input type="hidden"
					name="user_dvs_cd" value="1">

				<h4 class="top_mar_20">개인정보</h4>
				<table cellpadding="0" cellspacing="0" width="100%" border="0"
					class="table1">
					<tbody>
						<tr>
							<th class="t_body" scope="row" width="150">회원코드</th>
							<td class="td_top t_end"><input type="text" name="nm"
								value="" class="w150" maxlength="10" readonly=""></td>
						</tr>

						<tr>
							<th class="t_body" scope="row" width="150">* 이름</th>
							<td class="td_top t_end"><input type="text" name="nm"
								value="" class="w150" maxlength="10" readonly=""></td>
						</tr>

						<tr>
							<th class="t_body" scope="row" width="150">* 사업자번호</th>
							<td class="td_top t_end"><input type="text" name="nm"
								value="" class="w150" maxlength="10" readonly=""></td>
						</tr>


					</tbody>
				</table>

				<div class="top_mar_10 center">
					<p class="center top_mar_20">
						<input type="button" name="modifyBtn" value="수정">
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" name="cancellBtn"
							value="취소">
					</p>
				</div>
				<div class="pr_member_dot"></div>
			</form>

			<!-- //container -->
		</div>

	</div>