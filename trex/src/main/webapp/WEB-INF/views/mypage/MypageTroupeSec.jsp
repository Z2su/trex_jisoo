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
			<navi> 
				<a href="<%=request.getContextPath()%>/mypage/MypageTroureList">마이페이지</a>&gt;
				<a href="<%=request.getContextPath()%>/mypage/MypageTroureSec">회원탈퇴</a>&gt;
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
			<h3 class="cnt_ti">회원탈퇴</h3>
			<div id="txt">
				<div class="dot_line bott_mar_15"></div>
				<h4 class="top_mar_100">개인정보</h4>
				<table cellpadding="0" cellspacing="0" width="100%" border="0"
					class="table1">
					<tr>
						<th class="t_body" scope="row" width="150">회원코드</th>
						<td class="td_top t_end"></td>
					</tr>
					<tr>
						<th class="t_body" scope="row" width="150">* 이름</th>
						<td class="td_top t_end"></td>
					</tr>
					<tr>
						<th class="t_body" scope="row" width="150">* 사업자번호</th>
						<td class="td_top t_end"></td>
					</tr>
					</tbody>
				</table>

				<div class="box-footer login-box" style="margin-top: 0; border-top: none;">
					<button type="button" id="modifyBtn" class="btn btn-warning col-sm-3">탈퇴하기</button>
					<button type="button" id="cancelBtn" class="btn btn-default pull-right col-sm-3">취 소</button>
			    </div>
		</div>

		<script>
			${'#modifyBtn'}.on('click',function(e){
				"location.href='/mypage/MypageMemberModify"
			});
			${'#cancelBtn'}.on('click',function(e){
				"location.href='/"
			});
		</script>
	</div>
			<!-- //container -->
		</div>
	</div>